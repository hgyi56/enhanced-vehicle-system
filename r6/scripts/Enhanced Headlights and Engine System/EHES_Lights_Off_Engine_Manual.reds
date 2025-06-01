module EnhancedHeadlightsEngineSystem

@addField(VehicleComponent)
// // // // // // //
// This will be the default headlights mode for all vehicles V drives.
//
public let m_currentHeadlightsState: vehicleELightMode = vehicleELightMode.Off;
// // // // // // //

@addField(VehicleComponent)
// // // // // // //
// This attribute is meant to handle the hold keyboard button event correctly so it fires only once until released.
//
public let m_headlightsButtonHeld: Bool = false;
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
public let m_cycleEngineInputHeld: Bool = false;
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

  playerPuppet.RegisterInputListener(this, n"ModdedCycleEngine");
  playerPuppet.RegisterInputListener(this, n"Accelerate");
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
    // Use this trick in case V has got out of the car with the engine running, and then got back in. The engine sound is still present but the internal logic of the car object is engine off.
    // So we turn it fully back on seemlessly when the player accelerates.
    //
    if Equals(ListenerAction.GetName(action), n"Accelerate") && vehicle.IsEngineTurnedOn() && NotEquals(this.GetVehicleControllerPS().GetState(), vehicleEState.On) {
      vehicle.TurnEngineOn(true);
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

    // // // // // // //
    // This is the button event that cycles the engine state manually.
    //
    if Equals(ListenerAction.GetName(action), n"ModdedCycleEngine") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) && !this.m_cycleEngineInputHeld {
      this.m_cycleEngineInputHeld = true;

      vehicle.TurnEngineOn(!vehicle.IsEngineTurnedOn());
      this.GetVehicleControllerPS().SetHeadLightMode(this.m_currentHeadlightsState);
    }
    if Equals(ListenerAction.GetName(action), n"ModdedCycleEngine") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_RELEASED) {
      this.m_cycleEngineInputHeld = false;
    }
    // // // // // // //
  }
}

@replaceMethod(VehicleComponent)
protected final func ToggleVehicleSystems(toggle: Bool, vehicle: Bool, engine: Bool, opt lockState: VehicleQuestEngineLockState) -> Void {

  if this.GetVehicle().IsVehicleOnStateLocked() {
    if Equals(lockState, VehicleQuestEngineLockState.DontToggleIfLocked) {
      return;
    };
    this.GetVehicle().LockVehicleOnState(false);
  };
  /*
  // // // // // // //
  // This block is :
  // Start engine:  automatic
  // Stop engine:   automatic
  //
  if vehicle {
    this.GetVehicle().TurnVehicleOn(toggle);
  };
  if engine {
    this.GetVehicle().TurnEngineOn(toggle);
  };
  // // // // // // //
  // ^ ^ ^ ^ ^ ^ ^ ^ ^
  // Remove both blocks to get the full manual engine behavior
  // v v v v v v v v v
  // // // // // // //
  // This block is :
  // Start engine:  automatic
  // Stop engine:   manual
  //
  if vehicle && toggle {
    this.GetVehicle().TurnVehicleOn(toggle);
  };
  if engine && toggle {
    this.GetVehicle().TurnEngineOn(toggle);
  };
  // // // // // // //
  */
  if !IsDefined(this.m_mountedPlayer) {
    if vehicle {
      this.GetVehicle().TurnVehicleOn(toggle);
    };
    if engine {
      this.GetVehicle().TurnEngineOn(toggle);
    };
  }
  if Equals(lockState, VehicleQuestEngineLockState.Lock) {
    this.GetVehicle().LockVehicleOnState(true);
  };
}

@wrapMethod(VehicleComponent)
protected cb func OnMountingEvent(evt: ref<MountingEvent>) -> Bool {
  let gameInstance: GameInstance = this.GetVehicle().GetGame();
  let mountChild: ref<GameObject> = GameInstance.FindEntityByID(gameInstance, evt.request.lowLevelMountingInfo.childId) as GameObject;

  wrappedMethod(evt);

  if mountChild.IsPlayer() {
    if NotEquals(this.GetVehicleControllerPS().GetState(), vehicleEState.On) {
      this.GetVehicleControllerPS().SetState(vehicleEState.On);
    }
  }

  // // // // // // //
  // We need to mark every vehicle that V gets into as the driver to apply the headlights rules. The other vehicles won't be affected until V gets in them as the driver.
  //
  if mountChild.IsPlayer() && VehicleComponent.IsDriverSlot(evt.request.lowLevelMountingInfo.slotId.id) {
    this.m_vehicleUsedByV = true;
  }
  // // // // // // //
}

@wrapMethod(VehicleComponent)
protected cb func OnVehicleStartedMountingEvent(evt: ref<VehicleStartedMountingEvent>) -> Bool {
  wrappedMethod(evt);

  if !evt.isMounting && IsDefined(this.m_mountedPlayer) {
    if NotEquals(this.GetVehicleControllerPS().GetState(), vehicleEState.Default) {
      this.GetVehicleControllerPS().SetState(vehicleEState.Default);
    }

    if NotEquals(this.GetVehicleControllerPS().GetHeadLightMode(), this.m_currentHeadlightsState) {
      this.GetVehicleControllerPS().SetHeadLightMode(this.m_currentHeadlightsState);
    }
  }
}

@wrapMethod(VehicleComponent)
protected cb func OnVehicleFinishedMountingEvent(evt: ref<VehicleFinishedMountingEvent>) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  wrappedMethod(evt);

  if evt.isMounting && IsDefined(this.m_mountedPlayer) {
    // // // // // // //
    // If the player gets in the car and the engine is still on, then get all systems on ready to go.
    // If the player gets in the car and the engine is off, get systems on ready for engine start.
    //
    if vehicle.IsEngineTurnedOn() && NotEquals(this.GetVehicleControllerPS().GetState(), vehicleEState.On) {
      vehicle.TurnEngineOn(true);
    }
    else {
      vehicle.TurnVehicleOn(true);
    }
    // // // // // // //

    // // // // // // //
    // Fix the siren state for in case the user has installed Enhanced Police Lights System mod
    //
    if this.GetPS().GetSirenState() || this.GetPS().GetSirenLightsState() {
      this.GetVehicleController().ToggleLights(true, vehicleELightType.Utility);
      this.GetPS().SetSirenLightsState(true);
    }
    // // // // // // //
  }
  
  // // // // // // //
  // This will set lights of the vehicle when V is out of the car
  //
  if this.m_vehicleUsedByV {
    if NotEquals(this.GetVehicleControllerPS().GetHeadLightMode(), this.m_currentHeadlightsState) {
      this.GetVehicleControllerPS().SetHeadLightMode(this.m_currentHeadlightsState);
    }

    // If the engine is running or vehicle lights are activated then active the interior lights
    if vehicle.IsEngineTurnedOn() || NotEquals(this.m_currentHeadlightsState, vehicleELightMode.Off) {
      this.GetVehicleController().ToggleLights(true, vehicleELightType.Interior);
    }
  }
  // // // // // // //
}

@wrapMethod(VehicleObject)
private final func SetInteriorUIEnabled(enabled: Bool) -> Void {
  wrappedMethod(enabled);

  if this.GetVehicleComponent().m_vehicleUsedByV {
    // // // // // // //
    // This trick allows us to keep the headlights on even if the engine is off and V is out of the car.
    //
    this.GetVehicleComponent().GetVehicleControllerPS().SetState(vehicleEState.Default);
    // // // // // // //
  }
}