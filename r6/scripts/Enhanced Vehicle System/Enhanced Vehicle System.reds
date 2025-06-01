native func LogChannel(channel: CName, text: script_ref<String>)

enum EHeadlightsMode {
  Off = 0,
  LowBeam = 1,
  HighBeam = 2
}

enum EEngineMode {
  Manual = 0,
  AutoStart = 1,
  Automatic = 2
}

enum ERememberDoorsState {
  No = 0,
  Yes = 1
}

enum EDoorsSpeedClosing {
  No = 0,
  Yes = 1
}

enum EAutoIgnition {
  No = 0,
  Yes = 1
}

public class ModSettings_ECS extends ScriptableSystem {

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Settings")
  @runtimeProperty("ModSettings.category.order", "1")
  @runtimeProperty("ModSettings.displayName", "Default Headlights")
  @runtimeProperty("ModSettings.description", "Default mode will be applied the first time V enters into a vehicle. Then the vehicle will always remember the current state of its headlights.")
  @runtimeProperty("ModSettings.displayValues", "\"Off\", \"Low Beam\", \"High Beam\"")
  public let defaultHeadlightsMode: EHeadlightsMode = EHeadlightsMode.LowBeam;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Settings")
  @runtimeProperty("ModSettings.category.order", "2")
  @runtimeProperty("ModSettings.displayName", "Engine")
  @runtimeProperty("ModSettings.description", "Automatic will toggle the engine when V gets in and out of a vehicle. Auto-start will only start the engine when V enters in a vehicle. Manual won't start nor stop the engine so it requires user input.")
  @runtimeProperty("ModSettings.displayValues", "\"Manual\", \"Auto-start\", \"Automatic\"")
  public let engineMode: EEngineMode = EEngineMode.AutoStart;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Settings")
  @runtimeProperty("ModSettings.category.order", "3")
  @runtimeProperty("ModSettings.displayName", "Remember doors state")
  @runtimeProperty("ModSettings.description", "Forces doors state when V has finished to get in or out of the vehicle.")
  @runtimeProperty("ModSettings.displayValues", "\"Yes\", \"No\"")
  public let rememberDoorsState: ERememberDoorsState = ERememberDoorsState.Yes;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Settings")
  @runtimeProperty("ModSettings.category.order", "4")
  @runtimeProperty("ModSettings.displayName", "Close doors when driving")
  @runtimeProperty("ModSettings.description", "Choose whether doors shall close automatically when the vehicle is moving.")
  @runtimeProperty("ModSettings.displayValues", "\"Yes\", \"No\"")
  public let doorsSpeedClosing: EDoorsSpeedClosing = EDoorsSpeedClosing.No;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Settings")
  @runtimeProperty("ModSettings.category.order", "5")
  @runtimeProperty("ModSettings.displayName", "Auto ignition")
  @runtimeProperty("ModSettings.description", "Choose whether electronics shall start up automatically when V gets in.")
  @runtimeProperty("ModSettings.displayValues", "\"Yes\", \"No\"")
  public let autoIgnition: EAutoIgnition = EAutoIgnition.Yes;

  public static func Get(gi: GameInstance) -> ref<ModSettings_ECS> {
    return GameInstance.GetScriptableSystemsContainer(gi).Get(n"ModSettings_ECS") as ModSettings_ECS;
  }

  private func OnAttach() -> Void {
    ModSettings.RegisterListenerToClass(this);
  }
  private func OnDetach() -> Void {
    ModSettings.RegisterListenerToClass(this);
  }
}

public class VehicleData extends ScriptableSystem {
  public let slidingDoorVehicleMap: ref<inkStringMap>;

  public static func Get(gi: GameInstance) -> ref<VehicleData> {
    return GameInstance.GetScriptableSystemsContainer(gi).Get(n"VehicleData") as VehicleData;
  }

  private func OnAttach() -> Void {
    let vehicleData = VehicleData.Get(this.GetGameInstance());

    vehicleData.slidingDoorVehicleMap = new inkStringMap();

    // This is the list of vehicles that use sliding doors that must not be able to toggle windows while doors are opened
    // Otherwise the window will go out of the door mesh because the window animation for these vehicles is not meant to play while doors are opened
    // All vehicles that match this list won't be able to toggle windows while doors are opened
    vehicleData.slidingDoorVehicleMap.Insert("Rayfield Aerondight", Cast<Uint64>(0)); // Aerondight "Guinevere"
    vehicleData.slidingDoorVehicleMap.Insert("Rayfield Turbo", Cast<Uint64>(0)); // Caliburn
    vehicleData.slidingDoorVehicleMap.Insert("Quadra Type66", Cast<Uint64>(0)); // Type-66 "Cthulhu" / "Javelina" / "Avenger" / "640 TS" / "Jen Rowley"
    //vehicleData.slidingDoorVehicleMap.Insert("Quadra Turbo", Cast<Uint64>(0)); // "Quadra Turbo R V-Tech" / "Quadra Turbo R 740" have no window bug with sliding doors opened (so remove this line)
    //vehicleData.slidingDoorVehicleMap.Insert("Mizutani Shion", Cast<Uint64>(0)); // Shion "Coyote" / "MZ2" have no window bug with sliding doors opened (so remove this line)
  }
}

@addField(VehicleComponent)
public let m_currentHeadlightsState: vehicleELightMode = vehicleELightMode.Off;

@addField(VehicleComponent)
public let m_temporaryHeadlightsShutOff: Bool = false;

@addField(VehicleComponent)
public let m_cycleDoorInputHeld: Bool = false;

@addField(VehicleComponent)
public let m_cycleDoorLongInputTriggered: Bool = false;

@addField(VehicleComponent)
public let m_cycleWindowInputHeld: Bool = false;

@addField(VehicleComponent)
public let m_cycleWindowLongInputTriggered: Bool = false;

@addField(VehicleComponent)
public let m_cycleDomeInputHeld: Bool = false;

@addField(VehicleComponent)
public let m_cycleDomeLongInputTriggered: Bool = false;

@addField(VehicleComponent)
public let m_interiorLightsState: Bool = true; // True because when the player gets in the vehicle the interior lights always turn on

@addField(VehicleComponent)
public let m_FL_doorState: VehicleDoorState;

@addField(VehicleComponent)
public let m_FR_doorState: VehicleDoorState;

@addField(VehicleComponent)
public let m_BL_doorState: VehicleDoorState;

@addField(VehicleComponent)
public let m_BR_doorState: VehicleDoorState;

@addField(VehicleComponent)
// // // // // // //
// This allows to only affect vehicles that V has driven. Otherwise all loaded vehicles would display the m_currentHeadlightsState.
//
public let m_vehicleUsedByV: Bool = false;
// // // // // // //

@addField(VehicleComponent)
public let m_cycleEngineLastPressTime: Float = 0.00;

@addField(VehicleComponent)
public let m_cycleEngineStep1InputHeld: Bool = false;

@addField(VehicleComponent)
public let m_cycleEngineStep2InputHeld: Bool = false;

@addField(VehicleComponent)
public let m_hasWindows: Bool = false;

@addField(VehicleComponent)
public let m_hasIncompatibleSlidingDoorsWindow: Bool = false;

@addField(VehicleComponent)
public let m_modSettings: ref<ModSettings_ECS>;

@wrapMethod(VehicleComponent)
private final func RegisterInputListener() -> Void {
  let playerPuppet: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(this.GetVehicle().GetGame()).GetLocalPlayerMainGameObject() as PlayerPuppet;

  wrappedMethod();

  // // // // // // //
  // Register additional events we need.
  //
  playerPuppet.RegisterInputListener(this, n"ModdedCycleLights");
  playerPuppet.RegisterInputListener(this, n"CameraX");
  playerPuppet.RegisterInputListener(this, n"CameraY");
  playerPuppet.RegisterInputListener(this, n"CameraMouseX");
  playerPuppet.RegisterInputListener(this, n"CameraMouseY");

  playerPuppet.RegisterInputListener(this, n"Exit");
  playerPuppet.RegisterInputListener(this, n"CycleDome");
  playerPuppet.RegisterInputListener(this, n"CycleDoor");
  playerPuppet.RegisterInputListener(this, n"CycleWindow");
  playerPuppet.RegisterInputListener(this, n"CycleEngineStep1");
  playerPuppet.RegisterInputListener(this, n"CycleEngineStep2");
  playerPuppet.RegisterInputListener(this, n"Accelerate");
  // // // // // // //
}

@wrapMethod(VehicleComponent)
protected cb func OnAction(action: ListenerAction, consumer: ListenerActionConsumer) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gameInstance: GameInstance = vehicle.GetGame();

  wrappedMethod(action, consumer);

  if !IsDefined(vehicle) {
    return false;
  };

  if IsDefined(this.m_mountedPlayer) {

    // // // // // // //
    // Hold: toggle HighBeam
    //
    if Equals(ListenerAction.GetName(action), n"ModdedCycleLights") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) {

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
    // // // // // // //

    // All user actions that cannot work on motorbikes
    if vehicle != (vehicle as BikeObject) {
      // // // // // // //
      // Listen to the Exit user input so we can save doors state before the vehicle modifies them
      if Equals(ListenerAction.GetName(action), n"Exit") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_PRESSED) {
        // Register current doors state so when the player has finished unmounting we can restore the doors state
        this.m_FL_doorState = this.GetPS().GetDoorState(EVehicleDoor.seat_front_left);
        this.m_FR_doorState = this.GetPS().GetDoorState(EVehicleDoor.seat_front_right);
        this.m_BL_doorState = this.GetPS().GetDoorState(EVehicleDoor.seat_back_left);
        this.m_BR_doorState = this.GetPS().GetDoorState(EVehicleDoor.seat_back_right);
      }
      // // // // // // //

      // // // // // // //
      // Event that toggles doors
      //
      // Short press: toggle driver door
      //
      if Equals(ListenerAction.GetName(action), n"CycleDoor") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_PRESSED) && !this.m_cycleDoorInputHeld {
        this.m_cycleDoorInputHeld = true;
      }
      if Equals(ListenerAction.GetName(action), n"CycleDoor") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_RELEASED) {

        if !this.m_cycleDoorLongInputTriggered {
          if Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_left), VehicleDoorState.Open) {
            VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetDriverSlotID());
          }
          else {

            // For some vehicles with sliding doors: if the window is opened we need to close it before we open the door because otherwise the window position will be weird once the sliding door is lift
            if this.m_hasIncompatibleSlidingDoorsWindow && Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_front_left), EVehicleWindowState.Open) {
              VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, VehicleComponent.GetDriverSlotID(), false);
            }
            VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetDriverSlotID());
          }
        }

        this.m_cycleDoorInputHeld = false;
        this.m_cycleDoorLongInputTriggered = false;
      }
      // // // // // // //

      // // // // // // //
      // Hold: toggle all doors
      //
      if Equals(ListenerAction.GetName(action), n"CycleDoor") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) {
        this.m_cycleDoorLongInputTriggered = true;

        let backLeftSeatSlotID: MountingSlotId;
        backLeftSeatSlotID.id = VehicleComponent.GetBackLeftPassengerSlotName();

        let backRightSeatSlotID: MountingSlotId;
        backRightSeatSlotID.id = VehicleComponent.GetBackRightPassengerSlotName();

        if Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_left), VehicleDoorState.Open)
        || Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_right), VehicleDoorState.Open)
        || Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_back_left), VehicleDoorState.Open)
        || Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_back_right), VehicleDoorState.Open) {

          VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetDriverSlotID());
          VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetFrontPassengerSlotID());
          VehicleComponent.CloseDoor(vehicle, backLeftSeatSlotID);
          VehicleComponent.CloseDoor(vehicle, backRightSeatSlotID);
        }
        else {
          // For some vehicles with sliding doors: if the window is opened we need to close it before we open the door because otherwise the window position will be weird once the sliding door is lift
          if this.m_hasIncompatibleSlidingDoorsWindow && Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_front_left), EVehicleWindowState.Open) {
            VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, VehicleComponent.GetDriverSlotID(), false);
          }
          VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetDriverSlotID());

          // For some vehicles with sliding doors: if the window is opened we need to close it before we open the door because otherwise the window position will be weird once the sliding door is lift
          if this.m_hasIncompatibleSlidingDoorsWindow && Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_front_right), EVehicleWindowState.Open) {
            VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, VehicleComponent.GetFrontPassengerSlotID(), false);
          }
          VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetFrontPassengerSlotID());

          // For some vehicles with sliding doors: if the window is opened we need to close it before we open the door because otherwise the window position will be weird once the sliding door is lift
          if this.m_hasIncompatibleSlidingDoorsWindow && Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_back_left), EVehicleWindowState.Open) {
            VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, backLeftSeatSlotID, false);
          }
          VehicleComponent.OpenDoor(vehicle, backLeftSeatSlotID);

          // For some vehicles with sliding doors: if the window is opened we need to close it before we open the door because otherwise the window position will be weird once the sliding door is lift
          if this.m_hasIncompatibleSlidingDoorsWindow && Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_back_right), EVehicleWindowState.Open) {
            VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, backRightSeatSlotID, false);
          }
          VehicleComponent.OpenDoor(vehicle, backRightSeatSlotID);
        }
      }
      // // // // // // //

      // // // // // // //
      // Event that toggles interior lights and crystal dome
      //
      // Short press: toggle interior lights
      //
      if Equals(ListenerAction.GetName(action), n"CycleDome") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_PRESSED) && !this.m_cycleDomeInputHeld {
        this.m_cycleDomeInputHeld = true;
      }
      if Equals(ListenerAction.GetName(action), n"CycleDome") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_RELEASED) {
        
        if !this.m_cycleDomeLongInputTriggered {
          this.m_interiorLightsState = !this.m_interiorLightsState;
          this.GetVehicleController().ToggleLights(this.m_interiorLightsState, vehicleELightType.Interior);
        }

        this.m_cycleDomeInputHeld = false;
        this.m_cycleDomeLongInputTriggered = false;
      }
      // // // // // // //

      // // // // // // //
      // Hold: toggle crystal dome
      //
      if Equals(ListenerAction.GetName(action), n"CycleDome") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) {
        this.m_cycleDomeLongInputTriggered = true;

        // Only allow crystal dome activation if the vehicle ignition is ON
        if !this.GetPS().GetCrystalDomeState() {
          this.ToggleCrystalDome(true, true);
        }
        else {
          //GameObjectEffectHelper.StartEffectEvent(vehicle, n"crystal_dome_stop", true);
          this.ToggleCrystalDome(false, true);
        }
      }
      // // // // // // //

      // Not all vehicles have movable windows. Some have a crystal dome (fixed plates with screens inside) like the Rayfield Caliburn or the Rayfield Aerondight.
      // Some others have both a crystal dome and "window plates" that can be opened as regular windows such as the nomad Thorton Colby "Little Mule".
      if this.m_hasWindows {
        // // // // // // //
        // Event that toggles windows
        //
        // Short press: toggle driver window
        //
        if Equals(ListenerAction.GetName(action), n"CycleWindow") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_PRESSED) && !this.m_cycleWindowInputHeld {
          this.m_cycleWindowInputHeld = true;
        }
        if Equals(ListenerAction.GetName(action), n"CycleWindow") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_RELEASED) {

          // Window shall only be toggleable in the following cases:
          //  - Doors are Sliding type and closed (otherwise the window animation will become weird while the door is lift)
          //  - Doors are not Sliding type
          //
          if !this.m_cycleWindowLongInputTriggered {
            if !this.m_hasIncompatibleSlidingDoorsWindow || Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_left), VehicleDoorState.Closed) {
              VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, VehicleComponent.GetDriverSlotID(), Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_front_left), EVehicleWindowState.Open) ? false : true);
            }
          }

          this.m_cycleWindowInputHeld = false;
          this.m_cycleWindowLongInputTriggered = false;
        }
        // // // // // // //

        // // // // // // //
        // Hold: toggle all windows
        //
        if Equals(ListenerAction.GetName(action), n"CycleWindow") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) {
          this.m_cycleWindowLongInputTriggered = true;

          let backLeftSeatSlotID: MountingSlotId;
          backLeftSeatSlotID.id = VehicleComponent.GetBackLeftPassengerSlotName();

          let backRightSeatSlotID: MountingSlotId;
          backRightSeatSlotID.id = VehicleComponent.GetBackRightPassengerSlotName();

          let totalSeatSlots: Int32 = 0;
          let occupiedSeatSlots: Int32 = 0;
          let reservedSeatSlots: Int32 = 0;
          VehicleComponent.GetSeatsStatus(gameInstance, vehicle, totalSeatSlots, occupiedSeatSlots, reservedSeatSlots);

          // Window shall only be toggleable in the following cases:
          //  - Doors are Sliding type and closed (otherwise the window animation will become weird while the door is lift)
          //  - Doors are not Sliding type
          //
          if Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_front_left), EVehicleWindowState.Open)
          || Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_front_right), EVehicleWindowState.Open)
          || Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_back_left), EVehicleWindowState.Open)
          || Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_back_right), EVehicleWindowState.Open) {

            if totalSeatSlots > 0 && (!this.m_hasIncompatibleSlidingDoorsWindow || Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_left), VehicleDoorState.Closed)) && Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_front_left), EVehicleWindowState.Open) {
              VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, VehicleComponent.GetDriverSlotID(), false);
            }
            if totalSeatSlots > 1 && (!this.m_hasIncompatibleSlidingDoorsWindow || Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_right), VehicleDoorState.Closed)) && Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_front_right), EVehicleWindowState.Open) {
              VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, VehicleComponent.GetFrontPassengerSlotID(), false);
            }
            if totalSeatSlots > 2 && (!this.m_hasIncompatibleSlidingDoorsWindow || Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_back_left), VehicleDoorState.Closed)) && Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_back_left), EVehicleWindowState.Open) {
              VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, backLeftSeatSlotID, false);
            }
            if totalSeatSlots > 2 && (!this.m_hasIncompatibleSlidingDoorsWindow || Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_back_right), VehicleDoorState.Closed)) && Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_back_right), EVehicleWindowState.Open) {
              VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, backRightSeatSlotID, false);
            }
          }
          else {
            if totalSeatSlots > 0 && (!this.m_hasIncompatibleSlidingDoorsWindow || Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_left), VehicleDoorState.Closed)) && Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_front_left), EVehicleWindowState.Closed) {
              VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, VehicleComponent.GetDriverSlotID(), true);
            }
            if totalSeatSlots > 1 && (!this.m_hasIncompatibleSlidingDoorsWindow || Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_right), VehicleDoorState.Closed)) && Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_front_right), EVehicleWindowState.Closed) {
              VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, VehicleComponent.GetFrontPassengerSlotID(), true);
            }
            if totalSeatSlots > 2 && (!this.m_hasIncompatibleSlidingDoorsWindow || Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_back_left), VehicleDoorState.Closed)) && Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_back_left), EVehicleWindowState.Closed) {
              VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, backLeftSeatSlotID, true);
            }
            if totalSeatSlots > 2 && (!this.m_hasIncompatibleSlidingDoorsWindow || Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_back_right), VehicleDoorState.Closed)) && Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_back_right), EVehicleWindowState.Closed) {
              VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, backRightSeatSlotID, true);
            }
          }
        }
        // // // // // // //
      }
    }

    // // // // // // //
    // Use this trick in case V has got out of the vehicle with the engine running, and then got back in. The engine sound is still present but the internal logic of the vehicle object is engine off.
    // So we turn it fully back on seemlessly when the player accelerates.
    //
    if Equals(ListenerAction.GetName(action), n"Accelerate") && vehicle.IsEngineTurnedOn() && NotEquals(this.GetVehicleControllerPS().GetState(), vehicleEState.On) {
      vehicle.TurnEngineOn(true);
    }
    // // // // // // //

    // // // // // // //
    // Use camera movements to update headlights. Not a perfect solution but it works pretty well !
    //
    if (Equals(ListenerAction.GetName(action), n"CameraMouseX") || Equals(ListenerAction.GetName(action), n"CameraMouseY") || Equals(ListenerAction.GetName(action), n"CameraX") || Equals(ListenerAction.GetName(action), n"CameraY")) && !this.m_temporaryHeadlightsShutOff {
      if NotEquals(this.GetVehicleControllerPS().GetHeadLightMode(), this.m_currentHeadlightsState) {
        this.GetVehicleControllerPS().SetHeadLightMode(this.m_currentHeadlightsState);
      }
    }
    // // // // // // //

    // // // // // // //
    // Event that toggles ignition
    //
    // Double tap
    //
    if Equals(ListenerAction.GetName(action), n"CycleEngineStep1") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_PRESSED) {

      // If the double tap span is superior to 0.5s consider this is a new double tap
      if EngineTime.ToFloat(GameInstance.GetEngineTime(vehicle.GetGame())) - this.m_cycleEngineLastPressTime > 0.5 {
        this.m_cycleEngineLastPressTime = EngineTime.ToFloat(GameInstance.GetEngineTime(vehicle.GetGame()));
      }
      else {     
        vehicle.TurnVehicleOn(!vehicle.IsVehicleTurnedOn());

        // For some reason the IsVehicleTurnedOn is reversed here
        if !vehicle.IsVehicleTurnedOn() {
          // Ignition ON
          this.m_temporaryHeadlightsShutOff = false;
          this.GetVehicleControllerPS().SetHeadLightMode(this.m_currentHeadlightsState);
          
          this.m_interiorLightsState = true; // Interior lights are automatically toggled ON, so only update the state variable
        }
        else {
          // Ignition OFF
          this.m_temporaryHeadlightsShutOff = true;
          this.m_interiorLightsState = false; // Interior lights are automatically toggled OFF, so only update the state variable
        }
      }
    }
    // // // // // // //

    // // // // // // //
    // First step of the CycleEngine HOLD event: turn the engine off.
    //
    if Equals(ListenerAction.GetName(action), n"CycleEngineStep1") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) && !this.m_cycleEngineStep1InputHeld {
      this.m_cycleEngineStep1InputHeld = true;

      // When turning the engine ON without ignition first, the interior lights always lights up automatically with auto-ignition
      if !vehicle.IsVehicleTurnedOn() {        
        this.m_interiorLightsState = true;
      }

      vehicle.TurnEngineOn(!vehicle.IsEngineTurnedOn());

      if vehicle.IsEngineTurnedOn() {
        this.m_temporaryHeadlightsShutOff = false;
      }
      this.GetVehicleControllerPS().SetHeadLightMode(this.m_currentHeadlightsState);
    }
    if Equals(ListenerAction.GetName(action), n"CycleEngineStep1") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_RELEASED) {
      this.m_cycleEngineStep1InputHeld = false;
    }
    // // // // // // //
    
    // // // // // // //
    // Second step of the CycleEngine HOLD event: turn the headlights off.
    //
    if Equals(ListenerAction.GetName(action), n"CycleEngineStep2") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) && !this.m_cycleEngineStep2InputHeld && !vehicle.IsEngineTurnedOn() {
      this.m_cycleEngineStep2InputHeld = true;

      // Turn the headlights off but do not remember the Off state so when V gets back in the vehicle the headlights will turn into their previous state.
      this.GetVehicleControllerPS().SetHeadLightMode(vehicleELightMode.Off);
      this.m_temporaryHeadlightsShutOff = true;
    }
    if Equals(ListenerAction.GetName(action), n"CycleEngineStep2") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_RELEASED) {
      this.m_cycleEngineStep2InputHeld = false;
    }
    // // // // // // //
  }
}

@replaceMethod(VehicleComponent)
protected final func ToggleVehicleSystems(toggle: Bool, vehicle: Bool, engine: Bool, opt lockState: VehicleQuestEngineLockState) -> Void {
  let vehicleObj: ref<VehicleObject> = this.GetVehicle();

  if vehicleObj.IsVehicleOnStateLocked() {
    if Equals(lockState, VehicleQuestEngineLockState.DontToggleIfLocked) {
      return;
    };
    vehicleObj.LockVehicleOnState(false);
  };
  if IsDefined(this.m_mountedPlayer) {
    if NotEquals(this.m_modSettings.engineMode, EEngineMode.Manual) {

      if Equals(this.m_modSettings.engineMode, EEngineMode.Automatic) {
        // // // // // // //
        // This block is :
        // Start engine:  automatic
        // Stop engine:   automatic
        //
        if vehicle {
          vehicleObj.TurnVehicleOn(toggle);
        };
        if engine {
          vehicleObj.TurnEngineOn(toggle);
        };
        // // // // // // //
      }
      else if Equals(this.m_modSettings.engineMode, EEngineMode.AutoStart) {
        // // // // // // //
        // This block is :
        // Start engine:  automatic
        // Stop engine:   manual
        //
        if vehicle && toggle {
          vehicleObj.TurnVehicleOn(toggle);
        };
        if engine && toggle {
          vehicleObj.TurnEngineOn(toggle);
        };
        // // // // // // //
      }
    }
  }
  else {
    if vehicle {
      vehicleObj.TurnVehicleOn(toggle);
    };
    if engine {
      vehicleObj.TurnEngineOn(toggle);
    };
  }
  if Equals(lockState, VehicleQuestEngineLockState.Lock) {
    vehicleObj.LockVehicleOnState(true);
  };
}

@wrapMethod(VehicleComponent)
protected cb func OnMountingEvent(evt: ref<MountingEvent>) -> Bool {

  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gameInstance: GameInstance = vehicle.GetGame();
  let mountChild: ref<GameObject> = GameInstance.FindEntityByID(gameInstance, evt.request.lowLevelMountingInfo.childId) as GameObject;

  wrappedMethod(evt);

  if mountChild.IsPlayer() && VehicleComponent.IsDriverSlot(evt.request.lowLevelMountingInfo.slotId.id) {

    // // // // // // //
    // We need to mark every vehicle that V gets into as the driver to apply the headlights rules. The other vehicles won't be affected until V gets in them as the driver.
    //
    if NotEquals(this.GetVehicleControllerPS().GetState(), vehicleEState.On) {
      this.GetVehicleControllerPS().SetState(vehicleEState.On);
    }

    // Reset the temporary headlights shut off
    this.m_temporaryHeadlightsShutOff = false;
    
    // Interior lights are automatically toggled ON, so only update the state variable
    this.m_interiorLightsState = true;

    // Only the first time V enters into this vehicle, set the headlights to default state
    if !this.m_vehicleUsedByV {
      this.m_modSettings = ModSettings_ECS.Get(vehicle.GetGame());
      this.m_currentHeadlightsState = IntEnum<vehicleELightMode>(EnumInt(this.m_modSettings.defaultHeadlightsMode));

      let vehDataPackage: wref<VehicleDataPackage_Record>;
      VehicleComponent.GetVehicleDataPackage(gameInstance, vehicle, vehDataPackage);

      this.m_hasWindows = vehDataPackage.WindowsRollDown();

      let vehicleRecord: ref<Vehicle_Record>;
      VehicleComponent.GetVehicleRecord(gameInstance, this.m_mountedPlayer, vehicleRecord);
      
      let vehicleModel : String = s"\(vehicleRecord.Manufacturer().EnumName()) \(vehicleRecord.Model().EnumName())";

      if VehicleData.Get(gameInstance).slidingDoorVehicleMap.KeyExist(vehicleModel) {
        this.m_hasIncompatibleSlidingDoorsWindow = true;
      }
    }

    this.m_vehicleUsedByV = true;
    // // // // // // //
  }
}

@wrapMethod(VehicleComponent)
protected cb func OnVehicleStartedMountingEvent(evt: ref<VehicleStartedMountingEvent>) -> Bool {

  if !evt.isMounting && IsDefined(this.m_mountedPlayer) {
    if NotEquals(this.GetVehicleControllerPS().GetState(), vehicleEState.Default) {
      this.GetVehicleControllerPS().SetState(vehicleEState.Default);
    }

    if !this.m_temporaryHeadlightsShutOff && NotEquals(this.GetVehicleControllerPS().GetHeadLightMode(), this.m_currentHeadlightsState) {
      this.GetVehicleControllerPS().SetHeadLightMode(this.m_currentHeadlightsState);
    }
  }

  wrappedMethod(evt);
}

@wrapMethod(VehicleComponent)
protected cb func OnVehicleFinishedMountingEvent(evt: ref<VehicleFinishedMountingEvent>) -> Bool {

  let vehicle: ref<VehicleObject> = this.GetVehicle();

  wrappedMethod(evt);

  if evt.isMounting && IsDefined(this.m_mountedPlayer) {
    // // // // // // //
    // If the player gets in the vehicle and the engine is still on, then get all systems on ready to go.
    // If the player gets in the vehicle and the engine is off, get systems on ready for engine start.
    //
    if vehicle.IsEngineTurnedOn() && NotEquals(this.GetVehicleControllerPS().GetState(), vehicleEState.On) {
      vehicle.TurnEngineOn(true);
    }
    else {
      vehicle.TurnVehicleOn(true);
    }
    // // // // // // //

    // Turn off ignition if required by the mod settings
    if Equals(this.m_modSettings.autoIgnition, EAutoIgnition.No) && !vehicle.IsEngineTurnedOn() {
      vehicle.TurnVehicleOn(false);
      this.m_temporaryHeadlightsShutOff = true;
      this.m_interiorLightsState = false;
    }
  }

  // // // // // // //
  // This will set lights of the vehicle when V is out of the vehicle
  //
  if this.m_vehicleUsedByV {
    if !this.m_temporaryHeadlightsShutOff && NotEquals(this.GetVehicleControllerPS().GetHeadLightMode(), this.m_currentHeadlightsState) {
      this.GetVehicleControllerPS().SetHeadLightMode(this.m_currentHeadlightsState);
    }

    // If the engine is running or vehicle lights are activated then active the interior lights
    if vehicle.IsEngineTurnedOn() || (NotEquals(this.m_currentHeadlightsState, vehicleELightMode.Off) && !this.m_temporaryHeadlightsShutOff) {
      this.GetVehicleController().ToggleLights(true, vehicleELightType.Interior);
      this.m_interiorLightsState = true;
    }

    // Force door states when V has finished entering or exiting the vehicle
    if Equals(this.m_modSettings.rememberDoorsState, ERememberDoorsState.Yes) {
      this.ForceVehicleDoorsState();
    }
  }
  // // // // // // //
}

@wrapMethod(VehicleComponent)
protected final func OnVehicleSpeedChange(speed: Float) -> Void {
  
  // Prevent vehicles from closing doors when moving if necessary
  if Equals(this.m_modSettings.doorsSpeedClosing, EDoorsSpeedClosing.Yes) {
    wrappedMethod(speed);
  }
}

@addMethod(VehicleComponent)
private final func ForceVehicleDoorsState() -> Void {
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  let backLeftSeatSlotID: MountingSlotId;
  backLeftSeatSlotID.id = VehicleComponent.GetBackLeftPassengerSlotName();

  let backRightSeatSlotID: MountingSlotId;
  backRightSeatSlotID.id = VehicleComponent.GetBackRightPassengerSlotName();

  if NotEquals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_left), this.m_FL_doorState) {
    if Equals(this.m_FL_doorState, VehicleDoorState.Open) {
      VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetDriverSlotID());
    }
    else {
      VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetDriverSlotID());
    }
  }
  
  if NotEquals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_right), this.m_FR_doorState) {
    if Equals(this.m_FR_doorState, VehicleDoorState.Open) {
      VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetFrontPassengerSlotID());
    }
    else {
      VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetFrontPassengerSlotID());
    }
  }
  
  if NotEquals(this.GetPS().GetDoorState(EVehicleDoor.seat_back_left), this.m_BL_doorState) {
    if Equals(this.m_BL_doorState, VehicleDoorState.Open) {
      VehicleComponent.OpenDoor(vehicle, backLeftSeatSlotID);
    }
    else {
      VehicleComponent.CloseDoor(vehicle, backLeftSeatSlotID);
    }
  }
  
  if NotEquals(this.GetPS().GetDoorState(EVehicleDoor.seat_back_right), this.m_BR_doorState) {
    if Equals(this.m_BR_doorState, VehicleDoorState.Open) {
      VehicleComponent.OpenDoor(vehicle, backRightSeatSlotID);
    }
    else {
      VehicleComponent.CloseDoor(vehicle, backRightSeatSlotID);
    }
  }
}