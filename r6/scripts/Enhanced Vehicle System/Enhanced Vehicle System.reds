native func LogChannel(channel: CName, text: script_ref<String>)

enum EHeadlightsMode {
  Off = 0,
  LowBeam = 1,
  HighBeam = 2
}

enum EHeadlightsSynchronizedWithTimeMode {
  LowBeam = 0,
  HighBeam = 1
}

enum EUtilityLightsSynchronizedWithTimeVehicleType {
  No = 0,
  Motorcycles = 1,
  AllVehicles = 2
}

enum EUtilityLightsMode {
  Off = 0,
  MotorcyclesActive = 1,
  AllVehiclesActive = 2
}

enum EUtilityLightsColorVehicleType {
  Motorcycles = 0,
  AllVehicles = 1
}

enum EUtilityLightsColorCycleType {
  Solid = 0,
  Blinker = 1,
  Beacon = 2,
  Pulse = 3,
  TwoColorsCycle = 4,
  Rainbow = 5
}

enum EEnterBehavior {
  KeepCurrentState = 0,
  PowerOn = 1,
  StartEngine = 2
}

enum EExitBehavior {
  KeepCurrentState = 0,
  StopEngine = 1,
  PowerOff = 2
}

enum EDoorsDriveClosing {
  No = 0,
  OnStartMoving = 1,
  CustomSpeed = 2
}

enum EMomentumType {
  Stable = 0,
  Decelerate = 1,
  Accelerate = 2
}

public class ModSettings_EVS extends ScriptableSystem {

  /////////////////////////
  // POWER STATE
  /////////////////////////

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Power state")
  @runtimeProperty("ModSettings.category.order", "1")
  @runtimeProperty("ModSettings.displayName", "On enter")
  @runtimeProperty("ModSettings.description", "Choose whether power state and engine shall keep their current state or start when entering a vehicle.")
  @runtimeProperty("ModSettings.displayValues.KeepCurrentState", "Keep current state")
  @runtimeProperty("ModSettings.displayValues.PowerOn", "Power on")
  @runtimeProperty("ModSettings.displayValues.StartEngine", "Start engine")
  public let enterBehavior: EEnterBehavior = EEnterBehavior.KeepCurrentState;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Power state")
  @runtimeProperty("ModSettings.category.order", "1")
  @runtimeProperty("ModSettings.displayName", "On exit")
  @runtimeProperty("ModSettings.description", "Choose whether power state and engine shall keep their current state or shutdown when exiting a vehicle.")
  @runtimeProperty("ModSettings.displayValues.KeepCurrentState", "Keep current state")
  @runtimeProperty("ModSettings.displayValues.StopEngine", "Stop engine")
  @runtimeProperty("ModSettings.displayValues.PowerOff", "Power off")
  public let exitBehavior: EExitBehavior = EExitBehavior.KeepCurrentState;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Power state")
  @runtimeProperty("ModSettings.category.order", "1")
  @runtimeProperty("ModSettings.displayName", "Prevent shutdown during combat")
  @runtimeProperty("ModSettings.description", "Prevents the player from accidentally toggling the power off or the engine off during combat.")
  public let preventPowerOffDuringCombat: Bool = true;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Power state")
  @runtimeProperty("ModSettings.category.order", "1")
  @runtimeProperty("ModSettings.displayName", "Auto-start engine during combat")
  @runtimeProperty("ModSettings.description", "Allows the player to automatically start the vehicle during combat.")
  public let autoStartEngineDuringCombat: Bool = true;

  /////////////////////////
  // HEADLIGHTS
  /////////////////////////

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Headlights")
  @runtimeProperty("ModSettings.category.order", "2")
  @runtimeProperty("ModSettings.displayName", "Synchronized with time")
  @runtimeProperty("ModSettings.description", "Headlights will toggle automatically depending on the current time.")
  public let headlightsSynchronizedWithTimeEnabled: Bool = false;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Headlights")
  @runtimeProperty("ModSettings.category.order", "2")
  @runtimeProperty("ModSettings.displayName", "Default mode")
  @runtimeProperty("ModSettings.description", "Default mode will be applied the first time V enters into a vehicle and time sync is disabled. Then the vehicle will always remember the current state of its headlights.")
  @runtimeProperty("ModSettings.displayValues.Off", "Off")
  @runtimeProperty("ModSettings.displayValues.LowBeam", "Low beam")
  @runtimeProperty("ModSettings.displayValues.HighBeam", "High beam")
  public let defaultHeadlightsMode: EHeadlightsMode = EHeadlightsMode.LowBeam;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Headlights")
  @runtimeProperty("ModSettings.category.order", "2")
  @runtimeProperty("ModSettings.displayName", "Night mode")
  @runtimeProperty("ModSettings.description", "Define the headlights mode to use at night by default if the user did not already set either low or high beam mode.")
  @runtimeProperty("ModSettings.displayValues.LowBeam", "Low beam")
  @runtimeProperty("ModSettings.displayValues.HighBeam", "High beam")
  public let headlightsSynchronizedWithTimeMode: EHeadlightsSynchronizedWithTimeMode = EHeadlightsSynchronizedWithTimeMode.LowBeam;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Headlights")
  @runtimeProperty("ModSettings.category.order", "2")
  @runtimeProperty("ModSettings.displayName", "Include utility lights")
  @runtimeProperty("ModSettings.description", "Utility lights will toggle automatically for the following vehicle types.")
  @runtimeProperty("ModSettings.displayValues.No", "No")
  @runtimeProperty("ModSettings.displayValues.Motorcycles", "Motorcycles")
  @runtimeProperty("ModSettings.displayValues.AllVehicles", "All vehicles")
  public let utilityLightsSynchronizedWithTimeVehicleType: EUtilityLightsSynchronizedWithTimeVehicleType = EUtilityLightsSynchronizedWithTimeVehicleType.Motorcycles;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Headlights")
  @runtimeProperty("ModSettings.category.order", "2")
  @runtimeProperty("ModSettings.displayName", "Turn on hour")
  @runtimeProperty("ModSettings.step", "1")
  @runtimeProperty("ModSettings.min", "0")
  @runtimeProperty("ModSettings.max", "23")
  public let headlightsTurnOnHour: Int32 = 20;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Headlights")
  @runtimeProperty("ModSettings.category.order", "2")
  @runtimeProperty("ModSettings.displayName", "Turn on minute")
  @runtimeProperty("ModSettings.step", "1")
  @runtimeProperty("ModSettings.min", "0")
  @runtimeProperty("ModSettings.max", "59")
  public let headlightsTurnOnMinute: Int32 = 0;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Headlights")
  @runtimeProperty("ModSettings.category.order", "2")
  @runtimeProperty("ModSettings.displayName", "Turn off hour")
  @runtimeProperty("ModSettings.step", "1")
  @runtimeProperty("ModSettings.min", "0")
  @runtimeProperty("ModSettings.max", "23")
  public let headlightsTurnOffHour: Int32 = 5;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Headlights")
  @runtimeProperty("ModSettings.category.order", "2")
  @runtimeProperty("ModSettings.displayName", "Turn off minute")
  @runtimeProperty("ModSettings.step", "1")
  @runtimeProperty("ModSettings.min", "0")
  @runtimeProperty("ModSettings.max", "59")
  public let headlightsTurnOffMinute: Int32 = 0;

  /////////////////////////
  // UTILITY LIGHTS
  /////////////////////////

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Utility lights")
  @runtimeProperty("ModSettings.category.order", "3")
  @runtimeProperty("ModSettings.displayName", "Synchronized with headlights shutoff")
  @runtimeProperty("ModSettings.description", "Choose if utility lights (neon rims, spotlights...) shall be connected to the headlights shutoff.")
  public let utilityLightsSynchronizedWithHeadlightsShutoff: Bool = true;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Utility lights")
  @runtimeProperty("ModSettings.category.order", "3")
  @runtimeProperty("ModSettings.displayName", "Default mode")
  @runtimeProperty("ModSettings.description", "Default mode will be applied the first time V enters into a vehicle. Then the vehicle will always remember the current state of its utility lights.")
  @runtimeProperty("ModSettings.displayValues.Off", "Off")
  @runtimeProperty("ModSettings.displayValues.MotorcyclesActive", "Active for motorcycles")
  @runtimeProperty("ModSettings.displayValues.AllVehiclesActive", "Active for all vehicles")
  public let defaultUtilityLightsMode: EUtilityLightsMode = EUtilityLightsMode.MotorcyclesActive;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Utility lights")
  @runtimeProperty("ModSettings.category.order", "3")
  @runtimeProperty("ModSettings.displayName", "Color sequence")
  @runtimeProperty("ModSettings.description", "Define a custom color sequence for utility lights.")
  @runtimeProperty("ModSettings.displayValues.Solid", "Solid")
  @runtimeProperty("ModSettings.displayValues.Blinker", "Blinker")
  @runtimeProperty("ModSettings.displayValues.Beacon", "Beacon")
  @runtimeProperty("ModSettings.displayValues.Pulse", "Pulse")
  @runtimeProperty("ModSettings.displayValues.TwoColorsCycle", "Two colors cycle")
  @runtimeProperty("ModSettings.displayValues.Rainbow", "Rainbow")
  public let utilityLightsColorSequence: EUtilityLightsColorCycleType = EUtilityLightsColorCycleType.Solid;

  // Only for internal purpose
  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Utility lights")
  @runtimeProperty("ModSettings.category.order", "3")
  @runtimeProperty("ModSettings.displayName", "Color sequence memory")
  public let last_utilityLightsColorSequence: Int32 = 99;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Utility lights")
  @runtimeProperty("ModSettings.category.order", "3")
  @runtimeProperty("ModSettings.displayName", "Sequence latency")
  @runtimeProperty("ModSettings.step", "0.1")
  @runtimeProperty("ModSettings.min", "0.2")
  @runtimeProperty("ModSettings.max", "5.0")
  public let utilityLightsColorSequenceSpeed: Float = 0.8;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Utility lights")
  @runtimeProperty("ModSettings.category.order", "3")
  @runtimeProperty("ModSettings.displayName", "Impacted vehicles")
  @runtimeProperty("ModSettings.description", "Define which vehicle types will be affected by the custom settings.")
  @runtimeProperty("ModSettings.displayValues.Motorcycles", "Motorcycles")
  @runtimeProperty("ModSettings.displayValues.AllVehicles", "All vehicles")
  public let customUtilityLightsColorVehicleType: EUtilityLightsColorVehicleType = EUtilityLightsColorVehicleType.Motorcycles;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Utility lights")
  @runtimeProperty("ModSettings.category.order", "3")
  @runtimeProperty("ModSettings.displayName", "Custom intensity")
  @runtimeProperty("ModSettings.description", "Define a custom light intensity for utility lights.")
  public let customUtilityLightsIntensityEnabled: Bool = false;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Utility lights")
  @runtimeProperty("ModSettings.category.order", "3")
  @runtimeProperty("ModSettings.displayName", "Intensity")
  @runtimeProperty("ModSettings.step", "1")
  @runtimeProperty("ModSettings.min", "0")
  @runtimeProperty("ModSettings.max", "100")
  public let utilityLightsColorIntensity: Int32 = 50;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Utility lights")
  @runtimeProperty("ModSettings.category.order", "3")
  @runtimeProperty("ModSettings.displayName", "Custom color")
  @runtimeProperty("ModSettings.description", "Define a custom RGB color for utility lights.")
  public let customUtilityLightsColorEnabled: Bool = false;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Utility lights")
  @runtimeProperty("ModSettings.category.order", "3")
  @runtimeProperty("ModSettings.displayName", "Custom color - red")
  @runtimeProperty("ModSettings.step", "1")
  @runtimeProperty("ModSettings.min", "0")
  @runtimeProperty("ModSettings.max", "255")
  public let R_utilityLightsColor: Int32 = 255;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Utility lights")
  @runtimeProperty("ModSettings.category.order", "3")
  @runtimeProperty("ModSettings.displayName", "Custom color - green")
  @runtimeProperty("ModSettings.step", "1")
  @runtimeProperty("ModSettings.min", "0")
  @runtimeProperty("ModSettings.max", "255")
  public let G_utilityLightsColor: Int32 = 110;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Utility lights")
  @runtimeProperty("ModSettings.category.order", "3")
  @runtimeProperty("ModSettings.displayName", "Custom color - blue")
  @runtimeProperty("ModSettings.step", "1")
  @runtimeProperty("ModSettings.min", "0")
  @runtimeProperty("ModSettings.max", "255")
  public let B_utilityLightsColor: Int32 = 0;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Utility lights")
  @runtimeProperty("ModSettings.category.order", "3")
  @runtimeProperty("ModSettings.displayName", "Cycle color - red")
  @runtimeProperty("ModSettings.step", "1")
  @runtimeProperty("ModSettings.min", "0")
  @runtimeProperty("ModSettings.max", "255")
  public let R_cycle_utilityLightsColor: Int32 = 255;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Utility lights")
  @runtimeProperty("ModSettings.category.order", "3")
  @runtimeProperty("ModSettings.displayName", "Cycle color - green")
  @runtimeProperty("ModSettings.step", "1")
  @runtimeProperty("ModSettings.min", "0")
  @runtimeProperty("ModSettings.max", "255")
  public let G_cycle_utilityLightsColor: Int32 = 110;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Utility lights")
  @runtimeProperty("ModSettings.category.order", "3")
  @runtimeProperty("ModSettings.displayName", "Cycle color - blue")
  @runtimeProperty("ModSettings.step", "1")
  @runtimeProperty("ModSettings.min", "0")
  @runtimeProperty("ModSettings.max", "255")
  public let B_cycle_utilityLightsColor: Int32 = 0;

  /////////////////////////
  // CRYSTAL DOME
  /////////////////////////

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Crystal dome")
  @runtimeProperty("ModSettings.category.order", "4")
  @runtimeProperty("ModSettings.displayName", "Synchronized with power state")
  @runtimeProperty("ModSettings.description", "Choose if crystal dome shall toggle automatically with power state.")
  public let crystalDomeSynchronizedWithPowerState: Bool = true;

  /////////////////////////
  // DOORS
  /////////////////////////

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Doors")
  @runtimeProperty("ModSettings.category.order", "5")
  @runtimeProperty("ModSettings.displayName", "Close doors while moving")
  @runtimeProperty("ModSettings.description", "Choose how the vehicle speed shall close doors automatically.")
  @runtimeProperty("ModSettings.displayValues.No", "No")
  @runtimeProperty("ModSettings.displayValues.OnStartMoving", "On start moving")
  @runtimeProperty("ModSettings.displayValues.CustomSpeed", "Custom speed")
  public let doorsDriveClosing: EDoorsDriveClosing = EDoorsDriveClosing.No;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Doors")
  @runtimeProperty("ModSettings.category.order", "5")
  @runtimeProperty("ModSettings.displayName", "Doors closing speed")
  @runtimeProperty("ModSettings.description", "The speed above which doors shall close (default: 5).")
  @runtimeProperty("ModSettings.step", "1.0")
  @runtimeProperty("ModSettings.min", "2.0")
  @runtimeProperty("ModSettings.max", "250")
  public let doorsDriveClosingSpeed: Float = 5.0;

  /////////////////////////
  // REAR SPOILER
  /////////////////////////

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Rear spoiler")
  @runtimeProperty("ModSettings.category.order", "6")
  @runtimeProperty("ModSettings.displayName", "Synchronized with power state")
  @runtimeProperty("ModSettings.description", "Choose if the spoiler shall deploy and retract according to power state.")
  public let spoilerSynchronizedWithPowerState: Bool = false;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Rear spoiler")
  @runtimeProperty("ModSettings.category.order", "6")
  @runtimeProperty("ModSettings.displayName", "Deploy with speed")
  @runtimeProperty("ModSettings.description", "Choose if the spoiler shall deploy according to speed.")
  public let spoilerDeploySpeedEnabled: Bool = true;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Rear spoiler")
  @runtimeProperty("ModSettings.category.order", "6")
  @runtimeProperty("ModSettings.displayName", "Deploy speed")
  @runtimeProperty("ModSettings.description", "The speed above which the spoiler shall deploy (default: 57).")
  @runtimeProperty("ModSettings.step", "1.0")
  @runtimeProperty("ModSettings.min", "0.0")
  @runtimeProperty("ModSettings.max", "250")
  public let spoilerDeploySpeed: Float = 57.0;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Rear spoiler")
  @runtimeProperty("ModSettings.category.order", "6")
  @runtimeProperty("ModSettings.displayName", "Retract with speed")
  @runtimeProperty("ModSettings.description", "Choose if the spoiler shall retract according to speed.")
  public let spoilerRetractSpeedEnabled: Bool = false;

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Rear spoiler")
  @runtimeProperty("ModSettings.category.order", "6")
  @runtimeProperty("ModSettings.displayName", "Retract speed")
  @runtimeProperty("ModSettings.description", "The speed below which the spoiler shall retract (default: 40).")
  @runtimeProperty("ModSettings.step", "1.0")
  @runtimeProperty("ModSettings.min", "0.0")
  @runtimeProperty("ModSettings.max", "250")
  public let spoilerRetractSpeed: Float = 40.0;

  /////////////////////////
  // OTHER SETTINGS
  /////////////////////////

  @runtimeProperty("ModSettings.mod", "Enhanced Vehicle System")
  @runtimeProperty("ModSettings.category", "Other settings")
  @runtimeProperty("ModSettings.category.order", "7")
  @runtimeProperty("ModSettings.displayName", "Multi-tap time window")
  @runtimeProperty("ModSettings.description", "Defines the maximum timelapse allowed between multiple tap actions (default: 0.25).")
  @runtimeProperty("ModSettings.step", "0.01")
  @runtimeProperty("ModSettings.min", "0.10")
  @runtimeProperty("ModSettings.max", "1.00")
  public let multiTapTimeWindow: Float = 0.25;

  public static func Get(gi: GameInstance) -> ref<ModSettings_EVS> {
    return GameInstance.GetScriptableSystemsContainer(gi).Get(n"ModSettings_EVS") as ModSettings_EVS;
  }

  public func OnModSettingsChange() -> Void {
    
    // Check widgets coherence when game loads
    this.RefreshHeadlightsTime_UIWidgets();
    this.RefreshUtilityColor_UIWidgets();
    this.RefreshRearSpoiler_UIWidgets();
    this.RefreshDoorsClosing_UIWidgets();
  }

  private func OnAttach() -> Void {
    ModSettings.RegisterListenerToClass(this);
    ModSettings.RegisterListenerToModifications(this);

    // Check widgets coherence when game loads
    this.RefreshHeadlightsTime_UIWidgets();
    this.RefreshUtilityColor_UIWidgets();
    this.RefreshRearSpoiler_UIWidgets();
    this.RefreshDoorsClosing_UIWidgets();
  }
  private func OnDetach() -> Void {
    ModSettings.UnregisterListenerToClass(this);
    ModSettings.UnregisterListenerToModifications(this);
  }

  public func RefreshHeadlightsTime_UIWidgets() {
    // Apply logic to utility lights color widgets
    let configVars : array<ref<ConfigVar>> = ModSettings.GetVars(n"Enhanced Vehicle System", n"Headlights");

    let timeSyncEnabled_Widget : ref<ModConfigVarBool>;
    let defaultMode_Widget : ref<ModConfigVarEnum>;

    let nightMode_Widget : ref<ModConfigVarEnum>;
    let includeUtilityLights_Widget : ref<ModConfigVarEnum>;

    let turnOnHour_Widget : ref<ModConfigVarInt32>;
    let turnOnMinute_Widget : ref<ModConfigVarInt32>;

    let turnOffHour_Widget : ref<ModConfigVarInt32>;
    let turnOffMinute_Widget : ref<ModConfigVarInt32>;

    // Retrieve widgets
    let i: Int32 = 0;
    while i < ArraySize(configVars) {
      let displayName: CName = configVars[i].GetDisplayName();

      if Equals(displayName, n"Synchronized with time") {
        timeSyncEnabled_Widget = configVars[i] as ModConfigVarBool;
      }
      else if Equals(displayName, n"Default mode") {
        defaultMode_Widget = configVars[i] as ModConfigVarEnum;
      }
      else if Equals(displayName, n"Night mode") {
        nightMode_Widget = configVars[i] as ModConfigVarEnum;
      }
      else if Equals(displayName, n"Include utility lights") {
        includeUtilityLights_Widget = configVars[i] as ModConfigVarEnum;
      }
      else if Equals(displayName, n"Turn on hour") {
        turnOnHour_Widget = configVars[i] as ModConfigVarInt32;
      }
      else if Equals(displayName, n"Turn on minute") {
        turnOnMinute_Widget = configVars[i] as ModConfigVarInt32;
      }
      else if Equals(displayName, n"Turn off hour") {
        turnOffHour_Widget = configVars[i] as ModConfigVarInt32;
      }
      else if Equals(displayName, n"Turn off minute") {
        turnOffMinute_Widget = configVars[i] as ModConfigVarInt32;
      }

      i += 1;
    }

    if timeSyncEnabled_Widget.GetValue() {
      defaultMode_Widget.SetEnabled(false);
      defaultMode_Widget.SetVisible(false);

      nightMode_Widget.SetEnabled(true);
      nightMode_Widget.SetVisible(true);

      includeUtilityLights_Widget.SetEnabled(true);
      includeUtilityLights_Widget.SetVisible(true);

      turnOnHour_Widget.SetEnabled(true);
      turnOnHour_Widget.SetVisible(true);

      turnOnMinute_Widget.SetEnabled(true);
      turnOnMinute_Widget.SetVisible(true);

      turnOffHour_Widget.SetEnabled(true);
      turnOffHour_Widget.SetVisible(true);

      turnOffMinute_Widget.SetEnabled(true);
      turnOffMinute_Widget.SetVisible(true);
    }
    else {
      defaultMode_Widget.SetEnabled(true);
      defaultMode_Widget.SetVisible(true);

      nightMode_Widget.SetEnabled(false);
      nightMode_Widget.SetVisible(false);

      includeUtilityLights_Widget.SetEnabled(false);
      includeUtilityLights_Widget.SetVisible(false);

      turnOnHour_Widget.SetEnabled(false);
      turnOnHour_Widget.SetVisible(false);

      turnOnMinute_Widget.SetEnabled(false);
      turnOnMinute_Widget.SetVisible(false);

      turnOffHour_Widget.SetEnabled(false);
      turnOffHour_Widget.SetVisible(false);

      turnOffMinute_Widget.SetEnabled(false);
      turnOffMinute_Widget.SetVisible(false);
    }
  }

  public func RefreshUtilityColor_UIWidgets() {
    // Apply logic to utility lights color widgets
    let configVars : array<ref<ConfigVar>> = ModSettings.GetVars(n"Enhanced Vehicle System", n"Utility lights");

    let colorSequence_Widget : ref<ModConfigVarEnum>;
    let colorSequenceMemory_Widget : ref<ModConfigVarInt32>;
    let sequenceSpeed_Widget : ref<ModConfigVarFloat>;

    let vehicleType_Widget : ref<ModConfigVarEnum>;
    
    let customIntensity_Widget : ref<ModConfigVarBool>;
    let intensity_Widget : ref<ModConfigVarInt32>;

    let customColor_Widget : ref<ModConfigVarBool>;
    let red_Widget : ref<ModConfigVarInt32>;
    let green_Widget : ref<ModConfigVarInt32>;
    let blue_Widget : ref<ModConfigVarInt32>;

    let red_cycle_Widget : ref<ModConfigVarInt32>;
    let green_cycle_Widget : ref<ModConfigVarInt32>;
    let blue_cycle_Widget : ref<ModConfigVarInt32>;

    // Retrieve widgets
    let i: Int32 = 0;
    while i < ArraySize(configVars) {
      let displayName: CName = configVars[i].GetDisplayName();

      if Equals(displayName, n"Color sequence") {
        colorSequence_Widget = configVars[i] as ModConfigVarEnum;
      }
      else if Equals(displayName, n"Color sequence memory") {
        colorSequenceMemory_Widget = configVars[i] as ModConfigVarInt32;
      }
      else if Equals(displayName, n"Sequence latency") {
        sequenceSpeed_Widget = configVars[i] as ModConfigVarFloat;
      }
      else if Equals(displayName, n"Impacted vehicles") {
        vehicleType_Widget = configVars[i] as ModConfigVarEnum;
      }
      else if Equals(displayName, n"Custom intensity") {
        customIntensity_Widget = configVars[i] as ModConfigVarBool;
      }
      else if Equals(displayName, n"Intensity") {
        intensity_Widget = configVars[i] as ModConfigVarInt32;
      }
      else if Equals(displayName, n"Custom color") {
        customColor_Widget = configVars[i] as ModConfigVarBool;
      }
      else if Equals(displayName, n"Custom color - red") {
        red_Widget = configVars[i] as ModConfigVarInt32;
      }
      else if Equals(displayName, n"Custom color - green") {
        green_Widget = configVars[i] as ModConfigVarInt32;
      }
      else if Equals(displayName, n"Custom color - blue") {
        blue_Widget = configVars[i] as ModConfigVarInt32;
      }
      else if Equals(displayName, n"Cycle color - red") {
        red_cycle_Widget = configVars[i] as ModConfigVarInt32;
      }
      else if Equals(displayName, n"Cycle color - green") {
        green_cycle_Widget = configVars[i] as ModConfigVarInt32;
      }
      else if Equals(displayName, n"Cycle color - blue") {
        blue_cycle_Widget = configVars[i] as ModConfigVarInt32;
      }

      i += 1;
    }

    ///////////////////////
    // Reset all controls
    colorSequence_Widget.SetEnabled(true);
    colorSequence_Widget.SetVisible(true);

    sequenceSpeed_Widget.SetEnabled(true);
    sequenceSpeed_Widget.SetVisible(true);

    vehicleType_Widget.SetEnabled(true);
    vehicleType_Widget.SetVisible(true);

    customIntensity_Widget.SetEnabled(true);
    customIntensity_Widget.SetVisible(true);

    intensity_Widget.SetEnabled(true);
    intensity_Widget.SetVisible(true);

    customColor_Widget.SetEnabled(true);
    customColor_Widget.SetVisible(true);

    red_Widget.SetEnabled(true);
    red_Widget.SetVisible(true);

    green_Widget.SetEnabled(true);
    green_Widget.SetVisible(true);

    blue_Widget.SetEnabled(true);
    blue_Widget.SetVisible(true);

    red_cycle_Widget.SetEnabled(false);
    red_cycle_Widget.SetVisible(false);

    green_cycle_Widget.SetEnabled(false);
    green_cycle_Widget.SetVisible(false);

    blue_cycle_Widget.SetEnabled(false);
    blue_cycle_Widget.SetVisible(false);
    ///////////////////////

    // Must not be shown nor used
    colorSequenceMemory_Widget.SetEnabled(false);
    colorSequenceMemory_Widget.SetVisible(false);

    // Define default sequence speed for each sequence type
    if colorSequence_Widget.GetValue() != colorSequenceMemory_Widget.GetValue() {
      switch IntEnum<EUtilityLightsColorCycleType>(colorSequence_Widget.GetValue()) {
        case EUtilityLightsColorCycleType.Solid:
          // Do nothing
          break;
        case EUtilityLightsColorCycleType.Blinker:
          if sequenceSpeed_Widget.GetValue() != 0.3 {
            sequenceSpeed_Widget.SetValue(0.3);
          }
          break;
        case EUtilityLightsColorCycleType.Beacon:
          if sequenceSpeed_Widget.GetValue() != 0.8 {
            sequenceSpeed_Widget.SetValue(0.8);
          }
          break;
        case EUtilityLightsColorCycleType.Pulse:
          if sequenceSpeed_Widget.GetValue() != 2.0 {
            sequenceSpeed_Widget.SetValue(2.0);
          }
          break;
        case EUtilityLightsColorCycleType.TwoColorsCycle:
          if sequenceSpeed_Widget.GetValue() != 2.0 {
            sequenceSpeed_Widget.SetValue(2.0);
          }
          break;
        case EUtilityLightsColorCycleType.Rainbow:
          if sequenceSpeed_Widget.GetValue() != 1.5 {
            sequenceSpeed_Widget.SetValue(1.5);
          }
          break;
      }

      colorSequenceMemory_Widget.SetValue(colorSequence_Widget.GetValue());
    }

    switch IntEnum<EUtilityLightsColorCycleType>(colorSequence_Widget.GetValue()) {

      case EUtilityLightsColorCycleType.Solid:
        // Sequence speed requires a dynamic sequence type
        sequenceSpeed_Widget.SetEnabled(false);
        sequenceSpeed_Widget.SetVisible(false);

        // Vehicle type requires any custom setting to be enabled (Solid is the default game behavior)
        if !customColor_Widget.GetValue() && !customIntensity_Widget.GetValue() {
          vehicleType_Widget.SetEnabled(false);
          vehicleType_Widget.SetVisible(false);
        }
        break;

      case EUtilityLightsColorCycleType.Blinker:
        break;

      case EUtilityLightsColorCycleType.Beacon:
        break;
        
      case EUtilityLightsColorCycleType.Pulse:
        break;

      case EUtilityLightsColorCycleType.TwoColorsCycle:
        if !customColor_Widget.GetValue() {
          customColor_Widget.SetValue(true);
        }
        
        customColor_Widget.SetEnabled(false);
        customColor_Widget.SetVisible(false);
        
        red_cycle_Widget.SetEnabled(true);
        red_cycle_Widget.SetVisible(true);

        green_cycle_Widget.SetEnabled(true);
        green_cycle_Widget.SetVisible(true);

        blue_cycle_Widget.SetEnabled(true);
        blue_cycle_Widget.SetVisible(true);
        break;

      case EUtilityLightsColorCycleType.Rainbow:
        if customColor_Widget.GetValue() {
          customColor_Widget.SetValue(false);
        }

        customColor_Widget.SetEnabled(false);
        customColor_Widget.SetVisible(false);
        break;
    }
    
    // Intensity
    if customIntensity_Widget.GetValue() {
      intensity_Widget.SetEnabled(true);
      intensity_Widget.SetVisible(true);
    }
    else {
      intensity_Widget.SetEnabled(false);
      intensity_Widget.SetVisible(false);
    }
    
    // Color
    if customColor_Widget.GetValue() {
      red_Widget.SetEnabled(true);
      red_Widget.SetVisible(true);

      green_Widget.SetEnabled(true);
      green_Widget.SetVisible(true);

      blue_Widget.SetEnabled(true);
      blue_Widget.SetVisible(true);
    }
    else {
      red_Widget.SetEnabled(false);
      red_Widget.SetVisible(false);

      green_Widget.SetEnabled(false);
      green_Widget.SetVisible(false);

      blue_Widget.SetEnabled(false);
      blue_Widget.SetVisible(false);
    }
  }

  public func RefreshRearSpoiler_UIWidgets() {
    // Apply logic to spoiler widgets
    let configVars : array<ref<ConfigVar>> = ModSettings.GetVars(n"Enhanced Vehicle System", n"Rear spoiler");

    let spoilerSynchronized_Widget : ref<ModConfigVarBool>;

    let spoilerDeployEnabled_Widget : ref<ModConfigVarBool>;
    let spoilerDeploySpeed_Widget : ref<ModConfigVarFloat>;

    let spoilerRetractEnabled_Widget : ref<ModConfigVarBool>;
    let spoilerRetractSpeed_Widget : ref<ModConfigVarFloat>;

    // Retrieve widgets
    let i: Int32 = 0;
    while i < ArraySize(configVars) {
      let displayName: CName = configVars[i].GetDisplayName();

      if Equals(displayName, n"Synchronized with power state") {
        spoilerSynchronized_Widget = configVars[i] as ModConfigVarBool;
      }
      else if Equals(displayName, n"Deploy with speed") {
        spoilerDeployEnabled_Widget = configVars[i] as ModConfigVarBool;
      }
      else if Equals(displayName, n"Deploy speed") {
        spoilerDeploySpeed_Widget = configVars[i] as ModConfigVarFloat;
      }
      else if Equals(displayName, n"Retract with speed") {
        spoilerRetractEnabled_Widget = configVars[i] as ModConfigVarBool;
      }
      else if Equals(displayName, n"Retract speed") {
        spoilerRetractSpeed_Widget = configVars[i] as ModConfigVarFloat;
      }

      i += 1;
    }

    // Toggle bool/speed widgets depending on synchronized bool widget
    if spoilerSynchronized_Widget.GetValue() {
      spoilerDeployEnabled_Widget.SetEnabled(false);
      spoilerDeployEnabled_Widget.SetVisible(false);

      spoilerRetractEnabled_Widget.SetEnabled(false);
      spoilerRetractEnabled_Widget.SetVisible(false);

      if spoilerDeployEnabled_Widget.GetValue() { spoilerDeployEnabled_Widget.SetValue(false); }
      if spoilerRetractEnabled_Widget.GetValue() { spoilerRetractEnabled_Widget.SetValue(false); }
    }
    else {
      spoilerDeployEnabled_Widget.SetEnabled(true);
      spoilerDeployEnabled_Widget.SetVisible(true);
      
      spoilerRetractEnabled_Widget.SetEnabled(true);
      spoilerRetractEnabled_Widget.SetVisible(true);
    }

    // Toggle speed widget depending on bool widget
    if spoilerDeployEnabled_Widget.GetValue() {
      spoilerDeploySpeed_Widget.SetEnabled(true);
      spoilerDeploySpeed_Widget.SetVisible(true);
    }
    else {
      spoilerDeploySpeed_Widget.SetEnabled(false);
      spoilerDeploySpeed_Widget.SetVisible(false);
    }

    // Toggle speed widget depending on bool widget
    if spoilerRetractEnabled_Widget.GetValue() {
      spoilerRetractSpeed_Widget.SetEnabled(true);
      spoilerRetractSpeed_Widget.SetVisible(true);
    }
    else {
      spoilerRetractSpeed_Widget.SetEnabled(false);
      spoilerRetractSpeed_Widget.SetVisible(false);
    }
    
    // Check that speed widgets are valid
    // Only needed if both speeds are enabled
    if spoilerDeployEnabled_Widget.GetValue() && spoilerRetractEnabled_Widget.GetValue() {
      
      // Always keep 5 speed difference between the two speeds so the spoiler has an operating window
      let difference: Float = spoilerDeploySpeed_Widget.GetValue() - spoilerRetractSpeed_Widget.GetValue();
      if difference < 5.0 {

        // Retract speed <= Deploy speed but the difference is lower than 5 so only adjust the missing gap
        if difference >= 0.0 {
          let gap: Float = 5.0 - difference;

          if spoilerRetractSpeed_Widget.GetValue() - gap >= 0.0 {
            spoilerRetractSpeed_Widget.SetValue(spoilerRetractSpeed_Widget.GetValue() - gap);
          }
          else { // Retract speed is already too low to be reduced so increase Deploy speed instead
            spoilerDeploySpeed_Widget.SetValue(spoilerDeploySpeed_Widget.GetValue() + gap);
          }
        }
        else { // Retract speed > Deploy speed so apply a fixed 5 difference the other way

          if spoilerDeploySpeed_Widget.GetValue() - 5.0 >= 0.0 {
            spoilerRetractSpeed_Widget.SetValue(spoilerDeploySpeed_Widget.GetValue() - 5.0);
          }
          else if spoilerRetractSpeed_Widget.GetValue() + 5.0 <= 250.0 { // Deploy speed is already too low to be reduced so increase Retract speed instead
            spoilerDeploySpeed_Widget.SetValue(spoilerRetractSpeed_Widget.GetValue() + 5.0);
          }
          else { // Restore default values
            spoilerDeploySpeed_Widget.SetValue(20.0);
            spoilerRetractSpeed_Widget.SetValue(15.0);
          }
        }
      }
    }
  }

  public func RefreshDoorsClosing_UIWidgets() {
    // Apply logic to doors closing widgets
    let configVars : array<ref<ConfigVar>> = ModSettings.GetVars(n"Enhanced Vehicle System", n"Doors");

    let doorsDriveClosing_Widget : ref<ModConfigVarEnum>;
    let doorsDriveClosingSpeed_Widget : ref<ModConfigVarFloat>;

    // Retrieve widgets
    let i: Int32 = 0;
    while i < ArraySize(configVars) {
      let displayName: CName = configVars[i].GetDisplayName();

      if Equals(displayName, n"Drive closing") {
        doorsDriveClosing_Widget = configVars[i] as ModConfigVarEnum;
      }
      else if Equals(displayName, n"Doors closing speed") {
        doorsDriveClosingSpeed_Widget = configVars[i] as ModConfigVarFloat;
      }

      i += 1;
    }

    // Toggle speed widget depending on the enum widget
    if doorsDriveClosing_Widget.GetValue() == EnumInt(EDoorsDriveClosing.CustomSpeed) {
      doorsDriveClosingSpeed_Widget.SetEnabled(true);
      doorsDriveClosingSpeed_Widget.SetVisible(true);
    }
    else {
      doorsDriveClosingSpeed_Widget.SetEnabled(false);
      doorsDriveClosingSpeed_Widget.SetVisible(false);
    }
  }
}

public class FloatArrayWrapper {
  public let FL_in: Float;
  public let FL_out: Float;
  public let FR_in: Float;

  public static func Create(FL_in: Float, FL_out: Float, FR_in: Float) -> ref<FloatArrayWrapper> {

    let floatarray = new FloatArrayWrapper();

    floatarray.FL_in = FL_in;
    floatarray.FL_out = FL_out;
    floatarray.FR_in = FR_in;

    return floatarray;
  }
}

public class VehicleData extends ScriptableSystem {
  public let hasIncompatibleSlidingDoorsWindow_VehicleMap: ref<inkStringMap>;
  public let incorrectDoorNumber_VehicleMap: ref<inkStringMap>;
  public let incorrectHasWindow_VehicleMap: ref<inkStringMap>;
  public let isSlidingDoors_VehicleMap: ref<inkStringMap>;
  public let crystalDomeMeshTiming_VehicleMap: ref<inkHashMap>;

  public let rainbowColors: array<array<Int32>>;

  public static func Get(gi: GameInstance) -> ref<VehicleData> {
    return GameInstance.GetScriptableSystemsContainer(gi).Get(n"VehicleData") as VehicleData;
  }

  private func OnAttach() -> Void {
    let vehicleData = VehicleData.Get(this.GetGameInstance());
    
    ArrayPush(vehicleData.rainbowColors, [255, 0, 0]); // Red
    ArrayPush(vehicleData.rainbowColors, [255, 127, 0]); // Orange
    ArrayPush(vehicleData.rainbowColors, [255, 255, 0]); // Yellow
    ArrayPush(vehicleData.rainbowColors, [0, 255, 0]); // Green
    ArrayPush(vehicleData.rainbowColors, [0, 0, 255]); // Blue
    ArrayPush(vehicleData.rainbowColors, [75, 0, 130]); // Indigo
    ArrayPush(vehicleData.rainbowColors, [148, 0, 211]); // Violet

    vehicleData.crystalDomeMeshTiming_VehicleMap = new inkHashMap();
    // We can distinguish two types of crystal dome vehicles:
    // - Internal crystal dome with no external mesh like the Rayfield Caliburn, Rayfield Aerondight, Militech Hellhound...
    //   These vehicles won't change their external appearance whether the player is using FPP (cockpit) or TPP (external) camera.
    //   There is nothing to do with them as the crystal dome is only internal.
    //
    // - Internal crystal dome with external mesh like the vehicles listed below: Quadra Type-66 "Javelina", Archer Quartz "Sidewinder"...
    //   These vehicles do change their external appearance (hood, windshield, windows) if the player is using FPP or TPP camera.
    //   If the player is using FPP then all the external elements on the windshield (cables, diodes, modules...), windows and on the hood will be hidden by the game.
    //   When the player switches the camera to TPP or if the player goes out of the vehicle, then the game immediately make these external elements appear again.
    //   These vehicles show and hide external elements because when using the cockpit view, these elements would degrade the player experience.
    //
    // The purpose of the map below is to define custom timings to show and hide external elements for each affected vehicles. This problem appears because this mod allows to
    // keep the crystal dome working while V is outside of the vehicle. This raises the problem of showing or hiding external elements in a smooth way so the player barely
    // realizes that these elements have just been hidden or displayed again. This is not a perfect solution but it's working pretty nicely.
    vehicleData.crystalDomeMeshTiming_VehicleMap.Insert(TDBID.ToNumber(t"Mizutani Shion"), FloatArrayWrapper.Create(2.00, 0.85, 1.65)); // Shion "Coyote" / "Wendigo" / "Samum" / "Bonewrecker" / "Blackbird"
    vehicleData.crystalDomeMeshTiming_VehicleMap.Insert(TDBID.ToNumber(t"Quadra Type66"), FloatArrayWrapper.Create(2.15, 0.75, 1.85)); // Type-66 "Javelina" / "Reaver" / "Wingate"
    vehicleData.crystalDomeMeshTiming_VehicleMap.Insert(TDBID.ToNumber(t"Thorton Turbo"), FloatArrayWrapper.Create(1.85, 0.75, 1.55)); // Colby "Little Mule" / "Revenant" / "Vulture"
    // Archer Quartz "Sidewinder" / "Specter" has an additional issue: the game cannot
    // display both external elements and internal crystal dome without a merge glitch between them. There is no solution for this.
    // As a workaround I used a very short transition timing for "driver/passenger getting in" so it is the least glitchy I can do.
    vehicleData.crystalDomeMeshTiming_VehicleMap.Insert(TDBID.ToNumber(t"Archer Turbo"), FloatArrayWrapper.Create(0.20, 0.75, 0.20)); // Quartz "Sidewinder" / "Specter"
    vehicleData.crystalDomeMeshTiming_VehicleMap.Insert(TDBID.ToNumber(t"Thorton GalenaNomad"), FloatArrayWrapper.Create(1.50, 0.75, 1.00)); // Galena "Gecko" / "Ghoul" / "Locust"
    vehicleData.crystalDomeMeshTiming_VehicleMap.Insert(TDBID.ToNumber(t"Mahir Turbo"), FloatArrayWrapper.Create(0.00, 1.10, 0.00)); // Supron "Trailbruiser"
    // Militech "Hellhound" does not use external crystal dome mesh
    // Rayfield Caliburn does not use external crystal dome mesh
    // Rayfield Aerondight does not use external crystal dome mesh
    
    vehicleData.incorrectDoorNumber_VehicleMap = new inkStringMap();
    vehicleData.incorrectDoorNumber_VehicleMap.Insert("Thorton Mackinaw", Cast<Uint64>(2)); // Defined with 4 seats but only 3 real windows, and 3 real doors with back left door glitchy
    vehicleData.incorrectDoorNumber_VehicleMap.Insert("Militech Turbo", Cast<Uint64>(4)); // Militech "Hellhound" is defined with 2 seats but it has 4 real doors
    vehicleData.incorrectDoorNumber_VehicleMap.Insert("Mahir Turbo", Cast<Uint64>(4)); // Supron "Trailbruiser" is defined with 2 seats but it has 4 real doors
    vehicleData.incorrectDoorNumber_VehicleMap.Insert("Villefort Alvarado", Cast<Uint64>(4)); // Defined with 2 seats but it has 4 real doors
    vehicleData.incorrectDoorNumber_VehicleMap.Insert("Militech Basilisk", Cast<Uint64>(1)); // Defined with 2 seats but it has 1 controllable door

    vehicleData.incorrectHasWindow_VehicleMap = new inkStringMap();
    vehicleData.incorrectHasWindow_VehicleMap.Insert("Militech Basilisk", Cast<Uint64>(0)); // Defined with windows but has no window

    vehicleData.isSlidingDoors_VehicleMap = new inkStringMap();
    vehicleData.isSlidingDoors_VehicleMap.Insert("Rayfield Turbo", Cast<Uint64>(0)); // Caliburn
    vehicleData.isSlidingDoors_VehicleMap.Insert("Rayfield Aerondight", Cast<Uint64>(0));
    vehicleData.isSlidingDoors_VehicleMap.Insert("Mizutani Shion", Cast<Uint64>(0)); // Shion "Coyote" / "Wendigo" / "Samum" / "Bonewrecker" / "Blackbird" / MZ1 / MZ2 / Targa MZT / "Kyokotsu"
    vehicleData.isSlidingDoors_VehicleMap.Insert("Quadra Turbo", Cast<Uint64>(0)); // "Quadra Turbo R V-Tech" / "Quadra Turbo R 740"
    vehicleData.isSlidingDoors_VehicleMap.Insert("Quadra Type66", Cast<Uint64>(0)); // Type-66 640 TS / 680 TS / Avenger / "Cthulhu" / "Jen Rowley" / "Mistral" / "Javelina" / "Reaver" / "Hoon" / "Wingate"

    vehicleData.hasIncompatibleSlidingDoorsWindow_VehicleMap = new inkStringMap();
    // This is the list of vehicles that use sliding doors that must not be able to toggle windows while doors are opened
    // Otherwise the window will go out of the door mesh because the window animation for these vehicles is not meant to play while doors are opened
    // All vehicles that match this list won't be able to toggle windows while doors are opened
    vehicleData.hasIncompatibleSlidingDoorsWindow_VehicleMap.Insert("Quadra Type66", Cast<Uint64>(0)); // Type-66 640 TS / 680 TS / Avenger / "Cthulhu" / "Jen Rowley" / "Mistral" / "Javelina" / "Reaver" / "Hoon" / "Wingate"
  }
}

@addField(VehicleComponent)
public let m_currentHeadlightsState: vehicleELightMode = vehicleELightMode.Off;

@addField(VehicleComponent)
public let m_temporaryHeadlightsShutOff: Bool = false;

@addField(VehicleComponent)
public let m_cycleDoorLongInputTriggered: Bool = false;

@addField(VehicleComponent)
public let m_cycleDoorLastPressTime: Float = 0.00;

@addField(VehicleComponent)
public let m_cycleDoorStep: Int32 = 0;

@addField(VehicleComponent)
public let m_cycleWindowLongInputTriggered: Bool = false;

@addField(VehicleComponent)
public let m_cycleWindowLastPressTime: Float = 0.00;

@addField(VehicleComponent)
public let m_cycleWindowStep: Int32 = 0;

@addField(VehicleComponent)
public let m_cycleSpoilerLongInputTriggered: Bool = false;

@addField(VehicleComponent)
public let m_cycleSpoilerLastPressTime: Float = 0.00;

@addField(VehicleComponent)
public let m_cycleSpoilerStep: Int32 = 0;

@addField(VehicleComponent)
public let m_totalSeatSlots: Int32 = 0;

@addField(VehicleComponent)
public let m_cycleDomeLongInputTriggered: Bool = false;

@addField(VehicleComponent)
public let m_cycleLightsLongInputTriggered: Bool = false;

@addField(VehicleComponent)
public let m_interiorLightsState: Bool = false;

@addField(VehicleComponent)
public let m_powerState: Bool = false;

@addField(VehicleComponent)
public let m_auxiliaryState: Bool = false;

@addField(VehicleComponent)
public let m_playerIsDismounting: Bool = false;

@addField(VehicleComponent)
public let m_playerIsMounted: Bool = false;

@addField(VehicleComponent)
public let m_playerIsMountedFromPassengerSeat: Bool = false;

@addField(VehicleComponent)
public let m_isDriverCombat: Bool = false;

@addField(VehicleComponent)
public let m_isDriverCombatType_Doors: Bool = false;

@addField(VehicleComponent)
public let m_crystalDomeMeshTimings: ref<FloatArrayWrapper> = null;

@addField(VehicleComponent)
public let m_isKmH: Bool = false;

@addField(VehicleComponent)
public let m_FL_windowState: EVehicleWindowState = EVehicleWindowState.Closed;

@addField(VehicleComponent)
public let m_FR_windowState: EVehicleWindowState = EVehicleWindowState.Closed;

@addField(VehicleComponent)
public let m_FL_doorState: VehicleDoorState = VehicleDoorState.Closed;

@addField(VehicleComponent)
public let m_FR_doorState: VehicleDoorState = VehicleDoorState.Closed;

@addField(VehicleComponent)
public let m_BL_doorState: VehicleDoorState = VehicleDoorState.Closed;

@addField(VehicleComponent)
public let m_BR_doorState: VehicleDoorState = VehicleDoorState.Closed;

@addField(VehicleComponent)
// This allows to only affect the vehicles that V has mounted (any seat)
public let m_vehicleUsedByV: Bool = false;

@addField(VehicleComponent)
// This allows to only affect the vehicles that V has mounted as driver
public let m_vehicleDrivenByV: Bool = false;

@addField(VehicleComponent)
public let m_vehicleModel: String;

@addField(VehicleComponent)
public let m_cycleEngineLastPressTime: Float = 0.00;

@addField(VehicleComponent)
public let m_hasWindows: Bool = false;

@addField(VehicleComponent)
public let m_isSlidingDoors: Bool = false;

@addField(VehicleComponent)
public let m_isPoliceVehicle: Bool = false;

@addField(VehicleComponent)
public let m_hasIncompatibleSlidingDoorsWindow: Bool = false;

@addField(VehicleComponent)
public let m_modSettings: ref<ModSettings_EVS>;

@addField(VehicleComponent)
public let m_vehicleDataPackage: wref<VehicleDataPackage_Record>;

@addField(VehicleComponent)
public let m_vehicleRecord: wref<Vehicle_Record>;

@addField(VehicleComponent)
public let m_AutoCloseDoors_OnStartMoving_State: Bool = true; // By default the vehicle is stationary

@addField(VehicleComponent)
public let m_vehicleMomentumType: EMomentumType = EMomentumType.Stable ; // By default the vehicle is stationary

@addField(VehicleComponent)
public let m_lastSpeed: Float = 0.00; // By default the vehicle is stationary

@addField(VehicleComponent)
public let m_activeEffectIdentifier: Int32 = 0;

@addField(VehicleComponent)
public let m_headlightsTimerIdentifier: Int32 = 0;

@addField(VehicleComponent)
public let m_minimalIntensity: Float = 0.05;

@addField(VehicleComponent)
public let m_utilityLightsLastColor: Color;

@addField(VehicleComponent)
public let m_utilityLightsIsDefaultColor: Bool = true;

@addField(VehicleComponent)
public let m_utilityLightsLastIntensity: Float = 0.00;

@addField(VehicleComponent)
public let m_utilityLightsIsDefaultIntensity: Bool = true;

@addField(VehicleComponent)
public let m_headlightsSynchronizedWithTimeShallEnable: Bool = false;

@addField(VehicleObject)
public let m_vehicleUIGameController: ref<vehicleUIGameController>;

@addField(VehicleComponent)
// 0 = side banner lights BLUE
// 1 = Roof lights ON + side banner lights RED
// 2 = Roof lights ON + side banner lights RED + Siren ON
public let m_threeStatesSiren: Int32 = 0;

public class MultiTapDoorEvent extends Event {
  let tapCount: Int32 = 0;
}

public class MultiTapWindowEvent extends Event {
  let tapCount: Int32 = 0;
}

public class MultiTapSpoilerEvent extends Event {
  let tapCount: Int32 = 0;
}

public class CrystalDomeMeshEvent extends Event {
  let tppEnabled: Bool = false;
}

public class RainbowEffectEvent extends Event {
  let identifier: Int32 = 0;
  let colorIndex: Int32;
}

public class BlinkerEffectEvent extends Event {
  let identifier: Int32 = 0;
  let step: Int32 = 0;
}

public class BeaconEffectEvent extends Event {
  let identifier: Int32 = 0;
  let step: Int32 = 0;
}

public class PulseEffectEvent extends Event {
  let identifier: Int32 = 0;
  let step: Int32 = 0;
}

public class TwoColorsCycleEffectEvent extends Event {
  let identifier: Int32 = 0;
  let step: Int32 = 0;
}

public class GameTimeElapsedEvent extends Event {
  let identifier: Int32 = 0;
}

public class PlayerIsAwayFromVehicleEvent extends Event {
  let hasBeenOutOfVehicleRange: Bool = false;
}

@addMethod(VehicleComponent)
protected cb func OnMultiTapDoorEvent(evt: ref<MultiTapDoorEvent>) -> Bool {
  if evt.tapCount != this.m_cycleDoorStep {
    return false;
  }

  // Ensure that the vehicle has enough controllable doors for user choice
  if evt.tapCount > this.m_totalSeatSlots {
    return false;
  }

  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let preventDoorClosingDuringCombat: Bool = this.m_isDriverCombat && this.m_isDriverCombatType_Doors;
  let preventWindowClosingDuringCombat: Bool = this.m_isDriverCombat && !this.m_isDriverCombatType_Doors;
  let playerSlotID: MountingSlotId = this.GetPlayerSlotID();

  // If the player is not mounted as driver, only allow sliding door to be opened
  if NotEquals(playerSlotID, VehicleComponent.GetDriverSlotID()) && !this.m_isSlidingDoors {
    return false;
  }
  
  let FL_doorState: VehicleDoorState = this.GetPS().GetDoorState(EVehicleDoor.seat_front_left);
  let FR_doorState: VehicleDoorState = this.GetPS().GetDoorState(EVehicleDoor.seat_front_right);

  // Step 1 will be used to toggle the player's door no matter the seat he is occupying
  let step1_SlotID: MountingSlotId = VehicleComponent.GetDriverSlotID(); // Defaults to driver seat
  let step1_VehicleDoor: EVehicleDoor = EVehicleDoor.seat_front_left; // Defaults to driver seat

  // If the player is mounted as a passenger then only allow him to toggle his own door
  // Redirect all multi-tap actions to the current player seat
  switch playerSlotID {
    case VehicleComponent.GetFrontPassengerSlotID():
      evt.tapCount = 1;
      step1_VehicleDoor = EVehicleDoor.seat_front_right;
      step1_SlotID = playerSlotID;
      break;
      
    case VehicleComponent.GetBackLeftPassengerSlotID():
      evt.tapCount = 1;
      step1_VehicleDoor = EVehicleDoor.seat_back_left;
      step1_SlotID = playerSlotID;
      break;
      
    case VehicleComponent.GetBackRightPassengerSlotID():
      evt.tapCount = 1;
      step1_VehicleDoor = EVehicleDoor.seat_back_right;
      step1_SlotID = playerSlotID;
      break;
  }

  switch evt.tapCount {
    case 1:
      if !preventDoorClosingDuringCombat && Equals(this.GetPS().GetDoorState(step1_VehicleDoor), VehicleDoorState.Open) {
        VehicleComponent.CloseDoor(vehicle, step1_SlotID);

        // DriverCombat modes:
        // - Doors: front doors need to be opened (like Rayfield Caliburn)
        // - Standard: front windows need to be open. However if doors type is Sliding Door (like Quadra V-Tech) then the user can still manipulate windows while doors are open only
        if preventWindowClosingDuringCombat {
          this.ForceFrontWindowsDuringCombat(VehicleDoorState.Closed, FR_doorState);
        }
      }
      else {
        // For some vehicles with sliding doors: if the window is opened we need to close it before we open the door because otherwise the window position will be weird once the sliding door is lift
        if this.m_hasIncompatibleSlidingDoorsWindow && Equals(this.GetPS().GetWindowState(step1_VehicleDoor), EVehicleWindowState.Open) {
          VehicleComponent.ToggleVehicleWindow(vehicle.GetGame(), vehicle, step1_SlotID, false);
        }
        VehicleComponent.OpenDoor(vehicle, step1_SlotID);

        // DriverCombat mode Standard: if doors type is Sliding Door (like Quadra V-Tech) then the user can still manipulate windows while doors are open only
        // If doors are hinged then windows will always stay opened during combat
        if preventWindowClosingDuringCombat && this.m_isSlidingDoors {
          this.Recall_FL_WindowsState();
        }
      }
      break;

    case 2:
      if !preventDoorClosingDuringCombat && Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_right), VehicleDoorState.Open) {
        VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetFrontPassengerSlotID());

        // DriverCombat modes:
        // - Doors: front doors need to be opened (like Rayfield Caliburn)
        // - Standard: front windows need to be open. However if doors type is Sliding Door (like Quadra V-Tech) then the user can still manipulate windows while doors are open only
        if preventWindowClosingDuringCombat {
          this.ForceFrontWindowsDuringCombat(FL_doorState, VehicleDoorState.Closed);
        }
      }
      else {
        // For some vehicles with sliding doors: if the window is opened we need to close it before we open the door because otherwise the window position will be weird once the sliding door is lift
        if this.m_hasIncompatibleSlidingDoorsWindow && Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_front_right), EVehicleWindowState.Open) {
          VehicleComponent.ToggleVehicleWindow(vehicle.GetGame(), vehicle, VehicleComponent.GetFrontPassengerSlotID(), false);
        }
        VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetFrontPassengerSlotID());

        // DriverCombat mode Standard: if doors type is Sliding Door (like Quadra V-Tech) then the user can still manipulate windows while doors are open only
        // If doors are hinged then windows will always stay opened during combat
        if preventWindowClosingDuringCombat && this.m_isSlidingDoors {
          this.Recall_FR_WindowsState();
        }
      }
      break;

    case 3:
      if Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_back_left), VehicleDoorState.Open) {
        VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetBackLeftPassengerSlotID());
      }
      else {
        // For some vehicles with sliding doors: if the window is opened we need to close it before we open the door because otherwise the window position will be weird once the sliding door is lift
        if this.m_hasIncompatibleSlidingDoorsWindow && Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_back_left), EVehicleWindowState.Open) {
          VehicleComponent.ToggleVehicleWindow(vehicle.GetGame(), vehicle, VehicleComponent.GetBackLeftPassengerSlotID(), false);
        }
        VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetBackLeftPassengerSlotID());
      }
      break;

    case 4:
      if Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_back_right), VehicleDoorState.Open) {
        VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetBackRightPassengerSlotID());
      }
      else {
        // For some vehicles with sliding doors: if the window is opened we need to close it before we open the door because otherwise the window position will be weird once the sliding door is lift
        if this.m_hasIncompatibleSlidingDoorsWindow && Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_back_right), EVehicleWindowState.Open) {
          VehicleComponent.ToggleVehicleWindow(vehicle.GetGame(), vehicle, VehicleComponent.GetBackRightPassengerSlotID(), false);
        }
        VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetBackRightPassengerSlotID());
      }
      break;
  }

  return true;
}

@addMethod(VehicleComponent)
protected cb func OnMultiTapWindowEvent(evt: ref<MultiTapWindowEvent>) -> Bool {
  if evt.tapCount != this.m_cycleWindowStep {
    return false;
  }

  // Ensure that the vehicle has enough controllable windows for user choice
  if evt.tapCount > this.m_totalSeatSlots {
    return false;
  }

  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let preventWindowClosingDuringCombat: Bool = this.m_isDriverCombat && !this.m_isDriverCombatType_Doors;
  let playerSlotID: MountingSlotId = this.GetPlayerSlotID();

  let FR_doorState: VehicleDoorState = this.GetPS().GetDoorState(EVehicleDoor.seat_front_right);
  let BL_doorState: VehicleDoorState = this.GetPS().GetDoorState(EVehicleDoor.seat_back_left);
  let BR_doorState: VehicleDoorState = this.GetPS().GetDoorState(EVehicleDoor.seat_back_right);

  let FR_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_front_right);
  let BL_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_back_left);
  let BR_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_back_right);

  // Step 1 will be used to toggle the player's window no matter the seat he is occupying
  let step1_SlotID: MountingSlotId = VehicleComponent.GetDriverSlotID(); // Defaults to driver seat
  let step1_EVehicleWindowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_front_left); // Defaults to driver seat
  let step1_VehicleDoorState: VehicleDoorState = this.GetPS().GetDoorState(EVehicleDoor.seat_front_left); // Defaults to driver seat

  // If the player is mounted as a passenger then only allow him to toggle his own window
  // Redirect all multi-tap actions to the current player seat
  switch playerSlotID {
    case VehicleComponent.GetFrontPassengerSlotID():
      evt.tapCount = 1;
      step1_EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_front_right);
      step1_VehicleDoorState = this.GetPS().GetDoorState(EVehicleDoor.seat_front_right);
      step1_SlotID = playerSlotID;
      break;
      
    case VehicleComponent.GetBackLeftPassengerSlotID():
      evt.tapCount = 1;
      step1_EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_back_left);
      step1_VehicleDoorState = this.GetPS().GetDoorState(EVehicleDoor.seat_back_left);
      step1_SlotID = playerSlotID;
      break;
      
    case VehicleComponent.GetBackRightPassengerSlotID():
      evt.tapCount = 1;
      step1_EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_back_right);
      step1_VehicleDoorState = this.GetPS().GetDoorState(EVehicleDoor.seat_back_right);
      step1_SlotID = playerSlotID;
      break;
  }

  switch evt.tapCount {
    case 1:
      // Only opened sliding doors can still manipulate windows during combat
      if !preventWindowClosingDuringCombat || (this.m_isSlidingDoors && Equals(step1_VehicleDoorState, VehicleDoorState.Open)) {
        if !this.m_hasIncompatibleSlidingDoorsWindow || Equals(step1_VehicleDoorState, VehicleDoorState.Closed) {
          VehicleComponent.ToggleVehicleWindow(vehicle.GetGame(), vehicle, step1_SlotID, Equals(step1_EVehicleWindowState, EVehicleWindowState.Open) ? false : true);

          // During DriverCombat mode: if the user manipulates window while sliding doors are open then remember these new states as the recall state
          if preventWindowClosingDuringCombat {
            this.m_FL_windowState = Equals(step1_EVehicleWindowState, EVehicleWindowState.Open) ? EVehicleWindowState.Closed : EVehicleWindowState.Open;
          }
        }
      }
      break;

    case 2:
      // Only opened sliding doors can still manipulate windows during combat
      if !preventWindowClosingDuringCombat || (this.m_isSlidingDoors && Equals(FR_doorState, VehicleDoorState.Open)) {
        if !this.m_hasIncompatibleSlidingDoorsWindow || Equals(FR_doorState, VehicleDoorState.Closed) {
          VehicleComponent.ToggleVehicleWindow(vehicle.GetGame(), vehicle, VehicleComponent.GetFrontPassengerSlotID(), Equals(FR_windowState, EVehicleWindowState.Open) ? false : true);
        
          // During DriverCombat mode: if the user manipulates window while sliding doors are open then remember these new states as the recall state
          if preventWindowClosingDuringCombat {
            this.m_FR_windowState = Equals(FR_windowState, EVehicleWindowState.Open) ? EVehicleWindowState.Closed : EVehicleWindowState.Open;
          }
        }
      }
      break;

    case 3:
      if !this.m_hasIncompatibleSlidingDoorsWindow || Equals(BL_doorState, VehicleDoorState.Closed) {
        VehicleComponent.ToggleVehicleWindow(vehicle.GetGame(), vehicle, VehicleComponent.GetBackLeftPassengerSlotID(), Equals(BL_windowState, EVehicleWindowState.Open) ? false : true);
      }
      break;

    case 4:
      if !this.m_hasIncompatibleSlidingDoorsWindow || Equals(BR_doorState, VehicleDoorState.Closed) {
        VehicleComponent.ToggleVehicleWindow(vehicle.GetGame(), vehicle, VehicleComponent.GetBackRightPassengerSlotID(), Equals(BR_windowState, EVehicleWindowState.Open) ? false : true);
      }
      break;
  }

  return true;
}

@addMethod(VehicleComponent)
protected cb func OnMultiTapSpoilerEvent(evt: ref<MultiTapSpoilerEvent>) -> Bool {
  if evt.tapCount != this.m_cycleSpoilerStep {
    return false;
  }

  let vehicle: ref<VehicleObject> = this.GetVehicle();

  switch evt.tapCount {
    case 1:
      if Equals(this.GetPS().GetDoorState(EVehicleDoor.hood), VehicleDoorState.Open) {
        VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetHoodSlotID());
      }
      else {
        VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetHoodSlotID());
      }
      break;

    case 2:
      if Equals(this.GetPS().GetDoorState(EVehicleDoor.trunk), VehicleDoorState.Open) {
        VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetTrunkSlotID());
      }
      else {
        VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetTrunkSlotID());
      }
      break;

    case 3:
      if this.m_hasSpoiler {
        let animFeature: ref<AnimFeature_PartData>;

        if this.m_spoilerDeployed {
          animFeature = new AnimFeature_PartData();
          animFeature.state = 3;
          animFeature.duration = 0.75;
          AnimationControllerComponent.ApplyFeatureToReplicate(this.GetVehicle(), n"spoiler", animFeature);
          this.m_spoilerDeployed = false;
        }
        else {
          animFeature = new AnimFeature_PartData();
          animFeature.state = 1;
          animFeature.duration = 0.75;
          AnimationControllerComponent.ApplyFeatureToReplicate(this.GetVehicle(), n"spoiler", animFeature);
          this.m_spoilerDeployed = true;
        }
      }
      break;
  }
  
  return true;
}

@addMethod(VehicleComponent)
protected cb func OnCrystalDomeMeshEvent(evt: ref<CrystalDomeMeshEvent>) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let animFeature: ref<AnimFeature_VehicleState> = new AnimFeature_VehicleState();

  animFeature.tppEnabled = evt.tppEnabled;
  AnimationControllerComponent.ApplyFeatureToReplicate(vehicle, n"VehicleState", animFeature);
  this.TogglePanzerShadowMeshes(evt.tppEnabled);
}

@addMethod(VehicleComponent)
protected cb func OnRainbowEffectEvent(evt: ref<RainbowEffectEvent>) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if this.m_activeEffectIdentifier != evt.identifier {
    return false;
  }

  // LogChannel(n"DEBUG", s"[RainbowEffect \(evt.identifier)] \(this.m_vehicleModel)");

  let rainbowColor: Color = this.ToColor(VehicleData.Get(vehicle.GetGame()).rainbowColors[evt.colorIndex]);

  this.ApplyUtilityLightsParameters(false, false, false, rainbowColor);

  let event: ref<RainbowEffectEvent> = new RainbowEffectEvent();
  event.identifier = evt.identifier;
  event.colorIndex = evt.colorIndex == 6 ? 0 : evt.colorIndex + 1;
  GameInstance.GetDelaySystem(vehicle.GetGame()).DelayEvent(vehicle, event, this.m_modSettings.utilityLightsColorSequenceSpeed, true);

  return true;
}

@addMethod(VehicleComponent)
protected cb func OnBlinkerEffectEvent(evt: ref<BlinkerEffectEvent>) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if this.m_activeEffectIdentifier != evt.identifier {
    return false;
  }

  // LogChannel(n"DEBUG", s"[BlinkerEffect \(evt.identifier)] \(this.m_vehicleModel)");

  switch evt.step {
    case 0:
      // Instant color
      this.ApplyUtilityLightsParameters(true, false, false);

      let event: ref<BlinkerEffectEvent> = new BlinkerEffectEvent();
      event.identifier = evt.identifier;
      event.step = 1;
      GameInstance.GetDelaySystem(vehicle.GetGame()).DelayEvent(vehicle, event, this.m_modSettings.utilityLightsColorSequenceSpeed, true);
      break;
      
    case 1:
      // Black color
      this.ApplyUtilityLightsParameters(true, false, true, this.GetBlackColor());

      let event: ref<BlinkerEffectEvent> = new BlinkerEffectEvent();
      event.identifier = evt.identifier;
      event.step = 0;
      GameInstance.GetDelaySystem(vehicle.GetGame()).DelayEvent(vehicle, event, this.m_modSettings.utilityLightsColorSequenceSpeed, true);
      break;
  }

  return true;
}

@addMethod(VehicleComponent)
protected cb func OnBeaconEffectEvent(evt: ref<BeaconEffectEvent>) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let beaconDelay: Float = 0.10;

  if this.m_activeEffectIdentifier != evt.identifier {
    return false;
  }

  // LogChannel(n"DEBUG", s"[BeaconEffect \(evt.identifier)] \(this.m_vehicleModel)");

  switch evt.step {
    case 0:
      // Instant color
      this.ApplyUtilityLightsParameters(true, false, false);

      let event: ref<BeaconEffectEvent> = new BeaconEffectEvent();
      event.identifier = evt.identifier;
      event.step = 1;
      GameInstance.GetDelaySystem(vehicle.GetGame()).DelayEvent(vehicle, event, beaconDelay, true);
      break;
      
    case 1:
      // Black color
      this.ApplyUtilityLightsParameters(true, false, true, this.GetBlackColor());

      let event: ref<BeaconEffectEvent> = new BeaconEffectEvent();
      event.identifier = evt.identifier;
      event.step = 2;
      GameInstance.GetDelaySystem(vehicle.GetGame()).DelayEvent(vehicle, event, beaconDelay, true);
      break;
      
    case 2:
      // Instant color
      this.ApplyUtilityLightsParameters(true, false, false);

      let event: ref<BeaconEffectEvent> = new BeaconEffectEvent();
      event.identifier = evt.identifier;
      event.step = 3;
      GameInstance.GetDelaySystem(vehicle.GetGame()).DelayEvent(vehicle, event, beaconDelay, true);
      break;
      
    case 3:
      // Black color
      this.ApplyUtilityLightsParameters(true, false, true, this.GetBlackColor());

      let event: ref<BeaconEffectEvent> = new BeaconEffectEvent();
      event.identifier = evt.identifier;
      event.step = 0;
      GameInstance.GetDelaySystem(vehicle.GetGame()).DelayEvent(vehicle, event, this.m_modSettings.utilityLightsColorSequenceSpeed, true);
      break;
  }

  return true;
}

@addMethod(VehicleComponent)
protected cb func OnPulseEffectEvent(evt: ref<PulseEffectEvent>) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if this.m_activeEffectIdentifier != evt.identifier {
    return false;
  }

  // LogChannel(n"DEBUG", s"[PulseEffect \(evt.identifier)] \(this.m_vehicleModel)");

  switch evt.step {
    case 0:
      // Fade to color
      this.ApplyUtilityLightsParameters(false, false, false);

      let event: ref<PulseEffectEvent> = new PulseEffectEvent();
      event.identifier = evt.identifier;
      event.step = 1;
      GameInstance.GetDelaySystem(vehicle.GetGame()).DelayEvent(vehicle, event, this.m_modSettings.utilityLightsColorSequenceSpeed, true);
      break;
      
    case 1:
      // Fade to color minimum
      this.ApplyUtilityLightsParameters(false, true, false);

      let event: ref<PulseEffectEvent> = new PulseEffectEvent();
      event.identifier = evt.identifier;
      event.step = 0;
      GameInstance.GetDelaySystem(vehicle.GetGame()).DelayEvent(vehicle, event, this.m_modSettings.utilityLightsColorSequenceSpeed, true);
      break;
  }

  return true;
}

@addMethod(VehicleComponent)
protected cb func OnTwoColorsCycleEffectEvent(evt: ref<TwoColorsCycleEffectEvent>) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if this.m_activeEffectIdentifier != evt.identifier {
    return false;
  }

  // LogChannel(n"DEBUG", s"[TwoColorsCycleEffect \(evt.identifier)] \(this.m_vehicleModel)");

  switch evt.step {
    case 0:
      // Fade to custom color
      this.ApplyUtilityLightsParameters(false, false, false);

      let event: ref<TwoColorsCycleEffectEvent> = new TwoColorsCycleEffectEvent();
      event.identifier = evt.identifier;
      event.step = 1;
      GameInstance.GetDelaySystem(vehicle.GetGame()).DelayEvent(vehicle, event, this.m_modSettings.utilityLightsColorSequenceSpeed, true);
      break;
      
    case 1:
      // Fade to cycle color
      this.ApplyUtilityLightsParameters(false, false, false, this.GetCycleColor());

      let event: ref<TwoColorsCycleEffectEvent> = new TwoColorsCycleEffectEvent();
      event.identifier = evt.identifier;
      event.step = 0;
      GameInstance.GetDelaySystem(vehicle.GetGame()).DelayEvent(vehicle, event, this.m_modSettings.utilityLightsColorSequenceSpeed, true);
      break;
  }

  return true;
}

@addMethod(VehicleComponent)
protected cb func OnGameTimeElapsedEvent(evt: ref<GameTimeElapsedEvent>) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if this.m_headlightsTimerIdentifier != evt.identifier {
    return false;
  }
  
  if !this.m_powerState || !this.m_vehicleDrivenByV || !this.m_modSettings.headlightsSynchronizedWithTimeEnabled {
    return false;
  }

  let historyTime: GameTime = GameInstance.GetTimeSystem(vehicle.GetGame()).GetGameTime();

  let turnOnTime: GameTime = GameTime.MakeGameTime(0, this.m_modSettings.headlightsTurnOnHour, this.m_modSettings.headlightsTurnOnMinute, 0);
  let turnOffTime: GameTime = GameTime.MakeGameTime(0, this.m_modSettings.headlightsTurnOffHour, this.m_modSettings.headlightsTurnOffMinute, 0);

  let now: GameTime = GameTime.MakeGameTime(0, GameTime.Hours(historyTime), GameTime.Minutes(historyTime), GameTime.Seconds(historyTime));
  
  let toggle: Bool = false;

  // We cannot know if turnOn and turnOff times will be used in a realistic way (turnOn ~ sunset, turnOff ~ sunrise) so we must check which is after the other
  if this.IsAfter(now, turnOnTime) {    
    if this.IsAfter(now, turnOffTime) {
      if this.IsAfter(turnOnTime, turnOffTime) {
        toggle = true;
      }
      else {
        toggle = false;
      }
    }
    else {
      toggle = true;
    }
  }
  else {
    if this.IsAfter(now, turnOffTime) {
      toggle = false;
    }
    else {
      if this.IsAfter(turnOnTime, turnOffTime) {
        toggle = true;
      }
      else {
        toggle = false;
      }
    }
  }

  this.m_headlightsSynchronizedWithTimeShallEnable = toggle;

  // LogChannel(n"DEBUG", s"[HeadlightsWithTime \(evt.identifier)] \(this.m_vehicleModel) \(this.GameTimeToString(now)) -> shall turn \(toggle ? "ON" : "OFF")");

  // Only force toggle to apply if the power is on and V has driven that vehicle and we are currently close to the turn ON/OFF time
  if this.GameTimeEquals(now, turnOnTime) || this.GameTimeEquals(now, turnOffTime) {
    this.UpdateHeadlightsWithTimeSync();

    this.ApplyHeadlightsModeWithShutOff();
    this.ApplyUtilityLightsWithShutOff();
  }

  let event: ref<GameTimeElapsedEvent> = new GameTimeElapsedEvent();
  event.identifier = evt.identifier;
  GameInstance.GetDelaySystem(vehicle.GetGame()).DelayEvent(vehicle, event, 1.00, true);

  return true;
}

@addMethod(VehicleComponent)
protected cb func OnPlayerIsAwayFromVehicleEvent(evt: ref<PlayerIsAwayFromVehicleEvent>) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(this.GetVehicle().GetGame()).GetLocalPlayerMainGameObject() as PlayerPuppet;
  let enableDistance: Float = 400.0; // Meters
  let distancePlayerVehicle: Float = Vector4.DistanceSquared(player.GetWorldPosition(), vehicle.GetWorldPosition()) * 0.3048; // Base unit is feet

  // LogChannel(n"DEBUG", s"\(this.m_vehicleModel) -> player is \(distancePlayerVehicle) meters away");

  // If player gets too far away from a vehicle, its crystal dome will become off even if its state is still on (seems to be triggered from inside the native code).
  // To restore its ON state we wait for V to get close enough to the vehicle again with this looping event
  if distancePlayerVehicle <= enableDistance {
    if evt.hasBeenOutOfVehicleRange {
      this.EnsureIsActive_CrystalDome();
      evt.hasBeenOutOfVehicleRange = false;
    }
  }
  else { // Wait for player to get out of defined range to enable crystal dome reactivation
    evt.hasBeenOutOfVehicleRange = true;
  }
  
  // Loop event only if all these conditions are satisfied:
  // - vehicle has been driven by the player
  // - crystal dome state shall be on
  // - player is not mounted into the vehicle
  if this.m_vehicleDrivenByV && this.GetPS().GetCrystalDomeState() && !VehicleComponent.IsMountedToProvidedVehicle(vehicle.GetGame(), player.GetEntityID(), vehicle) {
    let event: ref<PlayerIsAwayFromVehicleEvent> = new PlayerIsAwayFromVehicleEvent();
    event.hasBeenOutOfVehicleRange = evt.hasBeenOutOfVehicleRange;
    GameInstance.GetDelaySystem(vehicle.GetGame()).DelayEvent(vehicle, event, 1.00, true);

    return false;
  }
  
  return true;
}

@wrapMethod(VehicleComponent)
private final func RegisterInputListener() -> Void {
  let playerPuppet: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(this.GetVehicle().GetGame()).GetLocalPlayerMainGameObject() as PlayerPuppet;

  wrappedMethod();

  // // // // // // //
  // Register additional events we need
  //
  playerPuppet.RegisterInputListener(this, n"CameraX");
  playerPuppet.RegisterInputListener(this, n"CameraY");
  playerPuppet.RegisterInputListener(this, n"CameraMouseX");
  playerPuppet.RegisterInputListener(this, n"CameraMouseY");

  playerPuppet.RegisterInputListener(this, n"CycleDoor");
  playerPuppet.RegisterInputListener(this, n"CycleWindow");

  playerPuppet.RegisterInputListener(this, n"CycleEngineStep1");
  playerPuppet.RegisterInputListener(this, n"CycleEngineStep2");

  playerPuppet.RegisterInputListener(this, n"Exit");
  playerPuppet.RegisterInputListener(this, n"CycleDome");
  playerPuppet.RegisterInputListener(this, n"CycleSpoiler");
  playerPuppet.RegisterInputListener(this, n"ModdedCycleLights");

  playerPuppet.RegisterInputListener(this, n"Accelerate");
  playerPuppet.RegisterInputListener(this, n"Decelerate");
  // // // // // // //
}

@replaceMethod(VehicleComponent)
protected cb func OnAction(action: ListenerAction, consumer: ListenerActionConsumer) -> Bool {
  let radioEvent: ref<RadioToggleEvent>;
  let releaseTime: Float;
  let sirenState: Bool;
  let vehicle: ref<VehicleObject>;
  if this.GetPS().GetIsDestroyed() {
    return false;
  };
  vehicle = this.GetVehicle();
  if !IsDefined(vehicle) {
    return false;
  };
  if Equals(ListenerAction.GetName(action), n"VehicleInsideWheel") {
    if !StatusEffectSystem.ObjectHasStatusEffectWithTag(vehicle, n"VehicleBlockRadioInput") && this.IsRadioEnabled(vehicle.GetGame()) {
      if ListenerAction.IsButtonJustPressed(action) {
        this.m_radioPressTime = EngineTime.ToFloat(GameInstance.GetEngineTime(vehicle.GetGame()));
      };
      if ListenerAction.IsButtonJustReleased(action) {
        releaseTime = EngineTime.ToFloat(GameInstance.GetEngineTime(vehicle.GetGame()));
        if releaseTime <= this.m_radioPressTime + 0.20 {
          radioEvent = new RadioToggleEvent();
          vehicle.QueueEvent(radioEvent);
          if IsDefined(this.m_mountedPlayer) {
            this.m_mountedPlayer.QueueEvent(radioEvent);
          };
        };
      };
    };
  };
  if (Equals(ListenerAction.GetName(action), n"VehicleHornHold") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) || Equals(ListenerAction.GetName(action), n"VehicleHorn") && ListenerAction.IsButtonJustPressed(action)) && !this.m_hornOn {
    this.ToggleVehicleHorn(true);
    vehicle.GetStimBroadcasterComponent().TriggerSingleBroadcast(vehicle, gamedataStimType.VehicleHorn);
    this.m_hornOn = true;
  };
  if (Equals(ListenerAction.GetName(action), n"VehicleHornHold") || Equals(ListenerAction.GetName(action), n"VehicleHorn")) && this.m_hornOn && ListenerAction.IsButtonJustReleased(action) {
    this.ToggleVehicleHorn(false);
    this.m_hornOn = false;
  };
  if this.m_useAuxiliary && this.m_isPoliceVehicle && Equals(ListenerAction.GetName(action), n"VehicleSiren") {
    if ListenerAction.IsButtonJustPressed(action) {
      this.m_sirenPressTime = EngineTime.ToFloat(GameInstance.GetEngineTime(vehicle.GetGame()));
    };
    if ListenerAction.IsButtonJustReleased(action) && EngineTime.ToFloat(GameInstance.GetEngineTime(this.GetVehicle().GetGame())) - this.m_sirenPressTime < 0.25 {
      sirenState = this.GetPS().GetSirenState();
      
      if vehicle == (vehicle as BikeObject) {
        // Police motorbikes only have lights without a siren
        this.ToggleSiren(!sirenState, !sirenState);
      }
      else {
        // // // // // // //
        // Cycle the siren state when the player triggers the siren
        //
        if this.m_threeStatesSiren == 0 {
          this.m_threeStatesSiren = 1;

          // Lights ON (internal game siren state is ON)
          this.ToggleSiren(true, false);
        }
        else if this.m_threeStatesSiren == 1 {
          this.m_threeStatesSiren = 2;

          // Siren ON (internal game siren state is ON)
          this.GetVehicle().ToggleSiren(true);
          this.GetPS().SetSirenSoundsState(true);
        }
        else {
          this.m_threeStatesSiren = 0;

          // All OFF (internal game siren state is OFF)
          this.ToggleSiren(false, false);
        }
        // // // // // // //
      }
    };
  };



  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gameInstance: GameInstance = vehicle.GetGame();
  let playerPuppet: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject() as PlayerPuppet;

  if !IsDefined(vehicle) {
    return false;
  };

  if VehicleComponent.IsMountedToProvidedVehicle(gameInstance, playerPuppet.GetEntityID(), vehicle) {

    // // // // // // //
    // Event that toggles utility/auxiliary lights (short press)
    //
    // Short press: toggle utility lights
    //
    if Equals(ListenerAction.GetName(action), n"ModdedCycleLights") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_RELEASED) {
      
      if !this.m_cycleLightsLongInputTriggered && this.m_useAuxiliary {

        // If the headlights shutoff is active and the player toggles headlights then simply disable the headlights shutoff
        if this.m_temporaryHeadlightsShutOff && this.m_modSettings.utilityLightsSynchronizedWithHeadlightsShutoff {
          this.ToggleHeadlightsShutoff(false);
        }
        else {
          this.ToggleUtilityLights(!this.m_auxiliaryState);
        }

        this.ApplyHeadlightsMode();
        this.EnsureIsActive_UtilityLights();
        this.EnsureIsDisabled_UtilityLights();
      }

      this.m_cycleLightsLongInputTriggered = false;
    }
    // // // // // // //

    // // // // // // //
    // Hold: cycle headlights mode
    //
    if Equals(ListenerAction.GetName(action), n"ModdedCycleLights") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) {
      this.m_cycleLightsLongInputTriggered = true;

      // If the headlights shutoff is active and the player toggles headlights then simply disable the headlights shutoff
      if this.m_temporaryHeadlightsShutOff {
        this.ToggleHeadlightsShutoff(false);
      }
      else { // Otherwise, cycle the headlights mode
        if Equals(this.m_currentHeadlightsState, vehicleELightMode.Off) {
              this.m_currentHeadlightsState = vehicleELightMode.On;
          }
          else if Equals(this.m_currentHeadlightsState, vehicleELightMode.On) {
              this.m_currentHeadlightsState = vehicleELightMode.HighBeams;
          }
          else {
              this.m_currentHeadlightsState = vehicleELightMode.Off;
          }
      }
      
      this.ApplyHeadlightsMode();
      this.EnsureIsActive_UtilityLights();
      this.EnsureIsDisabled_UtilityLights();
    }
    // // // // // // //

    // All user actions that cannot work on motorbikes
    if vehicle != (vehicle as BikeObject) {
      // // // // // // //
      // Listen to the Exit user input so we can save doors state before the vehicle modifies them
      if Equals(ListenerAction.GetName(action), n"Exit") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_PRESSED) {
        // Remember current doors state so when the player has finished unmounting we can restore the doors state
        this.m_FL_doorState = this.GetPS().GetDoorState(EVehicleDoor.seat_front_left);
        this.m_FR_doorState = this.GetPS().GetDoorState(EVehicleDoor.seat_front_right);
        this.m_BL_doorState = this.GetPS().GetDoorState(EVehicleDoor.seat_back_left);
        this.m_BR_doorState = this.GetPS().GetDoorState(EVehicleDoor.seat_back_right);
      }
      // // // // // // //

      // // // // // // //
      // Event that toggles doors
      //
      // Multi-tap: toggle a specific door
      //
      if Equals(ListenerAction.GetName(action), n"CycleDoor") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_RELEASED) {

        if !this.m_cycleDoorLongInputTriggered {
          // If the last press time is older than "this.m_modSettings.multiTapTimeWindow" consider this is a new sequence
          if EngineTime.ToFloat(GameInstance.GetEngineTime(vehicle.GetGame())) - this.m_cycleDoorLastPressTime > this.m_modSettings.multiTapTimeWindow {
            this.m_cycleDoorStep = 0;
          }

          this.m_cycleDoorLastPressTime = EngineTime.ToFloat(GameInstance.GetEngineTime(vehicle.GetGame()));
          this.m_cycleDoorStep += 1;

          let event: ref<MultiTapDoorEvent> = new MultiTapDoorEvent();
          event.tapCount = this.m_cycleDoorStep;
          GameInstance.GetDelaySystem(vehicle.GetGame()).DelayEvent(vehicle, event, this.m_modSettings.multiTapTimeWindow, false);
        }

        this.m_cycleDoorLongInputTriggered = false;
      }
      // // // // // // //

      // // // // // // //
      // Hold: toggle all doors
      //
      if Equals(ListenerAction.GetName(action), n"CycleDoor") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) {
        this.m_cycleDoorLongInputTriggered = true;

        if vehicle.IsPlayerDriver() {

          let preventDoorClosingDuringCombat: Bool = this.m_isDriverCombat && this.m_isDriverCombatType_Doors;
          let preventWindowClosingDuringCombat: Bool = this.m_isDriverCombat && !this.m_isDriverCombatType_Doors;

          let FL_doorState: VehicleDoorState = this.GetPS().GetDoorState(EVehicleDoor.seat_front_left);
          let FR_doorState: VehicleDoorState = this.GetPS().GetDoorState(EVehicleDoor.seat_front_right);

          let FL_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_front_left);
          let FR_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_front_right);
          let BL_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_back_left);
          let BR_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_back_right);

          if Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_left), VehicleDoorState.Open)
          || Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_right), VehicleDoorState.Open)
          || Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_back_left), VehicleDoorState.Open)
          || Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_back_right), VehicleDoorState.Open) {

            if this.m_totalSeatSlots > 0 && !preventDoorClosingDuringCombat {
              VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetDriverSlotID());

              // DriverCombat modes:
              // - Doors: front doors need to be opened (like Rayfield Caliburn)
              // - Standard: front windows need to be open. However if doors type is Sliding Door (like Quadra V-Tech) then the user can still manipulate windows while doors are open only
              if preventWindowClosingDuringCombat {
                this.ForceFrontWindowsDuringCombat(VehicleDoorState.Closed, FR_doorState);
              }
            }
            if this.m_totalSeatSlots > 1 && !preventDoorClosingDuringCombat {
              VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetFrontPassengerSlotID());

              // DriverCombat modes:
              // - Doors: front doors need to be opened (like Rayfield Caliburn)
              // - Standard: front windows need to be open. However if doors type is Sliding Door (like Quadra V-Tech) then the user can still manipulate windows while doors are open only
              if preventWindowClosingDuringCombat {
                this.ForceFrontWindowsDuringCombat(FL_doorState, VehicleDoorState.Closed);
              }
            }
            if this.m_totalSeatSlots > 2 {
              VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetBackLeftPassengerSlotID());
            }
            if this.m_totalSeatSlots > 3 {
              VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetBackRightPassengerSlotID());
            }
          }
          else {
            // For some vehicles with sliding doors: if the window is opened we need to close it before we open the door because otherwise the window position will be weird once the sliding door is lift
            if this.m_totalSeatSlots > 0 {
              if this.m_hasIncompatibleSlidingDoorsWindow && Equals(FL_windowState, EVehicleWindowState.Open) {
                VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, VehicleComponent.GetDriverSlotID(), false);
              }
              VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetDriverSlotID());

              // DriverCombat mode Standard: if doors type is Sliding Door (like Quadra V-Tech) then the user can still manipulate windows while doors are open only
              if preventWindowClosingDuringCombat && this.m_isSlidingDoors {
                this.Recall_FL_WindowsState();
              }
            }

            // For some vehicles with sliding doors: if the window is opened we need to close it before we open the door because otherwise the window position will be weird once the sliding door is lift
            if this.m_totalSeatSlots > 1 {
              if this.m_hasIncompatibleSlidingDoorsWindow && Equals(FR_windowState, EVehicleWindowState.Open) {
                VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, VehicleComponent.GetFrontPassengerSlotID(), false);
              }
              VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetFrontPassengerSlotID());

              // DriverCombat mode Standard: if doors type is Sliding Door (like Quadra V-Tech) then the user can still manipulate windows while doors are open only
              if preventWindowClosingDuringCombat && this.m_isSlidingDoors {
                this.Recall_FR_WindowsState();
              }
            }

            // For some vehicles with sliding doors: if the window is opened we need to close it before we open the door because otherwise the window position will be weird once the sliding door is lift
            if this.m_totalSeatSlots > 2 {
              if this.m_hasIncompatibleSlidingDoorsWindow && Equals(BL_windowState, EVehicleWindowState.Open) {
                VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, VehicleComponent.GetBackLeftPassengerSlotID(), false);
              }
              VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetBackLeftPassengerSlotID());
            }

            // For some vehicles with sliding doors: if the window is opened we need to close it before we open the door because otherwise the window position will be weird once the sliding door is lift
            if this.m_totalSeatSlots > 3 {
              if this.m_hasIncompatibleSlidingDoorsWindow && Equals(BR_windowState, EVehicleWindowState.Open) {
                VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, VehicleComponent.GetBackRightPassengerSlotID(), false);
              }
              VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetBackRightPassengerSlotID());
            }
          }
        }
      }
      // // // // // // //

      // // // // // // //
      // Event that toggles interior lights and crystal dome
      //
      // Short press: toggle interior lights
      //
      if Equals(ListenerAction.GetName(action), n"CycleDome") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_RELEASED) {
        
        if !this.m_cycleDomeLongInputTriggered {
          this.ToggleInteriorLights(!this.m_interiorLightsState);
        }

        this.m_cycleDomeLongInputTriggered = false;
      }
      // // // // // // //

      // // // // // // //
      // Hold: toggle crystal dome
      //
      if Equals(ListenerAction.GetName(action), n"CycleDome") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) {
        this.m_cycleDomeLongInputTriggered = true;

        this.MyToggleCrystalDome(!this.GetPS().GetCrystalDomeState());
      }
      // // // // // // //

      // Not all vehicles have movable windows. Some have a crystal dome (fixed plates with screens inside) like the Rayfield Caliburn or the Rayfield Aerondight.
      // Some others have both a crystal dome and "window plates" that can be opened as regular windows such as the nomad Thorton Colby "Little Mule".
      //
      // Windows shall only be toggleable in the following cases:
      //  - Doors are "hasIncompatibleSlidingDoorsWindow" and closed. Otherwise the window animation will become weird while the door is lift.
      //  - Doors are not "hasIncompatibleSlidingDoorsWindow".
      //
      if this.m_hasWindows {
        // // // // // // //
        // Event that toggles windows
        //
        // Multi-tap: toggle a specific window
        //
        if Equals(ListenerAction.GetName(action), n"CycleWindow") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_RELEASED) {

          if !this.m_cycleWindowLongInputTriggered {
            // If the last press time is older than "this.m_modSettings.multiTapTimeWindow" consider this is a new sequence
            if EngineTime.ToFloat(GameInstance.GetEngineTime(vehicle.GetGame())) - this.m_cycleWindowLastPressTime > this.m_modSettings.multiTapTimeWindow {
              this.m_cycleWindowStep = 0;
            }

            this.m_cycleWindowLastPressTime = EngineTime.ToFloat(GameInstance.GetEngineTime(vehicle.GetGame()));
            this.m_cycleWindowStep += 1;

            let event: ref<MultiTapWindowEvent> = new MultiTapWindowEvent();
            event.tapCount = this.m_cycleWindowStep;
            GameInstance.GetDelaySystem(vehicle.GetGame()).DelayEvent(vehicle, event, this.m_modSettings.multiTapTimeWindow, false);
          }

          this.m_cycleWindowLongInputTriggered = false;
        }
        // // // // // // //

        // // // // // // //
        // Hold: toggle all windows
        //
        if Equals(ListenerAction.GetName(action), n"CycleWindow") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) {
          this.m_cycleWindowLongInputTriggered = true;

          if vehicle.IsPlayerDriver() {

            let preventWindowClosingDuringCombat: Bool = this.m_isDriverCombat && !this.m_isDriverCombatType_Doors;

            let FL_doorState: VehicleDoorState = this.GetPS().GetDoorState(EVehicleDoor.seat_front_left);
            let FR_doorState: VehicleDoorState = this.GetPS().GetDoorState(EVehicleDoor.seat_front_right);
            let BL_doorState: VehicleDoorState = this.GetPS().GetDoorState(EVehicleDoor.seat_back_left);
            let BR_doorState: VehicleDoorState = this.GetPS().GetDoorState(EVehicleDoor.seat_back_right);

            let FL_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_front_left);
            let FR_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_front_right);
            let BL_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_back_left);
            let BR_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_back_right);

            // Window shall only be toggleable in the following cases:
            //  - Doors are "hasIncompatibleSlidingDoorsWindow" and closed (otherwise the window animation will become weird while the door is lift)
            //  - Doors are not "hasIncompatibleSlidingDoorsWindow"
            //
            if Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_front_left), EVehicleWindowState.Open)
            || Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_front_right), EVehicleWindowState.Open)
            || Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_back_left), EVehicleWindowState.Open)
            || Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_back_right), EVehicleWindowState.Open) {

              if this.m_totalSeatSlots > 0 && (!preventWindowClosingDuringCombat || (this.m_isSlidingDoors && Equals(FL_doorState, VehicleDoorState.Open))) && (!this.m_hasIncompatibleSlidingDoorsWindow || Equals(FL_doorState, VehicleDoorState.Closed)) && Equals(FL_windowState, EVehicleWindowState.Open) {
                VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, VehicleComponent.GetDriverSlotID(), false);

                // During DriverCombat mode: if the user manipulates window while sliding doors are open then remember these new states as the recall state
                if preventWindowClosingDuringCombat {
                  this.m_FL_windowState = Equals(FL_windowState, EVehicleWindowState.Open) ? EVehicleWindowState.Closed : EVehicleWindowState.Open;
                }
              }
              if this.m_totalSeatSlots > 1 && (!preventWindowClosingDuringCombat || (this.m_isSlidingDoors && Equals(FR_doorState, VehicleDoorState.Open))) && (!this.m_hasIncompatibleSlidingDoorsWindow || Equals(FR_doorState, VehicleDoorState.Closed)) && Equals(FR_windowState, EVehicleWindowState.Open) {
                VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, VehicleComponent.GetFrontPassengerSlotID(), false);

                // During DriverCombat mode: if the user manipulates window while sliding doors are open then remember these new states as the recall state
                if preventWindowClosingDuringCombat {
                  this.m_FR_windowState = Equals(FR_windowState, EVehicleWindowState.Open) ? EVehicleWindowState.Closed : EVehicleWindowState.Open;
                }
              }
              if this.m_totalSeatSlots > 2 && (!this.m_hasIncompatibleSlidingDoorsWindow || Equals(BL_doorState, VehicleDoorState.Closed)) && Equals(BL_windowState, EVehicleWindowState.Open) {
                VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, VehicleComponent.GetBackLeftPassengerSlotID(), false);
              }
              if this.m_totalSeatSlots > 3 && (!this.m_hasIncompatibleSlidingDoorsWindow || Equals(BR_doorState, VehicleDoorState.Closed)) && Equals(BR_windowState, EVehicleWindowState.Open) {
                VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, VehicleComponent.GetBackRightPassengerSlotID(), false);
              }
            }
            else {
              if this.m_totalSeatSlots > 0 && (!this.m_hasIncompatibleSlidingDoorsWindow || Equals(FL_doorState, VehicleDoorState.Closed)) && Equals(FL_windowState, EVehicleWindowState.Closed) {
                VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, VehicleComponent.GetDriverSlotID(), true);

                // During DriverCombat mode: if the user manipulates window while sliding doors are open then remember these new states as the recall state
                if preventWindowClosingDuringCombat {
                  this.m_FL_windowState = Equals(FL_windowState, EVehicleWindowState.Open) ? EVehicleWindowState.Closed : EVehicleWindowState.Open;
                }
              }
              if this.m_totalSeatSlots > 1 && (!this.m_hasIncompatibleSlidingDoorsWindow || Equals(FR_doorState, VehicleDoorState.Closed)) && Equals(FR_windowState, EVehicleWindowState.Closed) {
                VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, VehicleComponent.GetFrontPassengerSlotID(), true);

                // During DriverCombat mode: if the user manipulates window while sliding doors are open then remember these new states as the recall state
                if preventWindowClosingDuringCombat {
                  this.m_FR_windowState = Equals(FR_windowState, EVehicleWindowState.Open) ? EVehicleWindowState.Closed : EVehicleWindowState.Open;
                }
              }
              if this.m_totalSeatSlots > 2 && (!this.m_hasIncompatibleSlidingDoorsWindow || Equals(BL_doorState, VehicleDoorState.Closed)) && Equals(BL_windowState, EVehicleWindowState.Closed) {
                VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, VehicleComponent.GetBackLeftPassengerSlotID(), true);
              }
              if this.m_totalSeatSlots > 3 && (!this.m_hasIncompatibleSlidingDoorsWindow || Equals(BR_doorState, VehicleDoorState.Closed)) && Equals(BR_windowState, EVehicleWindowState.Closed) {
                VehicleComponent.ToggleVehicleWindow(gameInstance, vehicle, VehicleComponent.GetBackRightPassengerSlotID(), true);
              }
            }
          }
        }
      }
      // // // // // // //

      // // // // // // //
      // Event that toggles spoiler / hood / trunk
      // 1 : Hood
      // 2 : Trunk
      // 3 : Spoiler
      //
      // Multi-tap
      //
      if Equals(ListenerAction.GetName(action), n"CycleSpoiler") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_RELEASED) {

        if !this.m_cycleSpoilerLongInputTriggered {
          // If the last press time is older than "this.m_modSettings.multiTapTimeWindow" consider this is a new sequence
          if EngineTime.ToFloat(GameInstance.GetEngineTime(vehicle.GetGame())) - this.m_cycleSpoilerLastPressTime > this.m_modSettings.multiTapTimeWindow {
            this.m_cycleSpoilerStep = 0;
          }

          this.m_cycleSpoilerLastPressTime = EngineTime.ToFloat(GameInstance.GetEngineTime(vehicle.GetGame()));
          this.m_cycleSpoilerStep += 1;

          let event: ref<MultiTapSpoilerEvent> = new MultiTapSpoilerEvent();
          event.tapCount = this.m_cycleSpoilerStep;
          GameInstance.GetDelaySystem(vehicle.GetGame()).DelayEvent(vehicle, event, this.m_modSettings.multiTapTimeWindow, false);
        }

        this.m_cycleSpoilerLongInputTriggered = false;
      }
      // // // // // // //

      // // // // // // //
      // Hold: toggle hood + trunk
      //
      if Equals(ListenerAction.GetName(action), n"CycleSpoiler") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) {
        this.m_cycleSpoilerLongInputTriggered = true;

        if Equals(this.GetPS().GetDoorState(EVehicleDoor.hood), VehicleDoorState.Open)
        || Equals(this.GetPS().GetDoorState(EVehicleDoor.trunk), VehicleDoorState.Open) {

          VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetHoodSlotID());
          VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetTrunkSlotID());
        }
        else {
          VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetHoodSlotID());
          VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetTrunkSlotID());
        }
      }
      // // // // // // //
    }

    // // // // // // //
    // Use this trick in case V has got out of the vehicle with the engine running, and then got back in. The engine sound is still present but the internal logic of the vehicle object is engine off.
    // So we turn it fully back on seemlessly when the player accelerates.
    //
    if (Equals(ListenerAction.GetName(action), n"Accelerate") || Equals(ListenerAction.GetName(action), n"Decelerate")) && vehicle.IsEngineTurnedOn() && NotEquals(this.GetVehicleControllerPS().GetState(), vehicleEState.On) {
      this.TogglePowerState(true);
      vehicle.TurnEngineOn(true);
      // LogChannel(n"DEBUG", s"Turn engine -> true");
    }
    // // // // // // //

    // // // // // // //
    // Use camera movements to update headlights. Not a perfect solution but it works pretty well !
    //
    if vehicle.IsPlayerDriver() && (Equals(ListenerAction.GetName(action), n"CameraMouseX") || Equals(ListenerAction.GetName(action), n"CameraMouseY") || Equals(ListenerAction.GetName(action), n"CameraX") || Equals(ListenerAction.GetName(action), n"CameraY")) && !this.m_temporaryHeadlightsShutOff {
      this.ApplyHeadlightsMode();
    }
    // // // // // // //

    let playerPuppet: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(vehicle.GetGame()).GetLocalPlayerMainGameObject() as PlayerPuppet;

    let preventEngineShutdown: Bool = vehicle.IsEngineTurnedOn() && playerPuppet.IsInCombat() && this.m_modSettings.preventPowerOffDuringCombat;
    let preventPowerShutdown: Bool = this.m_powerState && playerPuppet.IsInCombat() && this.m_modSettings.preventPowerOffDuringCombat;

    // // // // // // //
    // Event that toggles power state and engine
    //
    // Double-tap: toggle power state
    //
    if Equals(ListenerAction.GetName(action), n"CycleEngineStep1") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_PRESSED) {

      // If the last press time is older than "this.m_modSettings.multiTapTimeWindow" consider this is a new sequence
      if EngineTime.ToFloat(GameInstance.GetEngineTime(vehicle.GetGame())) - this.m_cycleEngineLastPressTime > this.m_modSettings.multiTapTimeWindow {
        this.m_cycleEngineLastPressTime = EngineTime.ToFloat(GameInstance.GetEngineTime(vehicle.GetGame()));
      }
      else if !preventPowerShutdown {
        this.TogglePowerState(!this.m_powerState);

        if !this.m_powerState && vehicle.IsEngineTurnedOn() {
          vehicle.TurnEngineOn(false);
          // LogChannel(n"DEBUG", s"Turn engine -> false");
        }
        
        this.ApplyHeadlightsModeWithShutOff();
        this.ApplyUtilityLightsWithShutOff();
      }
    }
    // // // // // // //

    // // // // // // //
    // First step of the CycleEngine HOLD event: toggle the engine.
    //
    if !preventEngineShutdown && Equals(ListenerAction.GetName(action), n"CycleEngineStep1") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) {
      
      // When turning the engine ON without power on first, the interior lights always light up automatically
      if !this.m_powerState {
        this.TogglePowerState(true);
      }

      // In case we start the engine, then shut the engine off with headlights shut off (hold step 2), then start the engine again we need to disable shut off
      if !vehicle.IsEngineTurnedOn() {
        this.ToggleHeadlightsShutoff(false);

        this.ApplyHeadlightsModeWithShutOff();
        this.ApplyUtilityLightsWithShutOff();
      }

      // LogChannel(n"DEBUG", s"Turn engine -> \(!vehicle.IsEngineTurnedOn())");
      vehicle.TurnEngineOn(!vehicle.IsEngineTurnedOn());
    }
    // // // // // // //
    
    // // // // // // //
    // Second step of the CycleEngine HOLD event: turn the headlights off.
    //
    if Equals(ListenerAction.GetName(action), n"CycleEngineStep2") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) && !vehicle.IsEngineTurnedOn() {
      
      this.ToggleHeadlightsShutoff(true);

      this.ApplyHeadlightsModeWithShutOff();
      this.ApplyUtilityLightsWithShutOff();
    }
    // // // // // // //
  }
}

@addMethod(VehicleComponent)
protected final func GetPlayerSlotID() -> MountingSlotId {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gameInstance: GameInstance = vehicle.GetGame();
  let playerPuppet: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(vehicle.GetGame()).GetLocalPlayerMainGameObject() as PlayerPuppet;

  let mountInfos: MountingInfo = GameInstance.GetMountingFacility(gameInstance).GetMountingInfoSingleWithIds(playerPuppet.GetEntityID());
  
  return mountInfos.slotId;
}

@addMethod(VehicleComponent)
protected final func GetPlayerSlotName() -> CName {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gameInstance: GameInstance = vehicle.GetGame();
  let playerPuppet: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(vehicle.GetGame()).GetLocalPlayerMainGameObject() as PlayerPuppet;

  let mountInfos: MountingInfo = GameInstance.GetMountingFacility(gameInstance).GetMountingInfoSingleWithIds(playerPuppet.GetEntityID());
  
  return mountInfos.slotId.id;
}

@addMethod(VehicleComponent)
protected final func ApplyHeadlightsModeWithShutOff() {
  if this.IsPanzer() {
    return;
  }

  if !this.m_temporaryHeadlightsShutOff && NotEquals(this.GetVehicleControllerPS().GetHeadLightMode(), this.m_currentHeadlightsState) {
    this.GetVehicleControllerPS().SetHeadLightMode(this.m_currentHeadlightsState);
    // LogChannel(n"DEBUG", s"Set headlights -> \(this.m_currentHeadlightsState)");
  }
  else if this.m_temporaryHeadlightsShutOff && NotEquals(this.GetVehicleControllerPS().GetHeadLightMode(), vehicleELightMode.Off) {
    this.GetVehicleControllerPS().SetHeadLightMode(vehicleELightMode.Off);
    // LogChannel(n"DEBUG", s"Set headlights -> \(this.GetVehicleControllerPS().GetHeadLightMode())");
  }
}

@addMethod(VehicleComponent)
protected final func ApplyHeadlightsMode() {
  if this.IsPanzer() {
    return;
  }

  if NotEquals(this.GetVehicleControllerPS().GetHeadLightMode(), this.m_currentHeadlightsState) {    
    this.GetVehicleControllerPS().SetHeadLightMode(this.m_currentHeadlightsState);
    // LogChannel(n"DEBUG", s"Set headlights -> \(this.m_currentHeadlightsState)");
  }
}

@addMethod(VehicleComponent)
protected final func UpdateHeadlightsWithTimeSync() {
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if this.m_headlightsSynchronizedWithTimeShallEnable {

    // If utility lights are included
    switch this.m_modSettings.utilityLightsSynchronizedWithTimeVehicleType {

      case EUtilityLightsSynchronizedWithTimeVehicleType.No:
        // Do nothing
        break;

      case EUtilityLightsSynchronizedWithTimeVehicleType.Motorcycles:
        if vehicle == (vehicle as BikeObject) {
          this.m_auxiliaryState = true; // Silent toggle
          // LogChannel(n"DEBUG", s"Set utility lights mode by time sync -> \(this.m_auxiliaryState)");
        }
        break;
        
      case EUtilityLightsSynchronizedWithTimeVehicleType.AllVehicles:
        this.m_auxiliaryState = true; // Silent toggle
        // LogChannel(n"DEBUG", s"Set utility lights mode by time sync -> \(this.m_auxiliaryState)");
        break;
    }

    // Only update headlights state if they are not already turned on no matter the current mode
    if Equals(this.m_currentHeadlightsState, vehicleELightMode.Off) {
      switch this.m_modSettings.headlightsSynchronizedWithTimeMode {

        case EHeadlightsSynchronizedWithTimeMode.LowBeam:
          this.m_currentHeadlightsState = vehicleELightMode.On;
          // LogChannel(n"DEBUG", s"Set headlights mode by time sync -> \(this.m_currentHeadlightsState)");
          break;
          
        case EHeadlightsSynchronizedWithTimeMode.HighBeam:
          this.m_currentHeadlightsState = vehicleELightMode.HighBeams;
          // LogChannel(n"DEBUG", s"Set headlights mode by time sync -> \(this.m_currentHeadlightsState)");
          break;
      }
    }
  }
  else {
    this.m_currentHeadlightsState = vehicleELightMode.Off;
    // LogChannel(n"DEBUG", s"Set headlights mode by time sync -> \(this.m_currentHeadlightsState)");

    // If utility lights are included
    switch this.m_modSettings.utilityLightsSynchronizedWithTimeVehicleType {

      case EUtilityLightsSynchronizedWithTimeVehicleType.No:
        // Do nothing
        break;

      case EUtilityLightsSynchronizedWithTimeVehicleType.Motorcycles:
        if vehicle == (vehicle as BikeObject) {
          this.m_auxiliaryState = false; // Silent toggle
          // LogChannel(n"DEBUG", s"Set utility lights mode by time sync -> \(this.m_auxiliaryState)");
        }
        break;
        
      case EUtilityLightsSynchronizedWithTimeVehicleType.AllVehicles:
        this.m_auxiliaryState = false; // Silent toggle
        // LogChannel(n"DEBUG", s"Set utility lights mode by time sync -> \(this.m_auxiliaryState)");
        break;
    }
  }
}

@addMethod(VehicleComponent)
protected final func ToggleInteriorLights(toggle: Bool) {
  if NotEquals(this.m_interiorLightsState, toggle) {
    this.m_interiorLightsState = toggle;
    this.GetVehicleController().ToggleLights(this.m_interiorLightsState, vehicleELightType.Interior);
    // LogChannel(n"DEBUG", s"Set interior lights -> \(this.m_interiorLightsState)");
  }
}

@addMethod(VehicleComponent)
protected final func EnsureIsActive_InteriorLights() {
  if this.m_interiorLightsState {
    this.GetVehicleController().ToggleLights(this.m_interiorLightsState, vehicleELightType.Interior);
    // LogChannel(n"DEBUG", s"Set interior lights -> \(this.m_interiorLightsState)");
  }
}

@addMethod(VehicleComponent)
protected final func MyToggleCrystalDome(toggle: Bool) {
  if NotEquals(this.GetPS().GetCrystalDomeState(), toggle) {
    this.ToggleCrystalDome(toggle);
    // LogChannel(n"DEBUG", s"Set crystal dome -> \(this.GetPS().GetCrystalDomeState())");
  }
}

@addMethod(VehicleComponent)
protected final func EnsureIsActive_CrystalDome() {
  if this.GetPS().GetCrystalDomeState() {
    this.ToggleCrystalDome(true, true, true);
    // LogChannel(n"DEBUG", s"Ensure crystal dome -> true");
  }
}

@addMethod(VehicleComponent)
protected final func ToggleHeadlightsShutoff(toggle: Bool) {
  if NotEquals(this.m_temporaryHeadlightsShutOff, toggle) {
    this.m_temporaryHeadlightsShutOff = toggle;
    // LogChannel(n"DEBUG", s"Set headlights shutoff -> \(this.m_temporaryHeadlightsShutOff)");
  }
}

@addMethod(VehicleComponent)
protected final func TogglePowerState(toggle: Bool) {

  if NotEquals(this.m_powerState, toggle) {
    this.m_powerState = toggle;
    // LogChannel(n"DEBUG", s"Set power state -> \(this.m_powerState)");

    this.ToggleDashboard(toggle);
    this.ToggleInteriorLights(toggle);

    this.ToggleHeadlightsShutoff(!toggle);

    this.m_headlightsTimerIdentifier += 1;

    if this.m_modSettings.headlightsSynchronizedWithTimeEnabled {
      let event: ref<GameTimeElapsedEvent> = new GameTimeElapsedEvent();
      event.identifier = this.m_headlightsTimerIdentifier;

      // Call the event synchronously for the first time
      this.OnGameTimeElapsedEvent(event);
      
      this.UpdateHeadlightsWithTimeSync();
    }

    this.ApplyHeadlightsModeWithShutOff();
    this.ApplyUtilityLightsWithShutOff();

    if this.m_modSettings.crystalDomeSynchronizedWithPowerState {
      this.MyToggleCrystalDome(toggle);
    }

    if this.m_modSettings.spoilerSynchronizedWithPowerState {
      this.ToggleSpoiler(toggle);
    }
  }
}

@addMethod(VehicleComponent)
protected final func ToggleSpoiler(toggle: Bool) {
  let animFeature: ref<AnimFeature_PartData>;
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if this.m_hasSpoiler && NotEquals(this.m_spoilerDeployed, toggle) {
    this.m_spoilerDeployed = !toggle;

    if !this.m_spoilerDeployed {
      animFeature = new AnimFeature_PartData();
      animFeature.state = 1;
      animFeature.duration = 0.75;
      AnimationControllerComponent.ApplyFeatureToReplicate(vehicle, n"spoiler", animFeature);
      this.m_spoilerDeployed = true;
    }
    else {
      animFeature = new AnimFeature_PartData();
      animFeature.state = 3;
      animFeature.duration = 0.75;
      AnimationControllerComponent.ApplyFeatureToReplicate(vehicle, n"spoiler", animFeature);
      this.m_spoilerDeployed = false;
    }
  }
}

@addMethod(VehicleComponent)
protected final func ToggleUtilityLights(toggle: Bool) {
  if this.m_isPoliceVehicle {
    return;
  }

  if NotEquals(this.m_auxiliaryState, toggle) {
    this.m_auxiliaryState = toggle;

    if this.m_auxiliaryState {
      this.ApplyUtilityLightsSettingsChange();
    }
    else {
      this.m_activeEffectIdentifier += 1;
    }
    
    this.GetVehicleController().ToggleLights(this.m_auxiliaryState, vehicleELightType.Utility);
    // LogChannel(n"DEBUG", s"Set utility lights -> \(this.m_auxiliaryState)");
  }
}

@addMethod(VehicleComponent)
protected final func ApplyUtilityLightsWithShutOff() {
  if this.m_isPoliceVehicle {
    return;
  }

  if !this.m_temporaryHeadlightsShutOff {
    this.EnsureIsActive_UtilityLights();
    this.EnsureIsDisabled_UtilityLights();
  }
  else { // Shut off
    if this.m_modSettings.utilityLightsSynchronizedWithHeadlightsShutoff {
      this.m_activeEffectIdentifier += 1;
      this.GetVehicleController().ToggleLights(false, vehicleELightType.Utility);
      // LogChannel(n"DEBUG", s"Set utility lights with shutoff -> false");
    }
    else {
      this.EnsureIsActive_UtilityLights();
      this.EnsureIsDisabled_UtilityLights();
    }
  }
}

@addMethod(VehicleComponent)
protected final func EnsureIsActive_UtilityLights() {
  if this.m_auxiliaryState {
    this.ApplyUtilityLightsSettingsChange();
    this.GetVehicleController().ToggleLights(this.m_auxiliaryState, vehicleELightType.Utility);
    // LogChannel(n"DEBUG", s"Ensure utility lights active -> \(this.m_auxiliaryState)");
  }
}

@addMethod(VehicleComponent)
protected final func EnsureIsDisabled_UtilityLights() {
  if !this.m_auxiliaryState {
    this.m_activeEffectIdentifier += 1;
    this.GetVehicleController().ToggleLights(this.m_auxiliaryState, vehicleELightType.Utility);
    // LogChannel(n"DEBUG", s"Ensure utility lights disabled -> \(this.m_auxiliaryState)");
  }
}

@addMethod(VehicleComponent)
protected final func TogglePlayerMounted(toggle: Bool) {
  if NotEquals(this.m_playerIsMounted, toggle) {
    this.m_playerIsMounted = toggle;
    // LogChannel(n"DEBUG", s"Set player mounted -> \(this.m_playerIsMounted)");
  }

  if !toggle {
    this.m_playerIsMountedFromPassengerSeat = false;
  }
}

@addMethod(VehicleComponent)
protected final func ToggleDashboard(toggle: Bool) {
  if this.IsPanzer() {
    return;
  }

  this.GetVehicle().SetInteriorUIEnabled(toggle);
  // LogChannel(n"DEBUG", s"Set dashboard -> \(toggle)");
}

@addMethod(VehicleComponent)
protected final func Ensure_VehicleState(state: vehicleEState) {
  if NotEquals(this.GetVehicleControllerPS().GetState(), state) {
    this.GetVehicleControllerPS().SetState(state);
    // LogChannel(n"DEBUG", s"Set vehicle state -> \(state)");
  }
}

@addMethod(VehicleComponent)
protected final func OnEnter_CrystalDomeMesh() {
  // LogChannel(n"DEBUG", s"OnEnter_CrystalDomeMesh");
  if IsDefined(this.m_crystalDomeMeshTimings) {
    let vehicle: ref<VehicleObject> = this.GetVehicle();
    let playerPuppet: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(vehicle.GetGame()).GetLocalPlayerMainGameObject() as PlayerPuppet;

    let fastEntryMultiplier: Float = playerPuppet.IsInCombat() ? 0.60 : 1.00;

    let event: ref<CrystalDomeMeshEvent> = new CrystalDomeMeshEvent();
    event.tppEnabled = this.GetPS().GetCrystalDomeState();
    GameInstance.GetDelaySystem(vehicle.GetGame()).DelayEvent(vehicle, event, this.m_crystalDomeMeshTimings.FL_in * fastEntryMultiplier, true);
  }
}

@addMethod(VehicleComponent)
protected final func OnPassengerEnter_CrystalDomeMesh() {
  // LogChannel(n"DEBUG", s"OnPassengerEnter_CrystalDomeMesh");
  if IsDefined(this.m_crystalDomeMeshTimings) {
    let event: ref<CrystalDomeMeshEvent> = new CrystalDomeMeshEvent();
    event.tppEnabled = this.GetPS().GetCrystalDomeState();
    GameInstance.GetDelaySystem(this.GetVehicle().GetGame()).DelayEvent(this.GetVehicle(), event, this.m_crystalDomeMeshTimings.FR_in, true);
  }
}

@addMethod(VehicleComponent)
protected final func OnExit_CrystalDomeMesh() {
  // LogChannel(n"DEBUG", s"OnExit_CrystalDomeMesh");
  if IsDefined(this.m_crystalDomeMeshTimings) {
    let vehicle: ref<VehicleObject> = this.GetVehicle();
    let playerPuppet: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(vehicle.GetGame()).GetLocalPlayerMainGameObject() as PlayerPuppet;

    let fastExitTiming: Float = playerPuppet.IsInCombat() ? this.m_vehicleDataPackage.CombatEntering() / this.m_vehicleDataPackage.Entering() : 1.00;

    let event: ref<CrystalDomeMeshEvent> = new CrystalDomeMeshEvent();
    event.tppEnabled = false;
    GameInstance.GetDelaySystem(this.GetVehicle().GetGame()).DelayEvent(this.GetVehicle(), event, this.m_crystalDomeMeshTimings.FL_out * fastExitTiming, true);
  }
}

// This method will cycle doors only if their previous state before entering/exiting is the opposite
@addMethod(VehicleComponent)
private final func RecallVehicleDoorsState(opt autoCloseDelay: Float) -> Void {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let PSVehicleDoorCloseRequest: ref<VehicleDoorClose>;

  if NotEquals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_left), this.m_FL_doorState) {
    if Equals(this.m_FL_doorState, VehicleDoorState.Open) {
      VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetDriverSlotID());
    }
    else {
      if autoCloseDelay > 0.00 {
        PSVehicleDoorCloseRequest = new VehicleDoorClose();
        PSVehicleDoorCloseRequest.slotID = VehicleComponent.GetDriverSlotName();
        GameInstance.GetDelaySystem(vehicle.GetGame()).DelayPSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), PSVehicleDoorCloseRequest, autoCloseDelay, true);
      }
      else {
        VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetDriverSlotID());
      }
    }
  }
  
  if NotEquals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_right), this.m_FR_doorState) {
    if Equals(this.m_FR_doorState, VehicleDoorState.Open) {
      VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetFrontPassengerSlotID());
    }
    else {
      if autoCloseDelay > 0.00 {
        PSVehicleDoorCloseRequest = new VehicleDoorClose();
        PSVehicleDoorCloseRequest.slotID = VehicleComponent.GetFrontPassengerSlotName();
        GameInstance.GetDelaySystem(vehicle.GetGame()).DelayPSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), PSVehicleDoorCloseRequest, autoCloseDelay, true);
      }
      else {
        VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetFrontPassengerSlotID());
      }
    }
  }
  
  if NotEquals(this.GetPS().GetDoorState(EVehicleDoor.seat_back_left), this.m_BL_doorState) {
    if Equals(this.m_BL_doorState, VehicleDoorState.Open) {
      VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetBackLeftPassengerSlotID());
    }
    else {
      if autoCloseDelay > 0.00 {
        PSVehicleDoorCloseRequest = new VehicleDoorClose();
        PSVehicleDoorCloseRequest.slotID = VehicleComponent.GetBackLeftPassengerSlotName();
        GameInstance.GetDelaySystem(vehicle.GetGame()).DelayPSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), PSVehicleDoorCloseRequest, autoCloseDelay, true);
      }
      else {
        VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetBackLeftPassengerSlotID());
      }
    }
  }
  
  if NotEquals(this.GetPS().GetDoorState(EVehicleDoor.seat_back_right), this.m_BR_doorState) {
    if Equals(this.m_BR_doorState, VehicleDoorState.Open) {
      VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetBackRightPassengerSlotID());
    }
    else {
      if autoCloseDelay > 0.00 {
        PSVehicleDoorCloseRequest = new VehicleDoorClose();
        PSVehicleDoorCloseRequest.slotID = VehicleComponent.GetBackRightPassengerSlotName();
        GameInstance.GetDelaySystem(vehicle.GetGame()).DelayPSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), PSVehicleDoorCloseRequest, autoCloseDelay, true);
      }
      else {
        VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetBackRightPassengerSlotID());
      }
    }
  }
}

@addMethod(VehicleComponent)
private final func Recall_FL_WindowsState() -> Void {
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  let FL_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_front_left);

  if NotEquals(FL_windowState, this.m_FL_windowState) && Equals(this.m_FL_windowState, EVehicleWindowState.Closed) {
    VehicleComponent.ToggleVehicleWindow(vehicle.GetGame(), vehicle, VehicleComponent.GetDriverSlotID(), false);
  }
}

@addMethod(VehicleComponent)
private final func Recall_FR_WindowsState() -> Void {
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  let FR_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_front_right);

  if NotEquals(FR_windowState, this.m_FR_windowState) && Equals(this.m_FR_windowState, EVehicleWindowState.Closed) {
    VehicleComponent.ToggleVehicleWindow(vehicle.GetGame(), vehicle, VehicleComponent.GetFrontPassengerSlotID(), false);
  }
}

@addMethod(VehicleComponent)
private final func CloseWindow(slotId: MountingSlotId) -> Void {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let doorEnum: EVehicleDoor = EVehicleDoor.invalid;

  this.GetVehicleDoorEnum(doorEnum, slotId.id);

  if Equals(this.GetPS().GetWindowState(doorEnum), EVehicleWindowState.Open) {
    VehicleComponent.ToggleVehicleWindow(vehicle.GetGame(), vehicle, slotId, false);
  }
}

// This method will cycle front windows only if their previous state before entering/exiting is the opposite
@addMethod(VehicleComponent)
private final func ForceFrontWindowsDuringCombat(FL_doorState: VehicleDoorState, FR_doorState: VehicleDoorState) -> Void {

  if !this.m_hasWindows {
    return;
  }

  let vehicle: ref<VehicleObject> = this.GetVehicle();

  let FL_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_front_left);
  let FR_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_front_right);

  if this.m_isSlidingDoors {
    // Sliding doors: only force windows open even if doors are closed
    if Equals(FL_doorState, VehicleDoorState.Closed)
    && Equals(FL_windowState, EVehicleWindowState.Closed) {
      VehicleComponent.ToggleVehicleWindow(vehicle.GetGame(), vehicle, VehicleComponent.GetDriverSlotID(), true);
    }
    if Equals(FR_doorState, VehicleDoorState.Closed)
    && Equals(FR_windowState, EVehicleWindowState.Closed) {
      VehicleComponent.ToggleVehicleWindow(vehicle.GetGame(), vehicle, VehicleComponent.GetFrontPassengerSlotID(), true);
    }
  }
  else { // Hinged doors: always force windows open even if doors are open
    if Equals(FL_windowState, EVehicleWindowState.Closed) {
      VehicleComponent.ToggleVehicleWindow(vehicle.GetGame(), vehicle, VehicleComponent.GetDriverSlotID(), true);
    }
    if Equals(FR_windowState, EVehicleWindowState.Closed) {
      VehicleComponent.ToggleVehicleWindow(vehicle.GetGame(), vehicle, VehicleComponent.GetFrontPassengerSlotID(), true);
    }
  }
}

@addMethod(VehicleComponent)
public final static func GetBackLeftPassengerSlotID() -> MountingSlotId {
  let slotID: MountingSlotId;
  slotID.id = n"seat_back_left";
  return slotID;
}

@addMethod(VehicleComponent)
public final static func GetBackRightPassengerSlotID() -> MountingSlotId {
  let slotID: MountingSlotId;
  slotID.id = n"seat_back_right";
  return slotID;
}

@addMethod(VehicleComponent)
public final static func GetHoodSlotID() -> MountingSlotId {
  let slotID: MountingSlotId;
  slotID.id = n"hood";
  return slotID;
}

@addMethod(VehicleComponent)
public final static func GetTrunkSlotID() -> MountingSlotId {
  let slotID: MountingSlotId;
  slotID.id = n"trunk";
  return slotID;
}

@addMethod(VehicleComponent)
public func ToColor(colorArray: array<Int32>) -> Color {

  let customRed = Cast<Uint8>(colorArray[0]);
  let customGreen = Cast<Uint8>(colorArray[1]);
  let customBlue = Cast<Uint8>(colorArray[2]);
  
  return new Color(customRed, customGreen, customBlue, Cast<Uint8>(0));
}

@addMethod(VehicleComponent)
public func IsAfter(time1: GameTime, time2: GameTime) -> Bool {

  if GameTime.Hours(time1) > GameTime.Hours(time2) {
    return true;
  }
  else if GameTime.Hours(time1) < GameTime.Hours(time2) {
    return false;
  }

  if GameTime.Minutes(time1) > GameTime.Minutes(time2) {
    return true;
  }
  else if GameTime.Minutes(time1) < GameTime.Minutes(time2) {
    return false;
  }

  if GameTime.Seconds(time1) > GameTime.Seconds(time2) {
    return true;
  }
  else if GameTime.Seconds(time1) < GameTime.Seconds(time2) {
    return false;
  }
  
  return false;
}

@addMethod(VehicleComponent)
public func GameTimeToString(time: GameTime) -> String {
  return s"\(GameTime.Hours(time)):\(GameTime.Minutes(time)):\(GameTime.Seconds(time))";
}

@addMethod(VehicleComponent)
public func GameTimeEquals(time1: GameTime, time2: GameTime) -> Bool {

  // Check if times are the same more or less few seconds because the in game time is not 1:1 with reality
  if GameTime.Hours(time1) == GameTime.Hours(time2)
  && GameTime.Minutes(time1) == GameTime.Minutes(time2)
  && Abs(GameTime.Seconds(time1) - GameTime.Seconds(time2)) <= 10 {
    return true;
  }
  
  return false;
}

@addMethod(VehicleComponent)
public func ResetUtilityLightsDefaultColor(instant: Bool) -> Void {
  let delay: Float = instant ? 0.00 : this.m_modSettings.utilityLightsColorSequenceSpeed;

  let defaultColor: Color = this.TryGetDefaultColor();

  if !this.m_utilityLightsIsDefaultColor {

    if this.IsColorDefined(defaultColor) {
      this.GetVehicleController().SetLightColor(vehicleELightType.Utility, defaultColor, delay);
    }
    else {
      this.GetVehicleController().ResetLightColor(vehicleELightType.Utility, delay);
    }

    this.m_utilityLightsIsDefaultColor = true;
  }
}

@addMethod(VehicleComponent)
public func ResetUtilityLightsDefaultIntensity(instant: Bool) -> Void {
  let delay: Float = instant ? 0.00 : this.m_modSettings.utilityLightsColorSequenceSpeed;

  if !this.m_utilityLightsIsDefaultIntensity {
    this.GetVehicleController().ResetLightStrength(vehicleELightType.Utility, delay);

    this.m_utilityLightsIsDefaultIntensity = true;
  }
}

@addMethod(VehicleComponent)
public func ResetUtilityLightsParameters(instant: Bool) -> Void {
  this.ResetUtilityLightsDefaultColor(instant);
  this.ResetUtilityLightsDefaultIntensity(instant);
}

@addMethod(VehicleComponent)
public func ApplyUtilityLightsParameters(instant: Bool, minimalIntensity: Bool, nullIntensity: Bool, opt inputColor: Color) -> Void {
  let delay: Float = instant ? 0.00 : this.m_modSettings.utilityLightsColorSequenceSpeed;

  let inputColorDefined: Bool = this.IsColorDefined(inputColor);
  let color: Color = inputColorDefined ? inputColor : this.GetCustomColor();

  if inputColorDefined {
    this.m_utilityLightsIsDefaultColor = false;
    this.GetVehicleController().SetLightColor(vehicleELightType.Utility, inputColor, delay);
  }
  else if this.m_modSettings.customUtilityLightsColorEnabled {
    this.m_utilityLightsIsDefaultColor = false;
    this.GetVehicleController().SetLightColor(vehicleELightType.Utility, color, delay);
  }
  else {
    this.ResetUtilityLightsDefaultColor(instant);
  }

  if nullIntensity {
    this.m_utilityLightsIsDefaultIntensity = false;
    this.GetVehicleController().SetLightStrength(vehicleELightType.Utility, 0.00, delay);
  }
  else if minimalIntensity {
    this.m_utilityLightsIsDefaultIntensity = false;
    this.GetVehicleController().SetLightStrength(vehicleELightType.Utility, this.m_minimalIntensity, delay);
  }
  else if this.m_modSettings.customUtilityLightsIntensityEnabled {
    this.m_utilityLightsIsDefaultIntensity = false;
    this.GetVehicleController().SetLightStrength(vehicleELightType.Utility, Cast<Float>(this.m_modSettings.utilityLightsColorIntensity) / 100.0, delay);
  }
  else {
    this.ResetUtilityLightsDefaultIntensity(instant);
  }
}

@addMethod(VehicleComponent)
public func GetCustomColor() -> Color {

  let customRed = Cast<Uint8>(this.m_modSettings.R_utilityLightsColor);
  let customGreen = Cast<Uint8>(this.m_modSettings.G_utilityLightsColor);
  let customBlue = Cast<Uint8>(this.m_modSettings.B_utilityLightsColor);
  
  return new Color(customRed, customGreen, customBlue, Cast<Uint8>(255));
}

@addMethod(VehicleComponent)
public func GetCycleColor() -> Color {

  let cycleRed = Cast<Uint8>(this.m_modSettings.R_cycle_utilityLightsColor);
  let cycleGreen = Cast<Uint8>(this.m_modSettings.G_cycle_utilityLightsColor);
  let cycleBlue = Cast<Uint8>(this.m_modSettings.B_cycle_utilityLightsColor);
  
  return new Color(cycleRed, cycleGreen, cycleBlue, Cast<Uint8>(255));
}

@addMethod(VehicleComponent)
public func TryGetDefaultColor() -> Color {
  return this.ToColor(this.m_vehicleRecord.UtilityLightColor());
}

@addMethod(VehicleComponent)
public func GetBlackColor() -> Color {

  let zero: Uint8 = Cast<Uint8>(0);
  
  return new Color(zero, zero, zero, zero);
}

@addMethod(VehicleComponent)
public func IsColorDefined(color: Color) -> Bool {
  let zero: Uint8 = Cast<Uint8>(0);

  return !(color.Red == zero && color.Green == zero && color.Blue == zero);
}

@addMethod(VehicleComponent)
public func ApplyUtilityLightsSettingsChange() -> Void {
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !this.m_useAuxiliary || this.m_isPoliceVehicle || !this.m_auxiliaryState {
    return;
  }

  this.m_activeEffectIdentifier += 1;

  if Equals(this.m_modSettings.customUtilityLightsColorVehicleType, EUtilityLightsColorVehicleType.Motorcycles)
  && vehicle != (vehicle as BikeObject) {
    this.ResetUtilityLightsParameters(false);
    return;
  }
  
  switch this.m_modSettings.utilityLightsColorSequence {

    case EUtilityLightsColorCycleType.Solid:
      this.ApplyUtilityLightsParameters(false, false, false);
      break;

    case EUtilityLightsColorCycleType.Blinker:

      let event: ref<BlinkerEffectEvent> = new BlinkerEffectEvent();
      event.identifier = this.m_activeEffectIdentifier;
      event.step = 0;
      vehicle.QueueEvent(event);
      break;

    case EUtilityLightsColorCycleType.Beacon:

      let event: ref<BeaconEffectEvent> = new BeaconEffectEvent();
      event.identifier = this.m_activeEffectIdentifier;
      event.step = 0;
      vehicle.QueueEvent(event);
      break;

    case EUtilityLightsColorCycleType.Pulse:

      let event: ref<PulseEffectEvent> = new PulseEffectEvent();
      event.identifier = this.m_activeEffectIdentifier;
      event.step = 0;
      vehicle.QueueEvent(event);
      break;

    case EUtilityLightsColorCycleType.TwoColorsCycle:

      let event: ref<TwoColorsCycleEffectEvent> = new TwoColorsCycleEffectEvent();
      event.identifier = this.m_activeEffectIdentifier;
      event.step = 0;
      vehicle.QueueEvent(event);
      break;

    case EUtilityLightsColorCycleType.Rainbow:
    
      let event: ref<RainbowEffectEvent> = new RainbowEffectEvent();
      event.identifier = this.m_activeEffectIdentifier;
      event.colorIndex = 0;
      vehicle.QueueEvent(event);
      break;

  }
}

@addMethod(VehicleComponent)
public func ApplyHeadlightsSettingsChange() -> Void {
  this.m_headlightsTimerIdentifier += 1;

  if this.m_modSettings.headlightsSynchronizedWithTimeEnabled {
    let event: ref<GameTimeElapsedEvent> = new GameTimeElapsedEvent();
    event.identifier = this.m_headlightsTimerIdentifier;

    // Call the event synchronously for the first time
    this.OnGameTimeElapsedEvent(event);
    
    this.UpdateHeadlightsWithTimeSync();
  }
  
  this.ApplyHeadlightsModeWithShutOff();
  this.ApplyUtilityLightsWithShutOff();
}

@addMethod(VehicleComponent)
public func OnModSettingsChange() -> Void {
  // LogChannel(n"DEBUG", s"OnModSettingsChange");
  
  this.ApplyUtilityLightsSettingsChange();
  this.ApplyHeadlightsSettingsChange();
}

@wrapMethod(VehicleComponent)
protected cb func OnMountingEvent(evt: ref<MountingEvent>) -> Bool {
  wrappedMethod(evt);

  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gameInstance: GameInstance = vehicle.GetGame();
  let mountChild: ref<GameObject> = GameInstance.FindEntityByID(gameInstance, evt.request.lowLevelMountingInfo.childId) as GameObject;

  if mountChild.IsPlayer() {
    this.TogglePlayerMounted(true);
    
    // Only the first time V enters into this vehicle in any seat
    if !this.m_vehicleUsedByV {
      // LogChannel(n"DEBUG", s"m_vehicleUsedByV -> true");

      this.m_modSettings = ModSettings_EVS.Get(vehicle.GetGame());

      let occupiedSeatSlots: Int32 = 0;
      let reservedSeatSlots: Int32 = 0;
      VehicleComponent.GetSeatsStatus(gameInstance, vehicle, this.m_totalSeatSlots, occupiedSeatSlots, reservedSeatSlots);
      
      VehicleComponent.GetVehicleDataPackage(gameInstance, vehicle, this.m_vehicleDataPackage);

      this.m_hasWindows = this.m_vehicleDataPackage.WindowsRollDown();

      if Equals(this.m_vehicleDataPackage.DriverCombat().Type(), gamedataDriverCombatType.Doors) {
        this.m_isDriverCombatType_Doors = true;
      }

      VehicleComponent.GetVehicleRecord(vehicle, this.m_vehicleRecord);

      if Equals(this.m_vehicleRecord.Affiliation().Type(), gamedataAffiliation.NCPD) {
        this.m_isPoliceVehicle = true;
      }
      
      this.m_vehicleModel = s"\(this.m_vehicleRecord.Manufacturer().EnumName()) \(this.m_vehicleRecord.Model().EnumName())";
      // LogChannel(n"DEBUG", s"Model -> \(this.m_vehicleModel)");

      /////////////////////////////
      // Adapt vehicles
      //
      if VehicleData.Get(gameInstance).incorrectDoorNumber_VehicleMap.KeyExist(this.m_vehicleModel) {
        this.m_totalSeatSlots = Cast<Int32>(VehicleData.Get(gameInstance).incorrectDoorNumber_VehicleMap.Get(this.m_vehicleModel));
      }

      if VehicleData.Get(gameInstance).incorrectHasWindow_VehicleMap.KeyExist(this.m_vehicleModel) {
        this.m_hasWindows = Cast<Int32>(VehicleData.Get(gameInstance).incorrectHasWindow_VehicleMap.Get(this.m_vehicleModel)) == 1;
      }

      if VehicleData.Get(gameInstance).hasIncompatibleSlidingDoorsWindow_VehicleMap.KeyExist(this.m_vehicleModel) {
        this.m_hasIncompatibleSlidingDoorsWindow = true;
      }

      if VehicleData.Get(gameInstance).isSlidingDoors_VehicleMap.KeyExist(this.m_vehicleModel) {
        this.m_isSlidingDoors = true;
      }

      if VehicleData.Get(gameInstance).crystalDomeMeshTiming_VehicleMap.KeyExist(TDBID.ToNumber(TDBID.Create(this.m_vehicleModel))) {
        this.m_crystalDomeMeshTimings = VehicleData.Get(gameInstance).crystalDomeMeshTiming_VehicleMap.Get(TDBID.ToNumber(TDBID.Create(this.m_vehicleModel))) as FloatArrayWrapper;
      }
      /////////////////////////////

      this.m_vehicleUsedByV = true;
    }
  }

  if mountChild.IsPlayer() && vehicle.IsPlayerDriver() {
    // LogChannel(n"DEBUG", s"player is driver -> true");

    if !this.m_vehicleDrivenByV {
      // LogChannel(n"DEBUG", s"m_vehicleDrivenByV -> true");

      this.m_currentHeadlightsState = IntEnum<vehicleELightMode>(EnumInt(this.m_modSettings.defaultHeadlightsMode));

      switch this.m_modSettings.defaultUtilityLightsMode {
        case EUtilityLightsMode.MotorcyclesActive:
          if vehicle == (vehicle as BikeObject) {
            this.m_auxiliaryState = true;
            // LogChannel(n"DEBUG", s"Set utility lights -> \(this.m_auxiliaryState)");
          }
          break;
          
        case EUtilityLightsMode.AllVehiclesActive:
          if this.m_useAuxiliary {
            this.m_auxiliaryState = true;
            // LogChannel(n"DEBUG", s"Set utility lights -> \(this.m_auxiliaryState)");
          }
          break;
      }

      
      // Apply modifications on first mount
      ModSettings.RegisterListenerToModifications(this);
      this.OnModSettingsChange();

      this.m_vehicleDrivenByV = true;
    }

    // In case V gets in a vehicle that is not parked: summoning a vehicle, carjacking
    if vehicle.IsVehicleTurnedOn() {
      this.TogglePowerState(true);
    }
  }
}

@wrapMethod(VehicleComponent)
protected cb func OnVehicleStartedMountingEvent(evt: ref<VehicleStartedMountingEvent>) -> Bool {
  wrappedMethod(evt);

  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gameInstance: GameInstance = vehicle.GetGame();
  let playerPuppet: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject() as PlayerPuppet;

  if VehicleComponent.IsMountedToProvidedVehicle(gameInstance, playerPuppet.GetEntityID(), vehicle) {
    if !evt.isMounting && vehicle.IsPlayerDriver() {
      this.TogglePlayerMounted(false);
    
      this.m_playerIsDismounting = true;
      
      // Prevents the vehicle from shutting down because of the game
      this.Ensure_VehicleState(vehicleEState.Default);

      switch this.m_modSettings.exitBehavior {
        case EExitBehavior.PowerOff:
          this.TogglePowerState(false);
          vehicle.TurnEngineOn(false);
          // LogChannel(n"DEBUG", s"Turn engine -> false");
          break;

        case EExitBehavior.StopEngine:
          vehicle.TurnEngineOn(false);
          // LogChannel(n"DEBUG", s"Turn engine -> false");
          break;

        case EExitBehavior.KeepCurrentState:
          // Do nothing
          break;

        default:
          // Do nothing
          break;
      }

      // Restore external mesh for crystal dome vehicles
      this.OnExit_CrystalDomeMesh();
    }
    else if evt.character.IsPlayer() { // Started mounting
            
      // Apply external mesh for crystal dome vehicles
      if this.GetPS().GetCrystalDomeState() {
        if Equals(evt.slotID, n"seat_front_right") {
          this.m_playerIsMountedFromPassengerSeat = true;
          this.OnPassengerEnter_CrystalDomeMesh();
        }
        else if Equals(evt.slotID, n"seat_front_left") && !this.m_playerIsMountedFromPassengerSeat {
          this.OnEnter_CrystalDomeMesh();
        }
      }
    }
  }
}

@replaceMethod(VehicleComponent)
protected cb func OnUnmountingEvent(evt: ref<UnmountingEvent>) -> Bool {

  // Get siren state
  let sirenState: Bool = this.GetPS().GetSirenState();

  let activePassengers: Int32;
  let gameInstance: GameInstance = this.GetVehicle().GetGame();
  let mountChild: ref<GameObject> = GameInstance.FindEntityByID(gameInstance, evt.request.lowLevelMountingInfo.childId) as GameObject;
  let mountChildIsPrevention: Bool = IsDefined(mountChild) && mountChild.IsPrevention();
  VehicleComponent.SetAnimsetOverrideForPassenger(mountChild, evt.request.lowLevelMountingInfo.parentId, evt.request.lowLevelMountingInfo.slotId.id, 0.00);

  // // // // // // //
  // When any of V or a police driver (not passenger) NPC get out of the car
  if this.m_isPoliceVehicle && IsDefined(mountChild) && VehicleComponent.IsDriverSlot(evt.request.lowLevelMountingInfo.slotId.id) {
    
    // Always turn the siren OFF
    this.GetVehicle().ToggleSiren(false);
    this.GetPS().SetSirenSoundsState(false);

    // If the siren state is activated, keep the lights ON
    if sirenState {
      this.GetVehicleController().ToggleLights(true, vehicleELightType.Utility);
      this.GetPS().SetSirenLightsState(true);
      // LogChannel(n"DEBUG", s"Set police lights -> true");

      // For some reason, when a police driver NPC get out of the car with the roof lights ON, the side banner lights may stay blue instead of going red
      // Fix this by forcing to red when roof lights are ON
      if IsDefined(mountChild) && !mountChild.IsPlayer() {
        this.StartEffectEvent(this.GetVehicle(), n"police_sign_combat", true);

        // Police NPCs in chase always drive with lights ON + siren ON so this is state 2
        // Update the siren state accordingly
        this.m_threeStatesSiren = 2;
      }
    }
  }

  if IsDefined(mountChild) && mountChild.IsPlayer() {
    PreventionSystem.SetPlayerMounted(gameInstance, false);
    PlayerPuppet.ReevaluateAllBreathingEffects(mountChild as PlayerPuppet);
    this.ToggleScanningComponent(true);
    if this.GetVehicle().ShouldRegisterToHUD() {
      this.RegisterToHUDManager(true);
    };
    this.UnregisterInputListener();
    FastTravelSystem.RemoveFastTravelLock(n"InVehicle", gameInstance);
    this.m_mounted = false;
    this.UnregisterListeners();
    //this.ToggleSiren(false, false);
    if this.m_broadcasting {
      this.DrivingStimuli(false);
    };
    if Equals(evt.request.lowLevelMountingInfo.slotId.id, n"seat_front_left") {
      PreventionSystemHackerLoop.UpdatePlayerVehicle(gameInstance, null);

      if !this.m_vehicleDrivenByV || this.IsPanzer() {
        this.ToggleCrystalDome(false, true);
      }
            
      this.SetSteeringLimitAnimFeature(0);
      this.m_ignoreAutoDoorClose = false;
    };
    this.DoPanzerCleanup();
    this.m_mountedPlayer = null;
    this.CleanUpRace();
    GameInstance.GetStatPoolsSystem(this.GetVehicle().GetGame()).RequestSettingStatPoolValueCustomLimit(Cast<StatsObjectID>(this.GetVehicle().GetEntityID()), gamedataStatPoolType.Health, 0.00, this.GetVehicle());
    GameInstance.GetAudioSystem(this.GetVehicle().GetGame()).RemoveTriggerEffect(n"te_vehicle_car_disabled");
  };
  if IsDefined(mountChild) {
    if mountChildIsPrevention {
      GameInstance.GetPreventionSpawnSystem(gameInstance).UnregisterEntityDeathCallback(this, "OnPreventionPassengerDeath", mountChild.GetEntityID());
      if mountChild.IsActive() {
        this.m_preventionPassengers = Max(0, this.m_preventionPassengers - 1);
      };
      this.GetVehicle().GetPreventionSystem().UpdateVehiclePassengerCount(this.GetVehicle().GetEntityID(), this.m_preventionPassengers);
      if this.m_preventionPassengers == 0 {
        this.DestroyMappin();
      };
    };
    if VehicleComponent.GetNumberOfActivePassengers(mountChild.GetGame(), this.GetVehicle().GetEntityID(), activePassengers) {
      if activePassengers <= 0 {
        this.DisableTargetingComponents();
      };
    };
  };
  this.GetPS().ToggleReserveSeatDuringUnmounting(false, evt.request.lowLevelMountingInfo.slotId.id);
  this.ManageAdditionalAnimFeatures(mountChild, false);



  if IsDefined(mountChild) && mountChild.IsPlayer()
  && Equals(evt.request.lowLevelMountingInfo.slotId, VehicleComponent.GetDriverSlotID()) {
      // LogChannel(n"DEBUG", s"OnUnmountingEvent -> Player has dismounted from driver seat");

      // Restore headlights
      this.ApplyHeadlightsModeWithShutOff();
      
      // Restore utility lights
      this.ApplyUtilityLightsWithShutOff();
      
      // Restore interior lights
      this.EnsureIsActive_InteriorLights();
  }
}

@wrapMethod(VehicleComponent)
protected cb func OnVehicleFinishedMountingEvent(evt: ref<VehicleFinishedMountingEvent>) -> Bool {
  wrappedMethod(evt);

  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let playerPuppet: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(vehicle.GetGame()).GetLocalPlayerMainGameObject() as PlayerPuppet;

  if vehicle.IsPlayerDriver() {
    if evt.isMounting {

      if playerPuppet.IsInCombat() && this.m_modSettings.autoStartEngineDuringCombat {
        this.TogglePowerState(true);
        vehicle.TurnEngineOn(true);
        // LogChannel(n"DEBUG", s"Turn engine -> true");
      }
      
      switch this.m_modSettings.enterBehavior {
        case EEnterBehavior.StartEngine:
          this.TogglePowerState(true);
          vehicle.TurnEngineOn(true);
          // LogChannel(n"DEBUG", s"Turn engine -> true");
          break;

        case EEnterBehavior.PowerOn:
          this.TogglePowerState(true);
          break;

        case EEnterBehavior.KeepCurrentState:
          // Do nothing
          break;

        default:
          // Do nothing
          break;
      }
      
      // If the power state is off, activate the headlights shutoff
      if this.m_powerState {
        this.ToggleHeadlightsShutoff(false);
      }
      else {
        this.ToggleHeadlightsShutoff(true);
      }
      
      this.ApplyHeadlightsModeWithShutOff();
      this.ApplyUtilityLightsWithShutOff();
    }
  }
  else if this.m_vehicleDrivenByV && evt.character.IsPlayer() { // Unmounted player

    // LogChannel(n"DEBUG", s"OnVehicleFinishedMountingEvent Exit");
    this.RecallVehicleDoorsState();

    this.m_playerIsDismounting = false;

    // If the crystal dome is ON, then start a looping event to restore the crystal dome state when the player will get close again to the vehicle
    if this.GetPS().GetCrystalDomeState() {
      let event: ref<PlayerIsAwayFromVehicleEvent> = new PlayerIsAwayFromVehicleEvent();
      vehicle.QueueEvent(event);
    }
  }

  // Get siren state
  let sirenState: Bool = this.GetPS().GetSirenState();

  // When any of V or police officer NPCs get in the car and the siren state is ON
  if evt.isMounting && sirenState && this.m_threeStatesSiren == 2 {

    // Then turn the siren back ON
    this.GetVehicle().ToggleSiren(true);
    this.GetPS().SetSirenSoundsState(true);
  }
}

@addMethod(VehicleComponent)
protected final func AllowCloseDoorsWithSpeed(speed: Float) -> Bool {
  let absSpeed: Float = speed;

  if absSpeed < 0.00 {
    absSpeed = AbsF(absSpeed);
  }
  
  // Update vehicle momentum type
  if AbsF(absSpeed - this.m_lastSpeed) > 0.01 {
    // In case the current speed and the last speed are too close together, then consider that the vehicle momentum type is stable
    if absSpeed > this.m_lastSpeed {
      this.m_vehicleMomentumType = EMomentumType.Accelerate;
    }
    else if absSpeed < this.m_lastSpeed {
      this.m_vehicleMomentumType = EMomentumType.Decelerate;
    }
  }
  else {
    this.m_vehicleMomentumType = EMomentumType.Stable;
  }
  
  this.m_lastSpeed = absSpeed;

  // Concerning "OnStartMoving" mode
  // Check "SpeedToClose() + 1.00" so we give a speed window for the game to close doors
  // Only close the doors if the vehicle is accelerating (from parking to driving)
  // Otherwise when the vehicle would decelerate and park then the doors would close too (from driving to parking)
  if absSpeed < this.m_vehicleDataPackage.SpeedToClose() + 1.00
  && Equals(this.m_vehicleMomentumType, EMomentumType.Accelerate) {
    this.m_AutoCloseDoors_OnStartMoving_State = true;
  }
  else {
    this.m_AutoCloseDoors_OnStartMoving_State = false;
  }
  
  // Close doors when moving if necessary
  if Equals(this.m_modSettings.doorsDriveClosing, EDoorsDriveClosing.CustomSpeed)
  || (Equals(this.m_modSettings.doorsDriveClosing, EDoorsDriveClosing.OnStartMoving)&& this.m_AutoCloseDoors_OnStartMoving_State) {
    return true;
  }

  return false;
}

@addMethod(VehicleComponent)
protected final func IsPanzer() -> Bool {
  return this.GetVehicle() == (this.GetVehicle() as TankObject);
}

@replaceMethod(VehicleComponent)
protected final func OnVehicleCameraChange(state: Bool) -> Void {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gameInstance: GameInstance = vehicle.GetGame();
  let playerPuppet: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject() as PlayerPuppet;

  let animFeature: ref<AnimFeature_VehicleState>;
  if this.GetPS().GetCrystalDomeState() && (!this.m_playerIsDismounting || !playerPuppet.IsInCombat()) {
    animFeature = new AnimFeature_VehicleState();
    animFeature.tppEnabled = !state;
    AnimationControllerComponent.ApplyFeatureToReplicate(this.GetVehicle(), n"VehicleState", animFeature);
    this.TogglePanzerShadowMeshes(state);
  };
}

@wrapMethod(VehicleComponent)
protected final func OnVehicleSpeedChange(speed: Float) -> Void {
  let animFeature: ref<AnimFeature_PartData>;
  let doors: array<CName>;
  let vehDataPackage: wref<VehicleDataPackage_Record>;
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gameInstance: GameInstance = vehicle.GetGame();
  let playerPuppet: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject() as PlayerPuppet;

  // Keep default behavior for NPCs
  if !VehicleComponent.IsMountedToProvidedVehicle(gameInstance, playerPuppet.GetEntityID(), vehicle) {
    wrappedMethod(speed);
    return;
  }

  // If the vehicle is moving during a scripted animation scene then ensure the dashboard is enabled. In the story quest "The Heist",
  // when V and Jackie get into the Delamain to get out of the building, there is no driver,
  // only passengers and the car does not seem to power on normally (scripted behavior). The dashboard is not even turned on. This fixes this issue.
  // vehicle.IsPerformingSceneAnimation()
  if IsDefined(vehicle.m_vehicleUIGameController) && AbsF(speed) > 0.01 && !vehicle.IsPlayerDriver() && vehicle.IsPerformingSceneAnimation() && !vehicle.m_vehicleUIGameController.m_UIEnabled {
    vehicle.m_vehicleUIGameController.ActivateUI();
    vehicle.m_vehicleUIGameController.TurnOn();
    vehicle.SetInteriorUIEnabled(true);
  }

  // Useful variables
  let multiplier: Float = GameInstance.GetStatsDataSystem(gameInstance).GetValueFromCurve(n"vehicle_ui", speed, n"speed_to_multiplier");
  let kmh_multiplier: Float = this.m_isKmH ? 1.61 : 1.00;

  //////////////////
  // Do not check door speed closing for motorbikes
  let allowDriveClosingDoors: Bool = false;
  
  if vehicle != (vehicle as BikeObject) {
    allowDriveClosingDoors = this.AllowCloseDoorsWithSpeed(speed);
  }
  //////////////////

  if this.m_hasSpoiler {
    // Only deploy spoiler with speed if user settings allow it
    if !this.m_spoilerDeployed && this.m_modSettings.spoilerDeploySpeedEnabled {
      // Define spoiler speeds
      this.m_spoilerUp = this.m_modSettings.spoilerDeploySpeed / kmh_multiplier / multiplier;

      if speed >= this.m_spoilerUp {
        animFeature = new AnimFeature_PartData();
        animFeature.state = 1;
        animFeature.duration = 0.75;
        AnimationControllerComponent.ApplyFeatureToReplicate(this.GetVehicle(), n"spoiler", animFeature);
        this.m_spoilerDeployed = true;
      };
    }
    // Only retract spoiler with speed if user settings allow it
    else if this.m_modSettings.spoilerRetractSpeedEnabled {
      // Define spoiler speeds
      this.m_spoilerDown = this.m_modSettings.spoilerRetractSpeed / kmh_multiplier / multiplier;

      if speed <= this.m_spoilerDown {
        animFeature = new AnimFeature_PartData();
        animFeature.state = 3;
        animFeature.duration = 0.75;
        AnimationControllerComponent.ApplyFeatureToReplicate(this.GetVehicle(), n"spoiler", animFeature);
        this.m_spoilerDeployed = false;
      };
    };
  };
  if this.GetPS().GetHasAnyDoorOpen() {
    if this.m_ignoreAutoDoorClose {
      return;
    };
    VehicleComponent.GetVehicleDataPackage(this.GetVehicle().GetGame(), this.GetVehicle(), vehDataPackage);

    ////////////////////
    // Get default closing speed for this vehicle, and if necessary use the user settings
    let doorsDriveClosingSpeed: Float = vehDataPackage.SpeedToClose();

    if Equals(this.m_modSettings.doorsDriveClosing, EDoorsDriveClosing.CustomSpeed) {
      doorsDriveClosingSpeed = this.m_modSettings.doorsDriveClosingSpeed / kmh_multiplier / multiplier;
    }
    ////////////////////

    if speed < 0.00 {
      speed = AbsF(speed);
    };
    if speed < 0.50 {
      return;
    };
    // Only close doors with speed if user settings allow it
    if speed >= doorsDriveClosingSpeed && allowDriveClosingDoors {
      ArrayPush(doors, n"seat_front_left");
      ArrayPush(doors, n"seat_front_right");
      ArrayPush(doors, n"hood");
      if !vehDataPackage.SlidingRearDoors() {
        ArrayPush(doors, n"seat_back_left");
        ArrayPush(doors, n"seat_back_right");
      };
      if !vehDataPackage.BarnDoorsTailgate() {
        ArrayPush(doors, n"trunk");
      };
      this.CloseSelectedDoors(doors);
      ArrayClear(doors);
    };
  };
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
  if !vehicleObj.IsPlayerDriver() || this.IsPanzer() {
    if vehicle {
      vehicleObj.TurnVehicleOn(toggle);
      vehicleObj.SetInteriorUIEnabled(toggle); // Allows mission vehicles to have dashboards enabled properly
    };
    if engine {
      vehicleObj.TurnEngineOn(toggle);
      vehicleObj.SetInteriorUIEnabled(toggle); // Allows mission vehicles to have dashboards enabled properly
    };
  }
  if Equals(lockState, VehicleQuestEngineLockState.Lock) {
    vehicleObj.LockVehicleOnState(true);
  };
}

@replaceMethod(VehicleComponent)
protected cb func OnVehicleDoorOpen(evt: ref<VehicleDoorOpen>) -> Bool {
  let PSVehicleDoorCloseRequest: ref<VehicleDoorClose>;
  let autoCloseDelay: Float;
  this.EvaluateDoorReaction(evt.slotID, evt.forceScene, VehicleDoorState.Open);

  if evt.shouldAutoClose {
    PSVehicleDoorCloseRequest = new VehicleDoorClose();
    PSVehicleDoorCloseRequest.slotID = evt.slotID;
    autoCloseDelay = evt.autoCloseTime;
    if autoCloseDelay == 0.00 {
      autoCloseDelay = 1.50;
    };

    let vehicle: ref<VehicleObject> = this.GetVehicle();
    let gameInstance: GameInstance = vehicle.GetGame();
    let playerPuppet: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject() as PlayerPuppet;

    // Define doors state when V gets in
    if VehicleComponent.IsMountedToProvidedVehicle(gameInstance, playerPuppet.GetEntityID(), vehicle) {
      if this.m_playerIsMounted {
        // LogChannel(n"DEBUG", s"OnVehicleDoorOpen Enter-> KeepCurrentState");
        this.RecallVehicleDoorsState(autoCloseDelay);
      }
    }
    else { // NPCs behavior
      GameInstance.GetDelaySystem(this.GetVehicle().GetGame()).DelayPSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), PSVehicleDoorCloseRequest, autoCloseDelay, true);
    }
  };
  this.GetPS().SetHasAnyDoorOpen(true);
}

@replaceMethod(VehicleComponent)
protected cb func OnCurrentWantedLevelChanged(value: Int32) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  // // // // // // //
  // When the wanted level gets down to zero, the game turns all the police cars to siren state OFF
  // This code prevents V driving a police car to be affected by this behavior
  if value == 0 && !vehicle.IsPlayerDriver() {
    this.ToggleSiren(false, false);

    // Update the siren state accordingly
    this.m_threeStatesSiren = 0;
  }
  // // // // // // //
}

@replaceMethod(VehicleComponent)
protected cb func OnVehicleChaseTargetEvent(evt: ref<VehicleChaseTargetEvent>) -> Bool {
  if evt.inProgress {
    this.ToggleSiren(true, true);
    this.StartEffectEvent(this.GetVehicle(), n"police_sign_combat", true);

    // // // // // // //
    // Police NPCs in chase always drive with lights ON + siren ON so this is state 2
    // Update the siren state accordingly
    this.m_threeStatesSiren = 2;
    // // // // // // //
  };
}

// Only to disable some base game behavior. Do not add anything else in the method
@replaceMethod(VehicleComponent)
protected cb func OnChangeState(evt: ref<vehicleChangeStateEvent>) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  let defaultState: ref<VehicleDefaultState_Record>;
  let evnt: ref<VehicleLightQuestToggleEvent>;
  let i: Int32;
  let record: ref<Vehicle_Record>;
  let recordID: TweakDBID;
  let size: Int32;
  let crystalDomeQuestModified: Bool = this.GetPS().GetIsCrystalDomeQuestModified();
  if Equals(evt.newState, vehicleEState.On) {
    if !crystalDomeQuestModified {
      if this.GetVehicle() != (this.GetVehicle() as AVObject) {

        // Keep the default behavior for NPCs
        if !this.m_vehicleDrivenByV || this.IsPanzer() {
          this.ToggleCrystalDome(true);
        }

      };
    };
    if this.m_mounted {
      this.DrivingStimuli(true);
    };
  };
  if NotEquals(evt.newState, vehicleEState.On) {
    if !crystalDomeQuestModified {
      if this.GetVehicle() != (this.GetVehicle() as AVObject) {

        // Keep the default behavior for NPCs
        if !this.m_vehicleDrivenByV || this.IsPanzer() {
          this.ToggleCrystalDome(false);
        }

      };
    };
    this.DrivingStimuli(false);
  };
  if !this.GetPS().GetIsDefaultLightToggleSet() {
    recordID = this.GetVehicle().GetRecordID();
    record = TweakDBInterface.GetVehicleRecord(recordID);
    defaultState = record.VehDefaultState();
    size = defaultState.GetLightToggleComponentsCount();
    i = 0;
    while i < size {
      evnt = new VehicleLightQuestToggleEvent();
      evnt.lightType = IntEnum<vehicleELightType>(defaultState.GetLightToggleComponentsItem(i));
      evnt.toggle = defaultState.DefaultLightToggle();
      this.GetVehicle().QueueEvent(evnt);
      i += 1;
    };
    this.GetPS().SetIsDefaultLightToggleSet(true);
  };

  if vehicle.IsPlayerDriver() {
    // Update headlights here so it will minimize the auto-HighBeam state
    this.ApplyHeadlightsModeWithShutOff();
  }
}

@replaceMethod(VehicleObject)
protected cb func OnMountingEvent(evt: ref<MountingEvent>) -> Bool {
  let mountChild: ref<GameObject> = GameInstance.FindEntityByID(this.GetGame(), evt.request.lowLevelMountingInfo.childId) as GameObject;
  if mountChild == null {
    return false;
  };
  if mountChild.IsPlayer() {

    if this.ReevaluateStealing(mountChild, evt.request.lowLevelMountingInfo.slotId.id, evt.request.mountData.mountEventOptions.occupiedByNonFriendly) {
      this.StealVehicle(mountChild);
    };
  }
  else if VehicleComponent.IsDriver(this.GetGame(), mountChild) {
    // If a NPC is mounting as the driver, then enable UI
    // This behavior is useful when V enters in a story driven car as a passenger
    // It also allows for all vehicle NPCs to have dashboard enabled by default
    this.SetInteriorUIEnabled(true);
  }
}

@replaceMethod(VehicleObject)
protected cb func OnUnmountingEvent(evt: ref<UnmountingEvent>) -> Bool {
  let mountChild: ref<GameObject> = GameInstance.FindEntityByID(this.GetGame(), evt.request.lowLevelMountingInfo.childId) as GameObject;
  let isSilentUnmount: Bool = IsDefined(evt.request.mountData) && evt.request.mountData.mountEventOptions.silentUnmount;
  let vehicleComp: ref<VehicleComponent> = this.GetVehicleComponent();

  if IsDefined(mountChild) {

    if mountChild.IsPlayer() && !vehicleComp.m_vehicleDrivenByV {
      if !isSilentUnmount {
        //this.SetInteriorUIEnabled(false);
      }

      // If the player gets out and has not driven the vehicle, then he is the passenger of a story vehicle. Is this case, close his window
      // Because the player may have open its own window
      vehicleComp.CloseWindow(evt.request.lowLevelMountingInfo.slotId);
    }

    // Only disable UI if the driver NPC gets out
    if !mountChild.IsPlayer() && Equals(evt.request.lowLevelMountingInfo.slotId, VehicleComponent.GetDriverSlotID()) {
      this.SetInteriorUIEnabled(false);
    }
  }
}

@wrapMethod(vehicleUIGameController)
protected cb func OnInitialize() -> Bool {
  // LogChannel(n"DEBUG", s"OnInitialize -> \(this.m_vehicle.GetEntityID())");

  wrappedMethod();

  if !IsDefined(this.m_vehicle.m_vehicleUIGameController) {
    this.m_vehicle.m_vehicleUIGameController = this;
  }

  // Enable dashboard root widget but turn UI off
  if this.m_vehicle.IsPlayerDriver() {
    // LogChannel(n"DEBUG", s"OnInitialize -> player driver");
    this.ActivateUI();
    this.TurnOn();
  }
}

@wrapMethod(vehicleUIGameController)
private final func DeactivateUI() -> Void {
  let vehicleComp: ref<VehicleComponent> = this.m_vehicle.GetVehicleComponent();

  if vehicleComp.m_vehicleDrivenByV && vehicleComp.m_powerState {
    // LogChannel(n"DEBUG", s"vehicleUIGameController.DeactivateUI -> PREVENT");
    return;
  }

  // LogChannel(n"DEBUG", s"vehicleUIGameController.DeactivateUI");
  // Keep default behavior for NPCs
  wrappedMethod();
}

// Removing this method's code prevents dashboard screens from changing state
@wrapMethod(vehicleUIGameController)
private final func TurnOff() -> Void {
  let vehicleComp: ref<VehicleComponent> = this.m_vehicle.GetVehicleComponent();

  if vehicleComp.m_vehicleDrivenByV && vehicleComp.m_powerState {
    // LogChannel(n"DEBUG", s"vehicleUIGameController.TurnOff -> PREVENT");
    return;
  }

  // LogChannel(n"DEBUG", s"vehicleUIGameController.TurnOff");
  // Keep default behavior for NPCs
  wrappedMethod();
}

// Prevents dashboard from disappearing when using multiple vehicles next to each other
@wrapMethod(vehicleUIGameController)
private final func IsUIactive() -> Bool {
  let vehicle: ref<VehicleObject> = this.m_vehicle;
  let vehicleComp: ref<VehicleComponent> = vehicle.GetVehicleComponent();

  if vehicleComp.m_vehicleDrivenByV && vehicleComp.m_powerState && !vehicle.IsPlayerDriver() {
    // LogChannel(n"DEBUG", s"vehicleUIGameController.IsUIactive -> turn on for player");
    this.TurnOn();

    return this.m_vehicle.GetVehicleComponent().m_powerState;
  }

  return wrappedMethod();
}

@replaceMethod(SwitchSeatsDecisions)
public final const func ToDrive(const stateContext: ref<StateContext>, const scriptInterface: ref<StateGameScriptInterface>) -> Bool {
  let mountData: ref<MountEventData>;
  let mountOptions: ref<MountEventOptions>;
  let mountingRequest: ref<MountingRequest>;
  let lowLevelMountingInfo: MountingInfo = scriptInterface.GetMountingFacility().GetMountingInfoSingleWithIds(scriptInterface.executionOwnerEntityID);
  let currentSlot: CName = lowLevelMountingInfo.slotId.id;
  
  let vehicle: ref<VehicleObject> = scriptInterface.owner as VehicleObject;
  let vehicleComp: ref<VehicleComponent> = vehicle.GetVehicleComponent();

  if this.GetInStateTime() >= this.GetVehicleDataPackage(stateContext).SwitchSeats() {
    mountingRequest = new MountingRequest();
    mountData = new MountEventData();
    mountOptions = new MountEventOptions();
    lowLevelMountingInfo.parentId = scriptInterface.ownerEntityID;
    lowLevelMountingInfo.childId = scriptInterface.executionOwnerEntityID;
    mountData.isInstant = true;
    mountOptions.silentUnmount = true;

    if Equals(currentSlot, n"seat_front_right") {
      lowLevelMountingInfo.slotId.id = n"seat_front_left";
      mountingRequest.lowLevelMountingInfo = lowLevelMountingInfo;
      mountingRequest.mountData = mountData;
      mountingRequest.mountData.mountEventOptions = mountOptions;
      scriptInterface.GetMountingFacility().Mount(mountingRequest);

      // Only close the door while changing seat if the player is out
      if !vehicleComp.m_playerIsMounted {
        VehicleComponent.CloseDoor(vehicle, lowLevelMountingInfo.slotId);
      }
      return true;
    };
  };
  return false;
}

@replaceMethod(DriverCombatFirearmsEvents)
protected func OnEnter(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) -> Void {
  let attachmentSlotCallback: ref<DefaultTransitionAttachmentSlotsCallback>;
  let drawItemRequest: ref<DrawItemRequest>;
  super.OnEnter(stateContext, scriptInterface);
  this.m_prevSpeed = (this.m_owner as VehicleObject).GetCurrentSpeed();
  this.m_posAnimFeature = new AnimFeature_ProceduralDriverCombatData();
  attachmentSlotCallback = new DefaultTransitionAttachmentSlotsCallback();
  attachmentSlotCallback.m_transitionOwner = this;
  attachmentSlotCallback.slotID = t"AttachmentSlots.WeaponRight";
  this.m_attachmentSlotListener = scriptInterface.GetTransactionSystem().RegisterAttachmentSlotListener(scriptInterface.executionOwner, attachmentSlotCallback);

  /////////////////////
  // Bug fix: when entering driver combat the window rolldown sound effect shall not play if the vehicle does not have windows
  // +
  // New feature: Also don't open front windows if the vehicle has windowed sliding doors open like the Quadra V-Tech
  let playerPuppet: ref<PlayerPuppet> = scriptInterface.executionOwner as PlayerPuppet;
  let vehicle: ref<VehicleObject> = playerPuppet.m_mountedVehicle;
  let gameInstance: GameInstance = vehicle.GetGame();
  let vehicleComp: ref<VehicleComponent> = playerPuppet.m_mountedVehicle.GetVehicleComponent();
  
  if VehicleComponent.IsMountedToProvidedVehicle(gameInstance, playerPuppet.GetEntityID(), vehicle) && vehicleComp.m_playerIsMounted {
    let FL_doorState: VehicleDoorState = vehicleComp.GetPS().GetDoorState(EVehicleDoor.seat_front_left);
    let FR_doorState: VehicleDoorState = vehicleComp.GetPS().GetDoorState(EVehicleDoor.seat_front_right);

    vehicleComp.ForceFrontWindowsDuringCombat(FL_doorState, FR_doorState);
  }
  else {
    this.RollDownWindowsForCombat(scriptInterface, true);
  }
  /////////////////////

  this.m_vehicleRecord = TweakDBInterface.GetVehicleRecord((scriptInterface.owner as VehicleObject).GetRecordID());
  if !UpperBodyTransition.HasAnyWeaponEquipped(scriptInterface) {
    drawItemRequest = new DrawItemRequest();
    drawItemRequest.owner = scriptInterface.executionOwner;
    drawItemRequest.itemID = ItemID.CreateQuery(t"Items.Preset_V_Unity_Cutscene");
    (scriptInterface.GetScriptableSystem(n"EquipmentSystem") as EquipmentSystem).QueueRequest(drawItemRequest);
  } else {
    this.OnItemEquipped(t"AttachmentSlots.WeaponRight", scriptInterface.GetTransactionSystem().GetItemInSlot(scriptInterface.executionOwner, t"AttachmentSlots.WeaponRight").GetItemID());
  };
  SetFactValue(scriptInterface.executionOwner.GetGame(), n"player_tried_veh_combat_firearms", 1);
  if !this.m_vehicleInTPP {
    StatusEffectHelper.ApplyStatusEffect(scriptInterface.executionOwner, t"BaseStatusEffect.PhotoModeForceFPPCamera");
  };
}

@replaceMethod(DriverCombatFirearmsEvents)
protected func OnExit(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) -> Void {
  super.OnExit(stateContext, scriptInterface);
  scriptInterface.GetTransactionSystem().UnregisterAttachmentSlotListener(scriptInterface.executionOwner, this.m_attachmentSlotListener);
  this.UpdateWeaponSwayRemoval(false);
  this.UpdateWeaponSwayPause(false);
  this.UpdatePistolADSSpread(false);
  this.m_posAnimFeature.yaw = 0.00;
  this.m_posAnimFeature.pitch = 0.00;
  this.m_posAnimFeature.roll = 0.00;
  scriptInterface.SetAnimationParameterFeature(n"ProceduralDriverCombatData", this.m_posAnimFeature, scriptInterface.executionOwner);
  stateContext.SetTemporaryBoolParameter(n"ForceWeaponSafeState", false);

  let playerPuppet: ref<PlayerPuppet> = scriptInterface.executionOwner as PlayerPuppet;
  let vehicle: ref<VehicleObject> = playerPuppet.m_mountedVehicle;
  let gameInstance: GameInstance = vehicle.GetGame();
  let vehicleComp: ref<VehicleComponent> = playerPuppet.m_mountedVehicle.GetVehicleComponent();

  // Close front windows only if their previous state was closed
  if VehicleComponent.IsMountedToProvidedVehicle(gameInstance, playerPuppet.GetEntityID(), vehicle) && vehicleComp.m_playerIsMounted {
    if vehicleComp.m_hasWindows {
      vehicleComp.Recall_FL_WindowsState();
      vehicleComp.Recall_FR_WindowsState();
    }
  }
  else {
    this.RollDownWindowsForCombat(scriptInterface, false);
  }

  this.SendEquipmentSystemWeaponManipulationRequest(scriptInterface, EquipmentManipulationAction.UnequipAll);
  StatusEffectHelper.RemoveStatusEffect(scriptInterface.executionOwner, t"BaseStatusEffect.PhotoModeForceFPPCamera");
}

@replaceMethod(PlayerPuppet)
protected cb func OnVehicleStateChange(newState: Int32) -> Bool {

  let isExitingCombat: Bool = false;
  let vehicleComp: ref<VehicleComponent> = this.m_mountedVehicle.GetVehicleComponent();

  // Player is exiting DriverCombat mode to another mode
  if Equals(this.m_vehicleState, gamePSMVehicle.DriverCombat) {
    isExitingCombat = true;
  }
  
  // Player is entering DriverCombat mode
  if Equals(IntEnum<gamePSMVehicle>(newState), gamePSMVehicle.DriverCombat) {
    vehicleComp.m_isDriverCombat = true;

    // Remember current front doors state so when the player has finished combat we can restore the doors state
    vehicleComp.m_FL_doorState = vehicleComp.GetPS().GetDoorState(EVehicleDoor.seat_front_left);
    vehicleComp.m_FR_doorState = vehicleComp.GetPS().GetDoorState(EVehicleDoor.seat_front_right);

    // Remember current front windows state so when the player has finished combat we can restore the windows state
    if vehicleComp.m_hasWindows {
      vehicleComp.m_FL_windowState = vehicleComp.GetPS().GetWindowState(EVehicleDoor.seat_front_left);
      vehicleComp.m_FR_windowState = vehicleComp.GetPS().GetWindowState(EVehicleDoor.seat_front_right);
    }
  }
  else {    
    vehicleComp.m_isDriverCombat = false;
  }

  let recordID: TweakDBID;
  let vehicle: wref<VehicleObject>;
  let vehicleRecord: ref<Vehicle_Record>;
  this.m_inMountedWeaponVehicle = false;
  if NotEquals(this.m_vehicleState, IntEnum<gamePSMVehicle>(newState)) {
    this.m_vehicleState = IntEnum<gamePSMVehicle>(newState);
    this.UpdateAimAssist();
    if VehicleComponent.GetVehicle(this.GetGame(), this.GetEntityID(), vehicle) {
      recordID = vehicle.GetRecordID();
      vehicleRecord = TweakDBInterface.GetVehicleRecord(recordID);
      if IsDefined(vehicleRecord.VehDataPackage()) {
        if Equals(vehicleRecord.VehDataPackage().DriverCombat().Type(), gamedataDriverCombatType.Doors) {
          
          // If the player is exiting combat, then check previous door state and apply them back
          if isExitingCombat {
            vehicleComp.RecallVehicleDoorsState();
          }
          else { // Otherwise do as usual
            this.HandleDoorsForCombat(vehicle);
          }
        } else {
          if Equals(vehicleRecord.VehDataPackage().DriverCombat().Type(), gamedataDriverCombatType.MountedWeapons) {
            this.m_inMountedWeaponVehicle = true;
          };
        };
      };
    };
  };

  // If the vehicle uses mounted weapons, then do not consider the vehicle as DriverCombat concerning doors and windows handling
  if vehicleComp.m_isDriverCombat && this.m_inMountedWeaponVehicle {
    vehicleComp.m_isDriverCombat = false;
  }
}

@replaceMethod(PlayerPuppet)
private final func HandleDoorsForCombat(vehicle: wref<VehicleObject>) -> Void {
  let ignoreAutoDoorCloseEvt: ref<SetIgnoreAutoDoorCloseEvent> = new SetIgnoreAutoDoorCloseEvent();
  if Equals(this.m_vehicleState, gamePSMVehicle.DriverCombat) {
    ignoreAutoDoorCloseEvt.set = true;
    vehicle.QueueEvent(ignoreAutoDoorCloseEvt);
    VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetDriverSlotID());
    VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetFrontPassengerSlotID());
  } else {
    if NotEquals(this.m_vehicleState, gamePSMVehicle.Transition) && NotEquals(this.m_vehicleState, gamePSMVehicle.Passenger) {
      ignoreAutoDoorCloseEvt.set = false;
      vehicle.QueueEvent(ignoreAutoDoorCloseEvt);

      let gameInstance: GameInstance = vehicle.GetGame();
      let playerPuppet: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject() as PlayerPuppet;
      let vehicleComp: ref<VehicleComponent> = vehicle.GetVehicleComponent();

      // Define doors state when V gets out
      if VehicleComponent.IsMountedToProvidedVehicle(gameInstance, playerPuppet.GetEntityID(), vehicle) {
        if !vehicleComp.m_playerIsMounted {
          // LogChannel(n"DEBUG", s"HandleDoorsForCombat Exit-> KeepCurrentState");
          vehicleComp.RecallVehicleDoorsState();
        }
      }
      else { // Default game behavior for NPCs
        VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetDriverSlotID());
        VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetFrontPassengerSlotID());
      }
    };
  };
}

@wrapMethod(PlayerPuppet)
protected cb func OnCombatStateChanged(newState: Int32) -> Bool {

  let inCombat: Bool = newState == 1;

  if IsDefined(this.m_mountedVehicle) && this.m_mountedVehicle.IsPlayerDriver() {
    let vehicleComp: ref<VehicleComponent> = this.m_mountedVehicle.GetVehicleComponent();

    if inCombat && vehicleComp.m_modSettings.autoStartEngineDuringCombat && !this.m_mountedVehicle.IsEngineTurnedOn() {
      vehicleComp.TogglePowerState(true);
      this.m_mountedVehicle.TurnEngineOn(true);
      // LogChannel(n"DEBUG", s"Turn engine -> true");
    }
  }

  return wrappedMethod(newState);
}

@wrapMethod(hudCarController)
protected func SetMeasurementUnits(value: Int32) -> Void {
  wrappedMethod(value);
  
  // Get the current user setting for KMH or MPH unit
  if IsDefined(this.m_activeVehicle) {
    let gameInstance: GameInstance = this.m_activeVehicle.GetGame();
    let playerPuppet: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gameInstance).GetLocalPlayerMainGameObject() as PlayerPuppet;
    let vehicleComp: ref<VehicleComponent> = this.m_activeVehicle.GetVehicleComponent();

    if VehicleComponent.IsMountedToProvidedVehicle(gameInstance, playerPuppet.GetEntityID(), this.m_activeVehicle) && vehicleComp.m_playerIsMounted {
      vehicleComp.m_isKmH = this.m_kmOn;
    }
  }
}