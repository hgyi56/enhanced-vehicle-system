@addField(VehicleComponent)
// // // // // // //
// This will be the default headlights mode for all vehicles V drives.
//
public let m_currentHeadlightsState: vehicleELightMode = vehicleELightMode.Off;
// // // // // // //

@addField(VehicleComponent)
// // // // // // //
// Only affect vehicles that V has driven. Otherwise all loaded vehicles will display the headlights state above.
//
public let m_vehicleUsedByV: Bool = false;
// // // // // // //

@addField(VehicleComponent)
// // // // // // //
// This attribute is meant to handle the hold keyboard button event correctly so it fires only once until released.
//
public let m_headlightsButtonHeld: Bool = false;
// // // // // // //

@wrapMethod(VehicleComponent)
private final func RegisterInputListener() -> Void {
  let playerPuppet: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(this.GetVehicle().GetGame()).GetLocalPlayerMainGameObject() as PlayerPuppet;

  wrappedMethod();

  // // // // // // //
  // Register additional events we need.
  //
  playerPuppet.RegisterInputListener(this, n"ModdedCycleLights");
  playerPuppet.RegisterInputListener(this, n"CameraMouseX");
  playerPuppet.RegisterInputListener(this, n"CameraMouseY");
  // // // // // // //
}

@wrapMethod(VehicleComponent)
protected cb func OnAction(action: ListenerAction, consumer: ListenerActionConsumer) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  wrappedMethod(action, consumer);

  if !IsDefined(vehicle) {
    return false;
  };

  if IsDefined(this.m_mountedPlayer) {

    // // // // // // //
    // Override the default "CycleLights" event (when the player holds [V] keyboard key). I had to cut off the default "CycleLights" event because it is hardcoded into a native class I cannot modify. This is why I created a new event called "ModdedCycleLights" that mimics the same behavior with 3 states instead of 2.
    // Event cut off and new event are done in "\\Cyberpunk 2077\r6\config\inputContexts.xml".
    //
    if Equals(ListenerAction.GetName(action), n"ModdedCycleLights") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) && !this.m_headlightsButtonHeld {
      this.m_headlightsButtonHeld = true;

      if Equals(this.m_currentHeadlightsState, vehicleELightMode.Off) {
          this.m_currentHeadlightsState = vehicleELightMode.On;
      }
      else if Equals(this.m_currentHeadlightsState, vehicleELightMode.On) {
          this.m_currentHeadlightsState = vehicleELightMode.HighBeams;
      }
      else {
          this.m_currentHeadlightsState = vehicleELightMode.Off;
      }
      this.GetVehicleControllerPS().SetHeadLightMode(this.m_currentHeadlightsState);
    }
    if Equals(ListenerAction.GetName(action), n"ModdedCycleLights") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_RELEASED) {
      this.m_headlightsButtonHeld = false;
    }
    // // // // // // //

    // // // // // // //
    // Use camera movements to update headlights. Not a perfect solution but it works pretty well !
    //
    if Equals(ListenerAction.GetName(action), n"CameraMouseX") || Equals(ListenerAction.GetName(action), n"CameraMouseY") {
      if NotEquals(this.GetVehicleControllerPS().GetHeadLightMode(), this.m_currentHeadlightsState) {
        this.GetVehicleControllerPS().SetHeadLightMode(this.m_currentHeadlightsState);
      }
    }
    // // // // // // //
  }
}

@wrapMethod(VehicleObject)
private final func SetInteriorUIEnabled(enabled: Bool) -> Void {
  wrappedMethod(enabled);

  if this.GetVehicleComponent().m_vehicleUsedByV {
    // // // // // // //
    // This trick allows us to keep the headlights on even if the engine is off and V is out of the car.
    //
    this.GetVehicleComponent().GetVehicleControllerPS().SetState(vehicleEState.Default);

    if NotEquals(this.GetVehicleComponent().GetVehicleControllerPS().GetHeadLightMode(), this.GetVehicleComponent().m_currentHeadlightsState) {
      this.GetVehicleComponent().GetVehicleControllerPS().SetHeadLightMode(this.GetVehicleComponent().m_currentHeadlightsState);
    }
    // // // // // // //
  }
}

@wrapMethod(VehicleComponent)
protected cb func OnMountingEvent(evt: ref<MountingEvent>) -> Bool {
  let gameInstance: GameInstance = this.GetVehicle().GetGame();
  let mountChild: ref<GameObject> = GameInstance.FindEntityByID(gameInstance, evt.request.lowLevelMountingInfo.childId) as GameObject;

  // // // // // // //
  // We need to mark every vehicle that V gets into as the driver to apply the headlights rules. The other vehicles won't be affected until V gets in them as the driver.
  //
  if mountChild.IsPlayer() && VehicleComponent.IsDriverSlot(evt.request.lowLevelMountingInfo.slotId.id) {
    this.m_vehicleUsedByV = true;
  }
  // // // // // // //

  wrappedMethod(evt);
}