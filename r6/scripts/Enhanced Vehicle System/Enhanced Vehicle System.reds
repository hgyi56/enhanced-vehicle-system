module Hgyi56.Enhanced_Vehicle_System

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

enum ELightsColorVehicleType {
  Motorcycles = 0,
  AllVehicles = 1
}

enum ELightsColorCycleType {
  Solid = 0,
  Blinker = 1,
  Beacon = 2,
  Pulse = 3,
  TwoColorsCycle = 4,
  Rainbow = 5
}

enum ECrystalCoatColorType {
  Primary = 0,
  Secondary = 1,
  Lights = 2
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

enum ERoofLightOperatingMode {
  Temporary = 0,
  Fixed = 1
}

enum EInteriorLightsToggleOff {
  OnPowerOff = 0,
  OnExit = 1
}

enum EInteriorLightsToggleOn {
  Manual = 0,
  OnEnter = 1,
  OnPowerOn = 2
}

enum ELightAttenuation {
  Linear = 0,
  InverseSquare = 1
}

public class MyModSettings extends ScriptableSystem {

  /////////////////////////
  // POWER STATE
  /////////////////////////

  public func enterBehavior() -> EEnterBehavior {
    return IntEnum<EEnterBehavior>(0);
  }

  public func exitBehavior() -> EExitBehavior {
    return IntEnum<EExitBehavior>(0);
  }

  public func preventPowerOffDuringCombat() -> Bool {
    return false;
  }

  public func autoStartEngineDuringCombat() -> Bool {
    return false;
  }

  /////////////////////////
  // LIGHTS
  /////////////////////////

  public func autoResetLightColorEnabled() -> Bool {
    return false;
  }

  /////////////////////////
  // HEADLIGHTS
  /////////////////////////
  
  public func npcHeadlightsOverride() -> Bool {
    return false;
  }
  
  public func npcHeadlightsRadiusMultiplier() -> Float {
    return 0;
  }
  
  public func npcHeadlightsIntensityMultiplier() -> Float {
    return 0;
  }
  
  public func npcHeadlightsAttenuation() -> ELightAttenuation {
    return IntEnum<ELightAttenuation>(0);
  }
  
  public func headlightsSynchronizedWithTimeEnabled() -> Bool {
    return false;
  }

  public func defaultHeadlightsMode() -> EHeadlightsMode {
    return IntEnum<EHeadlightsMode>(0);
  }

  public func headlightsSynchronizedWithTimeMode() -> EHeadlightsSynchronizedWithTimeMode {
    return IntEnum<EHeadlightsSynchronizedWithTimeMode>(0);
  }

  public func utilityLightsSynchronizedWithTimeVehicleType() -> EUtilityLightsSynchronizedWithTimeVehicleType {
    return IntEnum<EUtilityLightsSynchronizedWithTimeVehicleType>(0);
  }
  
  public func headlightsTurnOnHour() -> Int32 {
    return 0;
  }
  
  public func headlightsTurnOnMinute() -> Int32 {
    return 0;
  }
  
  public func headlightsTurnOffHour() -> Int32 {
    return 0;
  }
  
  public func headlightsTurnOffMinute() -> Int32 {
    return 0;
  }
  
  public func headlights_CrystalCoatInclude() -> Bool {
    return false;
  }

  public func headlights_CrystalCoatColorType() -> ECrystalCoatColorType {
    return IntEnum<ECrystalCoatColorType>(0);
  }

  public func headlights_ColorSequence() -> ELightsColorCycleType {
    return IntEnum<ELightsColorCycleType>(0);
  }
  
  public func headlights_SequenceLatency() -> Float {
    return 0;
  }

  public func headlights_ImpactedVehicles() -> ELightsColorVehicleType {
    return IntEnum<ELightsColorVehicleType>(0);
  }
  
  public func headlights_LightIntensityEnabled() -> Bool {
    return false;
  }
  
  public func headlights_LightIntensity() -> Int32 {
    return 0;
  }
  
  public func headlights_LightColorEnabled() -> Bool {
    return false;
  }
  
  public func headlights_LightColorRed() -> Int32 {
    return 0;
  }
  
  public func headlights_LightColorGreen() -> Int32 {
    return 0;
  }
  
  public func headlights_LightColorBlue() -> Int32 {
    return 0;
  }
  
  public func headlights_CycleColorRed() -> Int32 {
    return 0;
  }
  
  public func headlights_CycleColorGreen() -> Int32 {
    return 0;
  }
  
  public func headlights_CycleColorBlue() -> Int32 {
    return 0;
  }

  /////////////////////////
  // TAIL LIGHTS
  /////////////////////////
  
  public func taillights_CrystalCoatInclude() -> Bool {
    return false;
  }

  public func taillights_CrystalCoatColorType() -> ECrystalCoatColorType {
    return IntEnum<ECrystalCoatColorType>(0);
  }

  public func taillights_ColorSequence() -> ELightsColorCycleType {
    return IntEnum<ELightsColorCycleType>(0);
  }
  
  public func taillights_SequenceLatency() -> Float {
    return 0;
  }

  public func taillights_ImpactedVehicles() -> ELightsColorVehicleType {
    return IntEnum<ELightsColorVehicleType>(0);
  }
  
  public func taillights_LightIntensityEnabled() -> Bool {
    return false;
  }
  
  public func taillights_LightIntensity() -> Int32 {
    return 0;
  }
  
  public func taillights_LightColorEnabled() -> Bool {
    return false;
  }
  
  public func taillights_LightColorRed() -> Int32 {
    return 0;
  }
  
  public func taillights_LightColorGreen() -> Int32 {
    return 0;
  }
  
  public func taillights_LightColorBlue() -> Int32 {
    return 0;
  }
  
  public func taillights_CycleColorRed() -> Int32 {
    return 0;
  }
  
  public func taillights_CycleColorGreen() -> Int32 {
    return 0;
  }
  
  public func taillights_CycleColorBlue() -> Int32 {
    return 0;
  }

  /////////////////////////
  // UTILITY LIGHTS
  /////////////////////////
  
  public func utilityLightsSynchronizedWithHeadlightsShutoff() -> Bool {
    return false;
  }

  public func defaultUtilityLightsMode() -> EUtilityLightsMode {
    return IntEnum<EUtilityLightsMode>(0);
  }
  
  public func utilitylights_CrystalCoatInclude() -> Bool {
    return false;
  }

  public func utilitylights_CrystalCoatColorType() -> ECrystalCoatColorType {
    return IntEnum<ECrystalCoatColorType>(0);
  }

  public func utilitylights_ColorSequence() -> ELightsColorCycleType {
    return IntEnum<ELightsColorCycleType>(0);
  }
  
  public func utilitylights_SequenceLatency() -> Float {
    return 0;
  }

  public func utilitylights_ImpactedVehicles() -> ELightsColorVehicleType {
    return IntEnum<ELightsColorVehicleType>(0);
  }
  
  public func utilitylights_LightIntensityEnabled() -> Bool {
    return false;
  }
  
  public func utilitylights_LightIntensity() -> Int32 {
    return 0;
  }
  
  public func utilitylights_LightColorEnabled() -> Bool {
    return false;
  }
  
  public func utilitylights_LightColorRed() -> Int32 {
    return 0;
  }
  
  public func utilitylights_LightColorGreen() -> Int32 {
    return 0;
  }
  
  public func utilitylights_LightColorBlue() -> Int32 {
    return 0;
  }
  
  public func utilitylights_CycleColorRed() -> Int32 {
    return 0;
  }
  
  public func utilitylights_CycleColorGreen() -> Int32 {
    return 0;
  }
  
  public func utilitylights_CycleColorBlue() -> Int32 {
    return 0;
  }

  /////////////////////////
  // BLINKER LIGHTS
  /////////////////////////
  
  public func blinkerlights_CrystalCoatInclude() -> Bool {
    return false;
  }

  public func blinkerlights_CrystalCoatColorType() -> ECrystalCoatColorType {
    return IntEnum<ECrystalCoatColorType>(0);
  }

  public func blinkerlights_ColorSequence() -> ELightsColorCycleType {
    return IntEnum<ELightsColorCycleType>(0);
  }
  
  public func blinkerlights_SequenceLatency() -> Float {
    return 0;
  }

  public func blinkerlights_ImpactedVehicles() -> ELightsColorVehicleType {
    return IntEnum<ELightsColorVehicleType>(0);
  }
  
  public func blinkerlights_LightIntensityEnabled() -> Bool {
    return false;
  }
  
  public func blinkerlights_LightIntensity() -> Int32 {
    return 0;
  }
  
  public func blinkerlights_LightColorEnabled() -> Bool {
    return false;
  }
  
  public func blinkerlights_LightColorRed() -> Int32 {
    return 0;
  }
  
  public func blinkerlights_LightColorGreen() -> Int32 {
    return 0;
  }
  
  public func blinkerlights_LightColorBlue() -> Int32 {
    return 0;
  }
  
  public func blinkerlights_CycleColorRed() -> Int32 {
    return 0;
  }
  
  public func blinkerlights_CycleColorGreen() -> Int32 {
    return 0;
  }
  
  public func blinkerlights_CycleColorBlue() -> Int32 {
    return 0;
  }

  /////////////////////////
  // REVERSE LIGHTS
  /////////////////////////
  
  public func reverselights_CrystalCoatInclude() -> Bool {
    return false;
  }

  public func reverselights_CrystalCoatColorType() -> ECrystalCoatColorType {
    return IntEnum<ECrystalCoatColorType>(0);
  }

  public func reverselights_ColorSequence() -> ELightsColorCycleType {
    return IntEnum<ELightsColorCycleType>(0);
  }
  
  public func reverselights_SequenceLatency() -> Float {
    return 0;
  }

  public func reverselights_ImpactedVehicles() -> ELightsColorVehicleType {
    return IntEnum<ELightsColorVehicleType>(0);
  }
  
  public func reverselights_LightIntensityEnabled() -> Bool {
    return false;
  }
  
  public func reverselights_LightIntensity() -> Int32 {
    return 0;
  }
  
  public func reverselights_LightColorEnabled() -> Bool {
    return false;
  }
  
  public func reverselights_LightColorRed() -> Int32 {
    return 0;
  }
  
  public func reverselights_LightColorGreen() -> Int32 {
    return 0;
  }
  
  public func reverselights_LightColorBlue() -> Int32 {
    return 0;
  }
  
  public func reverselights_CycleColorRed() -> Int32 {
    return 0;
  }
  
  public func reverselights_CycleColorGreen() -> Int32 {
    return 0;
  }
  
  public func reverselights_CycleColorBlue() -> Int32 {
    return 0;
  }

  /////////////////////////
  // INTERIOR LIGHTS
  /////////////////////////
  
  public func interiorlightsRoofLightOperatingMode() -> ERoofLightOperatingMode {
    return IntEnum<ERoofLightOperatingMode>(0);
  }
  
  public func interiorlightsRoofLightTurnOnWithPowerState() -> Bool {
    return false;
  }
  
  public func interiorlightsRoofLightTurnOnWithDoors() -> Bool {
    return false;
  }
  
  public func interiorlightsAutomaticTurnOn() -> EInteriorLightsToggleOn {
    return IntEnum<EInteriorLightsToggleOn>(0);
  }
  
  public func interiorlightsAutomaticTurnOff() -> EInteriorLightsToggleOff {
    return IntEnum<EInteriorLightsToggleOff>(0);
  }
  
  public func interiorlights_CrystalCoatInclude() -> Bool {
    return false;
  }

  public func interiorlights_CrystalCoatColorType() -> ECrystalCoatColorType {
    return IntEnum<ECrystalCoatColorType>(0);
  }

  public func interiorlights_ColorSequence() -> ELightsColorCycleType {
    return IntEnum<ELightsColorCycleType>(0);
  }
  
  public func interiorlights_SequenceLatency() -> Float {
    return 0;
  }

  public func interiorlights_ImpactedVehicles() -> ELightsColorVehicleType {
    return IntEnum<ELightsColorVehicleType>(0);
  }
  
  public func interiorlights_LightIntensityEnabled() -> Bool {
    return false;
  }
  
  public func interiorlights_LightIntensity() -> Int32 {
    return 0;
  }
  
  public func interiorlights_LightColorEnabled() -> Bool {
    return false;
  }
  
  public func interiorlights_LightColorRed() -> Int32 {
    return 0;
  }
  
  public func interiorlights_LightColorGreen() -> Int32 {
    return 0;
  }
  
  public func interiorlights_LightColorBlue() -> Int32 {
    return 0;
  }
  
  public func interiorlights_CycleColorRed() -> Int32 {
    return 0;
  }
  
  public func interiorlights_CycleColorGreen() -> Int32 {
    return 0;
  }
  
  public func interiorlights_CycleColorBlue() -> Int32 {
    return 0;
  }

  /////////////////////////
  // CRYSTAL COAT
  /////////////////////////

  public func crystalCoatDeactivationDistance() -> Float {
    return 0;
  }

  /////////////////////////
  // CRYSTAL DOME
  /////////////////////////

  public func crystalDomeSynchronizedWithPowerState() -> Bool {
    return false;
  }

  public func crystalDomeKeepOnUntilExit() -> Bool {
    return false;
  }

  public func preventCrystalDomeOffDuringCombat() -> Bool {
    return false;
  }

  public func autoEnableCrystalDomeDuringCombat() -> Bool {
    return false;
  }

  /////////////////////////
  // DOORS
  /////////////////////////

  public func doorsDriveClosing() -> EDoorsDriveClosing {
    return IntEnum<EDoorsDriveClosing>(0);
  }

  public func doorsDriveClosingSpeed() -> Float {
    return 0;
  }

  /////////////////////////
  // REAR SPOILER
  /////////////////////////

  public func spoilerSynchronizedWithPowerState() -> Bool {
    return false;
  }

  public func spoilerDeploySpeedEnabled() -> Bool {
    return false;
  }

  public func spoilerDeploySpeed() -> Float {
    return 0;
  }

  public func spoilerRetractSpeedEnabled() -> Bool {
    return false;
  }

  public func spoilerRetractSpeed() -> Float {
    return 0;
  }

  /////////////////////////
  // POLICE LIGHTS
  /////////////////////////

  public func keepSirenOnWhileOutsidePlayerEnabled() -> Bool {
    return false;
  }

  public func keepSirenOnWhileOutsideNPCsEnabled() -> Bool {
    return false;
  }

  public func policeBikeSirenEnabled() -> Bool {
    return false;
  }

  public func policeDispatchRadioEnabled() -> Bool {
    return false;
  }

  /////////////////////////
  // INPUT HINTS
  /////////////////////////

  public func displayPowerEngineInputHint() -> Bool {
    return false;
  }

  public func displayDoorsInputHint() -> Bool {
    return false;
  }

  public func displaySpoilerInputHint() -> Bool {
    return false;
  }

  public func displayWindowsInputHint() -> Bool {
    return false;
  }

  public func displayCrystalDomeInputHint() -> Bool {
    return false;
  }

  public func displayHeadlightsCallInputHint() -> Bool {
    return false;
  }

  public func displayToggleLightSettingsInputHint() -> Bool {
    return false;
  }

  /////////////////////////
  // OTHER SETTINGS
  /////////////////////////

  public func multiTapTimeWindow() -> Float {
    return 0;
  }

  public func cycleUtilityLightsHoldTime() -> Float {
    return 0;
  }
  
  /////////////////////////

  public func OnNativeUISettingsChange() {
    this.UpdatePoliceRadio();

    let gi: GameInstance = GetGameInstance();
    let player: ref<PlayerPuppet> = GetPlayer(gi);
    let watcher: ref<EntityWatcher> = EntityWatcher.Get(gi);

    if !IsDefined(player) || !IsDefined(watcher) {
      return;
    }

    if IsDefined(player) {
      player.m_hgyi56_EVS_customLightsAreBeingToggled = true;

      let drivenVehicles: array<wref<IScriptable>>;
      player.m_hgyi56_EVS_drivenVehicles.GetValues(drivenVehicles);

      let i = 0;
      while i < ArraySize(drivenVehicles) {
        let vehComp: ref<VehicleComponent> = drivenVehicles[i] as VehicleComponent;

        if IsDefined(vehComp) {
          let vehicle: ref<VehicleObject> = vehComp.GetVehicle();

          if IsDefined(vehicle) {
            vehComp.hgyi56_EVS_OnModSettingsChange();

            watcher.CustomizeVehicleRoofLight(vehicle);
            watcher.CustomizeVehicleHeadlights(vehicle);
          }
        }

        i += 1;
      }
      player.m_hgyi56_EVS_customLightsAreBeingToggled = false;
    }
  }
  
  private cb func UpdatePoliceRadio() {
    let depot: ref<ResourceDepot> = GameInstance.GetResourceDepot();
    let settings: ref<MyModSettings> = MyModSettings.Get(GetGameInstance());

    if !IsDefined(depot) {
      return;
    }
    
    let token: ref<ResourceToken> = depot.LoadResource(r"base\\sound\\metadata\\cooked_metadata.audio_metadata");
    
    if !IsDefined(token) {
      return;
    }

    let cookedMetadata: ref<audioCookedMetadataResource> = token.GetResource() as audioCookedMetadataResource;
    
    if !IsDefined(cookedMetadata) {
      return;
    }

    for audioData in cookedMetadata.entries {
      let vehicleAudio: ref<audioVehicleMetadata> = audioData as audioVehicleMetadata;

      if IsDefined(vehicleAudio)
      && Equals(vehicleAudio.radioReceiverType, n"radio_car_police_player") {
        vehicleAudio.radioPlaysWhenEngineStartsProbability = settings.policeDispatchRadioEnabled() ? 1.0 : 0.0;
      }
    }
  }

  public static func Get(gi: GameInstance) -> ref<MyModSettings> {
    return GameInstance.GetScriptableSystemsContainer(gi).Get(NameOf(MyModSettings)) as MyModSettings;
  }
}

public class CrystalDomeTimingsArray {
  public let FL_in: Float;
  public let FL_out: Float;
  public let FR_in: Float;

  public static func Create(FL_in: Float, FL_out: Float, FR_in: Float) -> ref<CrystalDomeTimingsArray> {

    let floatarray: ref<CrystalDomeTimingsArray> = new CrystalDomeTimingsArray();

    floatarray.FL_in = FL_in;
    floatarray.FL_out = FL_out;
    floatarray.FR_in = FR_in;

    return floatarray;
  }
}

public class WindowTimingsArray {
  public let openTiming: Float;
  public let closeTiming: Float;

  public static func Create(openTiming: Float, closeTiming: Float) -> ref<WindowTimingsArray> {

    let floatarray: ref<WindowTimingsArray> = new WindowTimingsArray();

    floatarray.openTiming = openTiming;
    floatarray.closeTiming = closeTiming;

    return floatarray;
  }
}

public class StringWrapper {
  public let name: String;

  public static func Create(name: String) -> ref<StringWrapper> {

    let stringWrapper: ref<StringWrapper> = new StringWrapper();

    stringWrapper.name = name;

    return stringWrapper;
  }
}

public class VehicleData extends ScriptableSystem {

  public let kmh_multiplier: Float = 1.609344;

  public let hasIncompatibleSlidingDoorsWindow_VehicleMap: ref<inkStringMap>;
  public let incorrectDoorNumber_VehicleMap: ref<inkStringMap>;
  public let isSlidingDoors_VehicleMap: ref<inkStringMap>;
  public let isSingleFrontDoor_VehicleMap: ref<inkStringMap>;
  public let hasWindows_VehicleMap: ref<inkStringMap>;

  public let crystalDomeMeshTimings_VehicleMap: ref<inkHashMap>;
  public let windowTimings_VehicleMap: ref<inkHashMap>;
  public let drivingParamsGeneric_VehicleMap: ref<inkHashMap>;

  public let rainbowColors: array<array<Int32>>;

  public static func Get(gi: GameInstance) -> ref<VehicleData> {
    return GameInstance.GetScriptableSystemsContainer(gi).Get(NameOf(VehicleData)) as VehicleData;
  }
  
  public func RemoveBlankSpecialCharacters(string: String) -> String {
    return StrReplaceAll(string, " ", " ");
  }
  
  public func ShortModelName(vehicleModel: String) -> String {
    // Get the first word of the vehicle model
    let parts: array<String> = StrSplit(this.RemoveBlankSpecialCharacters(vehicleModel), " ");
    
    if ArraySize(parts) > 2 {
      vehicleModel = s"\(parts[0]) \(parts[1])";
    }

    return vehicleModel;
  }

  public func KeyExist(vehicleModel: String, map: ref<inkStringMap>) -> Bool {
    if !IsDefined(map) {
      return false;
    }

    return map.KeyExist(vehicleModel);
  }

  public func KeyExist(vehicleModel: String, map: ref<inkHashMap>) -> Bool {
    if !IsDefined(map) {
      return false;
    }
    
    return map.KeyExist(TDBID.ToNumber(TDBID.Create(vehicleModel)));
  }

  private func OnAttach() -> Void {    
    ArrayPush(this.rainbowColors, [255, 0, 0]); // Red
    ArrayPush(this.rainbowColors, [255, 127, 0]); // Orange
    ArrayPush(this.rainbowColors, [255, 255, 0]); // Yellow
    ArrayPush(this.rainbowColors, [0, 255, 0]); // Green
    ArrayPush(this.rainbowColors, [0, 0, 255]); // Blue
    ArrayPush(this.rainbowColors, [75, 0, 130]); // Indigo
    ArrayPush(this.rainbowColors, [148, 0, 211]); // Violet

    this.crystalDomeMeshTimings_VehicleMap = new inkHashMap();
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
    this.crystalDomeMeshTimings_VehicleMap.Insert(TDBID.ToNumber(t"Mizutani Shion"), CrystalDomeTimingsArray.Create(2.00, 0.85, 1.65)); // Shion "Coyote" / "Wendigo" / "Samum" / "Bonewrecker" / "Blackbird"
    this.crystalDomeMeshTimings_VehicleMap.Insert(TDBID.ToNumber(t"Quadra Type-66"), CrystalDomeTimingsArray.Create(2.15, 0.75, 1.85)); // Type-66 "Javelina" / "Reaver" / "Wingate"
    this.crystalDomeMeshTimings_VehicleMap.Insert(TDBID.ToNumber(t"Thorton Colby"), CrystalDomeTimingsArray.Create(1.85, 0.75, 1.55)); // Colby "Little Mule" / "Revenant" / "Vulture"
    // Archer Quartz "Sidewinder" / "Specter" has an additional issue: the game cannot
    // display both external elements and internal crystal dome without a merge glitch between them. There is no solution for this.
    // As a workaround I used a very short transition timing for "driver/passenger getting in" so it is the least glitchy I can do.
    this.crystalDomeMeshTimings_VehicleMap.Insert(TDBID.ToNumber(t"Archer Quartz"), CrystalDomeTimingsArray.Create(0.20, 0.75, 0.20)); // Quartz "Sidewinder" / "Specter"
    this.crystalDomeMeshTimings_VehicleMap.Insert(TDBID.ToNumber(t"Thorton Galena"), CrystalDomeTimingsArray.Create(1.50, 0.75, 1.00)); // Galena "Gecko" / "Ghoul" / "Locust"
    this.crystalDomeMeshTimings_VehicleMap.Insert(TDBID.ToNumber(t"Mahir Supron"), CrystalDomeTimingsArray.Create(0.00, 1.10, 0.00)); // Supron "Trailbruiser"
    this.crystalDomeMeshTimings_VehicleMap.Insert(TDBID.ToNumber(t"Herrera Outlaw « Weiler »"), CrystalDomeTimingsArray.Create(1.50, 0.75, 1.50)); // Outlaw "Weiler"
    // Militech "Hellhound" does not use external crystal dome mesh
    // Rayfield Caliburn does not use external crystal dome mesh
    // Rayfield Aerondight does not use external crystal dome mesh
    
    this.windowTimings_VehicleMap = new inkHashMap();
    // When a vehicle is marked as "hasIncompatibleSlidingDoorsWindow" it means that this vehicle must have windows open while doors are open and the user
    // must not be able to manipulate windows while doors are open. Moreover if the windows are open and the player opens the door we must close the window with a precise timing
    // so the window does not get out of the door mesh while the door is opening.
    // For this particular cases we need to define window timings that depends on vehicle model.
    this.windowTimings_VehicleMap.Insert(TDBID.ToNumber(t"Quadra Type-66"), WindowTimingsArray.Create(0.59, 0.40));
    this.windowTimings_VehicleMap.Insert(TDBID.ToNumber(t"Herrera Riptide"), WindowTimingsArray.Create(0.59, 0.29));

    this.drivingParamsGeneric_VehicleMap = new inkHashMap();
    this.drivingParamsGeneric_VehicleMap.Insert(TDBID.ToNumber(t"Driving.Default_Delamain"), StringWrapper.Create("Driving.Default_Delamain"));

    this.incorrectDoorNumber_VehicleMap = new inkStringMap();
    //this.incorrectDoorNumber_VehicleMap.Insert("Thorton Mackinaw", Cast<Uint64>(2)); // Defined with 4 seats but only 3 real windows, and 3 real doors with back left door glitchy
    this.incorrectDoorNumber_VehicleMap.Insert("Militech Hellhound", Cast<Uint64>(4)); // Militech "Hellhound" is defined with 2 seats but it has 4 real doors
    this.incorrectDoorNumber_VehicleMap.Insert("Mahir Supron", Cast<Uint64>(4)); // Supron "Trailbruiser" is defined with 2 seats but it has 4 real doors
    
    this.incorrectDoorNumber_VehicleMap.Insert("Villefort Alvarado", Cast<Uint64>(4)); // Defined with 2 seats but it has 4 real windows
    this.incorrectDoorNumber_VehicleMap.Insert("Villefort Alvarado V4FH 570 Herman", Cast<Uint64>(2)); // Defined with 2 seats but it has 4 real windows
    
    this.incorrectDoorNumber_VehicleMap.Insert("Chevillon Bratsk", Cast<Uint64>(4)); // Defined with 2 seats but it has 4 real doors
    this.incorrectDoorNumber_VehicleMap.Insert("Quadra Sport", Cast<Uint64>(2)); // "Sport R-7 580" Defined with 4 windows but it has 2 real doors

    this.isSingleFrontDoor_VehicleMap = new inkStringMap();
    this.isSingleFrontDoor_VehicleMap.Insert("Herrera Riptide", Cast<Uint64>(0)); // Riptide GT2
    
    this.hasWindows_VehicleMap = new inkStringMap();
    this.hasWindows_VehicleMap.Insert("Herrera Outlaw « Weiler »", Cast<Uint64>(0)); // Outlaw "Weiler"

    this.isSlidingDoors_VehicleMap = new inkStringMap();
    this.isSlidingDoors_VehicleMap.Insert("Rayfield Caliburn", Cast<Uint64>(0));
    this.isSlidingDoors_VehicleMap.Insert("Rayfield Aerondight", Cast<Uint64>(0));
    this.isSlidingDoors_VehicleMap.Insert("Mizutani Shion", Cast<Uint64>(0)); // Shion "Coyote" / "Wendigo" / "Samum" / "Bonewrecker" / "Blackbird" / MZ1 / MZ2 / Targa MZT / "Kyokotsu"
    this.isSlidingDoors_VehicleMap.Insert("Quadra Turbo-R", Cast<Uint64>(0)); // "Quadra Turbo-R V-Tech" / "Quadra Turbo-R 740"
    this.isSlidingDoors_VehicleMap.Insert("Quadra Type-66", Cast<Uint64>(0)); // Type-66 640 TS / 680 TS / Avenger / "Cthulhu" / "Jen Rowley" / "Mistral" / "Javelina" / "Reaver" / "Hoon" / "Wingate"

    this.hasIncompatibleSlidingDoorsWindow_VehicleMap = new inkStringMap();
    // This is the list of vehicles that use sliding doors that must not be able to toggle windows while doors are opened
    // Otherwise the window will go out of the door mesh because the window animation for these vehicles is not meant to play while doors are opened
    // All vehicles that match this list won't be able to toggle windows while doors are opened
    this.hasIncompatibleSlidingDoorsWindow_VehicleMap.Insert("Quadra Type-66", Cast<Uint64>(0)); // Type-66 640 TS / 680 TS / Avenger / "Cthulhu" / "Jen Rowley" / "Mistral" / "Javelina" / "Reaver" / "Hoon" / "Wingate"
    this.hasIncompatibleSlidingDoorsWindow_VehicleMap.Insert("Herrera Riptide", Cast<Uint64>(0)); // Riptide GT2
  }
}

public class Utils {

  @if(ModuleExists("Audioware"))
  public static func AudiowareIsInstalled() -> Bool {
    return true;
  }
  @if(!ModuleExists("Audioware"))
  public static func AudiowareIsInstalled() -> Bool {
    return false;
  }

  @if(ModuleExists("Hgyi56.Enhanced_Vehicle_System.Police_Siren_As_Horn"))
  public static func PoliceSirenAsHornIsInstalled() -> Bool {
    return true;
  }
  @if(!ModuleExists("Hgyi56.Enhanced_Vehicle_System.Police_Siren_As_Horn"))
  public static func PoliceSirenAsHornIsInstalled() -> Bool {
    return false;
  }

  public static func SecondToLast(arrayObj: array<MountingSlotId>, out slodId: MountingSlotId) -> Bool {

    if ArraySize(arrayObj) < 2 {
      return false;
    }

    slodId = arrayObj[ArraySize(arrayObj) - 2];
    
    return true;
  }

  public static func GetCurrentTime(gi: GameInstance) -> Float {
    return EngineTime.ToFloat(GameInstance.GetEngineTime(gi));
  }
}

public class LightComponentParameters {
  public let turnOnTime: Float;
  public let turnOffTime: Float;
  public let turnOnCurve: CName;
  public let turnOffCurve: CName;
  public let radius: Float;
  public let intensity: Float;
  public let attenuation: rendLightAttenuation;
}

public class EnumTypeExtender extends ScriptableService {

  // Earlier moment of game loading to add new coding resource
  public func OnLoad() {
    // Add new enum value
    // Enum works as a bitfield
    //
    // Head is         1 = 0000 0001
    // Brake is        2 = 0000 0010
    // LeftBlinker is  4 = 0000 0100
    // RightBlinker is 8 = 0000 1000
    // Reverse is     16 = 0001 0000
    // Interior is    32 = 0010 0000
    // Utility is     64 = 0100 0000
    // Default is     47 = 0010 1111
    // Blinkers is    12 = 0000 1100
    //
    // The next available slot is:
    //          128 = 0001 0000 0000
    Reflection.GetEnum(n"vehicleELightType").AddConstant(n"hgyi56_RoofLining", 128);
  }
}

public class EntityWatcher extends ScriptableSystem {

  public static func Get(gi: GameInstance) -> ref<EntityWatcher> {
    return GameInstance.GetScriptableSystemsContainer(gi).Get(NameOf(EntityWatcher)) as EntityWatcher;
  }

  private func OnAttach() {
    GameInstance.GetCallbackSystem().RegisterCallback(n"Entity/Assemble", this, n"OnEntityAssemble");
    GameInstance.GetCallbackSystem().RegisterCallback(n"Entity/Reassemble", this, n"OnEntityReassemble");
    GameInstance.GetCallbackSystem().RegisterCallback(n"Entity/Attached", this, n"OnEntityAttached");
    GameInstance.GetCallbackSystem().RegisterCallback(n"Vehicle/ToggleAuxLights", this, n"OnToggleAuxLights");
  }
  
  private func CustomizeEntityComponents(vehicle: ref<VehicleObject>) {
    if !IsDefined(vehicle) {
      return;
    }

    let gi: GameInstance = GetGameInstance();
    let components: array<ref<IComponent>> = vehicle.GetComponents();
    let settings: ref<MyModSettings> = MyModSettings.Get(gi);

    vehicle.m_hgyi56_EVS_lightComponentsParameters = new inkHashMap();

    for comp in components {
      if IsDefined(comp) {
        let lightComp: wref<vehicleLightComponent> = comp as vehicleLightComponent;

        if IsDefined(lightComp) {
          if Equals(lightComp.lightType, vehicleELightType.Interior) {
            if Equals(lightComp.turnOnCurve, n"interior_light_on") { // Is roof light
              if !ArrayContains(vehicle.m_hgyi56_EVS_roofLightComponents, lightComp) {
                ArrayPush(vehicle.m_hgyi56_EVS_roofLightComponents, lightComp);
              }

              // Backup component parameters
              let params: ref<LightComponentParameters> = new LightComponentParameters();
              params.turnOnTime = lightComp.turnOnTime;
              params.turnOffTime = lightComp.turnOffTime;

              vehicle.m_hgyi56_EVS_lightComponentsParameters.Insert(TDBID.ToNumber(TDBID.Create(ToString(lightComp.name))), params);

              // Use another channel for the roof light components
              lightComp.lightType = IntEnum<vehicleELightType>(EnumValueFromName(n"vehicleELightType", n"hgyi56_RoofLining"));
            }
            else {
              lightComp.turnOnCurve = n"portal_on";
              lightComp.turnOffCurve = n"interior_light_off";
              lightComp.turnOnTime = 0.8;
              lightComp.turnOffTime = 0.5;
            }
          }
          else if Equals(lightComp.lightType, vehicleELightType.Head) {
            if !ArrayContains(vehicle.m_hgyi56_EVS_headlightsComponents, lightComp) {
              ArrayPush(vehicle.m_hgyi56_EVS_headlightsComponents, lightComp);
            }

            // Backup component parameters
            let params: ref<LightComponentParameters> = new LightComponentParameters();
            params.attenuation = lightComp.attenuation;
            params.radius = lightComp.radius;
            params.intensity = lightComp.intensity;

            params.turnOnTime = lightComp.turnOnTime;
            params.turnOffTime = lightComp.turnOffTime;
            params.turnOnCurve = lightComp.turnOnCurve;
            params.turnOffCurve = lightComp.turnOffCurve;

            vehicle.m_hgyi56_EVS_lightComponentsParameters.Insert(TDBID.ToNumber(TDBID.Create(ToString(lightComp.name))), params);
          }
        }
        else {
          let widget: ref<worlduiWidgetComponent> = comp as worlduiWidgetComponent;

          if IsDefined(widget) && StrContains(ToString(widget.name), "interior_ui") {
            widget.sceneWidgetProperties.isAlwaysVisible = true; // May prevents vehicle UI spawning to be pixellated
          }
        }
      }
    }

    this.CustomizeVehicleRoofLight(vehicle);
    this.CustomizeVehicleHeadlights(vehicle);
  }

  private cb func OnEntityAssemble(event: ref<EntityLifecycleEvent>) {
    let vehicle: ref<VehicleObject> = event.GetEntity() as VehicleObject;

    this.CustomizeEntityComponents(vehicle);
  }

  private cb func OnEntityReassemble(event: ref<EntityLifecycleEvent>) {
    let vehicle: ref<VehicleObject> = event.GetEntity() as VehicleObject;

    this.CustomizeEntityComponents(vehicle);
  }

  private cb func OnEntityAttached(event: ref<EntityLifecycleEvent>) {
    let gi: GameInstance = GetGameInstance();
    let vehicle: ref<VehicleObject> = event.GetEntity() as VehicleObject;

    if !IsDefined(vehicle) {
      return;
    }
    
    let vehComp: wref<VehicleComponent> = vehicle.GetVehicleComponent();
    if !IsDefined(vehComp) {
      return;
    }

    let vehCtrlPS: ref<vehicleControllerPS> = vehComp.GetVehicleControllerPS();    
    let player: ref<PlayerPuppet> = GetPlayer(gi);

    if !IsDefined(player) || !IsDefined(vehCtrlPS) {
      return;
    }

    let entityHashId = TDBID.ToNumber(TDBID.Create(ToString(vehicle.GetEntityID())));

    if ArrayContains(player.GetPS().m_hgyi56_EVS_drivenVehiclesID, vehicle.GetEntityID()) {

      // Register the driven vehicle
      player.m_hgyi56_EVS_drivenVehicles.Insert(entityHashId, vehComp);

      // Restore vehicle state
      let playerInsideVehicle = Equals(vehicle, player.GetMountedVehicle());

      //////////////////
      // Engine
      if vehComp.GetPS().m_hgyi56_EVS_engineState {
        vehicle.TurnEngineOn(vehComp.GetPS().m_hgyi56_EVS_engineState);

        // Prevents the vehicle from shutting down when the player is outside
        if !playerInsideVehicle {
          vehCtrlPS.SetState(vehicleEState.Default);
        }
      }
      //////////////////

      // Restore other elements with a delay otherwise it won't work because of the native engine toggle procedure
      let callback: ref<RestoreVehicleStateCallback> = new RestoreVehicleStateCallback();
      callback.vehComp = vehComp;
      callback.playerInsideVehicle = playerInsideVehicle;
      
      GameInstance.GetDelaySystem(gi).DelayCallback(callback, 0.001, true);
      
      player.m_hgyi56_EVS_customLightsAreBeingToggled = true;
      vehComp.hgyi56_EVS_OnModSettingsChange();
      player.m_hgyi56_EVS_customLightsAreBeingToggled = false;
    }
  }

  private cb func OnToggleAuxLights(event: ref<VehicleLightControlEvent>) {
    let vehicle: ref<VehicleObject> = event.GetEntity() as VehicleObject;
    let state = event.IsEnabled();

    let gi: GameInstance = GetGameInstance();
    let player: ref<PlayerPuppet> = GetPlayer(gi);
    let settings: ref<MyModSettings> = MyModSettings.Get(gi);

    if !IsDefined(vehicle) || !IsDefined(player) {
      return;
    }

    let vehComp: ref<VehicleComponent> = vehicle.GetVehicleComponent();
    if !IsDefined(vehComp)
    || !ArrayContains(player.GetPS().m_hgyi56_EVS_drivenVehiclesID, vehicle.GetEntityID()) {
      return;
    }
    
    if event.IsLightType(vehicleELightType.Interior)
    && NotEquals(state, vehComp.GetPS().m_hgyi56_EVS_interiorLightsState) {
      let callback: ref<UpdateLightsCallback> = new UpdateLightsCallback();
      callback.vehComp = vehComp;
      callback.lightType = vehicleELightType.Interior;

      GameInstance.GetDelaySystem(gi).DelayCallback(callback, 0.001, true);
    }
    else if event.IsLightType(IntEnum<vehicleELightType>(EnumValueFromName(n"vehicleELightType", n"hgyi56_RoofLining")))
    && NotEquals(state, vehComp.GetPS().m_hgyi56_EVS_roofLightState) {
      let callback: ref<UpdateLightsCallback> = new UpdateLightsCallback();
      callback.vehComp = vehComp;
      callback.lightType = IntEnum<vehicleELightType>(EnumValueFromName(n"vehicleELightType", n"hgyi56_RoofLining"));
      
      GameInstance.GetDelaySystem(gi).DelayCallback(callback, 0.001, true);
    }
  }

  public func CustomizeVehicleRoofLight(vehicle: ref<VehicleObject>) {
    if !IsDefined(vehicle) {
      return;
    }
    let settings: ref<MyModSettings> = MyModSettings.Get(GetGameInstance());
    
    for lightComp in vehicle.m_hgyi56_EVS_roofLightComponents {
      if IsDefined(lightComp) {
        let params: ref<LightComponentParameters> = vehicle.m_hgyi56_EVS_lightComponentsParameters.Get(TDBID.ToNumber(TDBID.Create(ToString(lightComp.name)))) as LightComponentParameters;
        
        if Equals(settings.interiorlightsRoofLightOperatingMode(), ERoofLightOperatingMode.Temporary) {
          lightComp.turnOnCurve = n"interior_light_on";
          lightComp.turnOffCurve = n"interior_light_off";
          lightComp.turnOnTime = params.turnOnTime;
          lightComp.turnOffTime = params.turnOffTime;
        }
        else if Equals(settings.interiorlightsRoofLightOperatingMode(), ERoofLightOperatingMode.Fixed) {
          lightComp.turnOnCurve = n"portal_on";
          lightComp.turnOffCurve = n"None";
          lightComp.turnOnTime = 0.8;
          lightComp.turnOffTime = 0.25;
        }
      }
      
      vehicle.m_roofLight_TurnOnTime = lightComp.turnOnTime;
    }
  }

  public func CustomizeVehicleHeadlights(vehicle: ref<VehicleObject>) {
    if !IsDefined(vehicle) {
      return;
    }
    let settings: ref<MyModSettings> = MyModSettings.Get(GetGameInstance());

    for lightComp in vehicle.m_hgyi56_EVS_headlightsComponents {
      if IsDefined(lightComp) {
        let params: ref<LightComponentParameters> = vehicle.m_hgyi56_EVS_lightComponentsParameters.Get(TDBID.ToNumber(TDBID.Create(ToString(lightComp.name)))) as LightComponentParameters;

        if settings.npcHeadlightsOverride() {
          let radius_multiplier = settings.npcHeadlightsRadiusMultiplier();
          let intensity_multiplier = settings.npcHeadlightsRadiusMultiplier();

          lightComp.attenuation = IntEnum<rendLightAttenuation>(EnumValueFromName(n"rendLightAttenuation", StringToName(s"LA_\(settings.npcHeadlightsAttenuation())")));
          lightComp.radius = params.radius * radius_multiplier;
          lightComp.intensity = params.intensity * intensity_multiplier;
        }
        else {
          lightComp.attenuation = params.attenuation;
          lightComp.radius = params.radius;
          lightComp.intensity = params.intensity;
        }
      }
    }
  }
}

public class UpdateLightsCallback extends DelayCallback {

  public let vehComp: ref<VehicleComponent>;
  public let lightType: vehicleELightType;

  public func Call() {
    let vehCtrl: ref<vehicleController> = this.vehComp.GetVehicleController();
    if !IsDefined(this.vehComp) || !IsDefined(vehCtrl) {
      return;
    }

    if Equals(this.lightType, vehicleELightType.Interior) {
      this.vehComp.hgyi56_EVS_EnsureIsActive_InteriorLights();
      this.vehComp.hgyi56_EVS_EnsureIsDisabled_InteriorLights();
    }
    else if Equals(this.lightType, IntEnum<vehicleELightType>(EnumValueFromName(n"vehicleELightType", n"hgyi56_RoofLining"))) {
      this.vehComp.hgyi56_EVS_EnsureIsActive_RoofLight();
      this.vehComp.hgyi56_EVS_EnsureIsDisabled_RoofLight();
    }
    else if Equals(this.lightType, vehicleELightType.Utility) {
      if this.vehComp.GetPS().m_hgyi56_EVS_isPoliceVehicle {
        let sirenState = this.vehComp.GetPS().GetSirenState();
        vehCtrl.ToggleLights(sirenState, vehicleELightType.Utility);
      }
      else {
        this.vehComp.hgyi56_EVS_EnsureIsActive_UtilityLights();
        this.vehComp.hgyi56_EVS_EnsureIsDisabled_UtilityLights();
      }
    }
  }
}

public class RoofLightRearmCallback extends DelayCallback {

  public let vehComp: ref<VehicleComponent>;
  public let identifier: Int32;
  public let isExitingWithPermanentLight: Bool = false;

  public func Call() {
    if !IsDefined(this.vehComp) {
      return;
    }

    if !this.isExitingWithPermanentLight
    && NotEquals(this.identifier, this.vehComp.m_hgyi56_EVS_roofLight_CycleIdentifier) {
      return;
    }

    this.vehComp.GetPS().m_hgyi56_EVS_roofLightState = false;
    this.vehComp.hgyi56_EVS_EnsureIsDisabled_RoofLight();
  }
}

public class RestoreVehicleStateCallback extends DelayCallback {

  public let vehComp: ref<VehicleComponent>;
  public let playerInsideVehicle: Bool;

  public func Call() {
    if !IsDefined(this.vehComp) {
      return;
    }

    let gi: GameInstance = GetGameInstance();
    let vehicle: ref<VehicleObject> = this.vehComp.GetVehicle();
    if !IsDefined(vehicle) {
      return;
    }

    this.vehComp.hgyi56_EVS_ToggleDashboard(this.vehComp.GetPS().m_hgyi56_EVS_powerState);

    this.vehComp.hgyi56_EVS_EnsureIsActive_InteriorLights();
    this.vehComp.hgyi56_EVS_EnsureIsDisabled_InteriorLights();

    this.vehComp.hgyi56_EVS_EnsureIsActive_RoofLight();
    this.vehComp.hgyi56_EVS_EnsureIsDisabled_RoofLight();

    this.vehComp.hgyi56_EVS_EnsureIsActive_UtilityLights();
    this.vehComp.hgyi56_EVS_EnsureIsDisabled_UtilityLights();

    this.vehComp.hgyi56_EVS_ApplyHeadlightsModeWithShutOff();

    this.vehComp.hgyi56_EVS_ToggleSpoiler(this.vehComp.GetPS().m_hgyi56_EVS_spoilerState);

    if this.vehComp.GetPS().GetCrystalDomeState()
    && !this.playerInsideVehicle {
      this.vehComp.OnVehicleCameraChange(true); // true = TPP
    }

    // // // // // // //
    // Police lights and siren
    //
    if this.vehComp.m_useAuxiliary && this.vehComp.GetPS().m_hgyi56_EVS_isPoliceVehicle {
      switch this.vehComp.GetPS().m_hgyi56_EVS_threeStatesSiren {
        case 0:
          // All OFF (internal game siren state is OFF)
          this.vehComp.GetVehicleController().ToggleLights(false, vehicleELightType.Utility);
          this.vehComp.StartEffectEvent(vehicle, n"police_sign_default", true);
          this.vehComp.GetPS().SetSirenLightsState(false);
          this.vehComp.GetPS().SetSirenState(false);
          this.vehComp.GetPS().SetSirenSoundsState(false);
          vehicle.ToggleSiren(false);
          break;

        case 1:
          // Lights ON (internal game siren state is ON)
          this.vehComp.GetVehicleController().ToggleLights(true, vehicleELightType.Utility);
          this.vehComp.StartEffectEvent(vehicle, n"police_sign_combat", true);
          this.vehComp.GetPS().SetSirenLightsState(true);
          this.vehComp.GetPS().SetSirenState(true);
          this.vehComp.GetPS().SetSirenSoundsState(false);
          vehicle.ToggleSiren(false);
          break;

        case 2:
          // Siren ON (internal game siren state is ON)
          this.vehComp.GetVehicleController().ToggleLights(true, vehicleELightType.Utility);
          this.vehComp.StartEffectEvent(vehicle, n"police_sign_combat", true);
          this.vehComp.GetPS().SetSirenLightsState(true);
          this.vehComp.GetPS().SetSirenState(true);
          this.vehComp.GetPS().SetSirenSoundsState(true);

          let shouldEnableSiren = MyModSettings.Get(gi).keepSirenOnWhileOutsidePlayerEnabled() || this.playerInsideVehicle;
          vehicle.ToggleSiren(shouldEnableSiren);

          if vehicle == (vehicle as BikeObject)
          && MyModSettings.Get(gi).policeBikeSirenEnabled() {
            GameInstance.GetAudioSystem(gi).PlayOnEmitter(n"v_car_villefort_cortes_police_siren_start", vehicle.GetEntityID(), n"vehicle_engine_emitter");
          }
          break;
      }
    }
    // // // // // // //
  }
}

// This callback restores the dashboard state when mounting for the first time into a unmodded CrystalCoat vehicle.
// Because the vanilla behavior is to toggle the entity appearance on first mounting and it forces the activation of the dashboard.
public class RestoreDashboardOnMountingCallback extends DelayCallback {

  public let vehComp: ref<VehicleComponent>;

  public func Call() {
    if !IsDefined(this.vehComp) {
      return;
    }

    let vehicle: ref<VehicleObject> = this.vehComp.GetVehicle();
    if !IsDefined(vehicle) {
      return;
    }
    
    if !this.vehComp.GetPS().m_hgyi56_EVS_powerState {
      this.vehComp.hgyi56_EVS_ToggleDashboard(false);
    }
  }
}

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_currentHeadlightsState: vehicleELightMode = vehicleELightMode.Off;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_temporaryHeadlightsShutOff: Bool = false;

@addField(VehicleComponent)
public let m_hgyi56_EVS_cycleCrystalCoatLongInputTriggered: Bool = false;

@addField(VehicleComponent)
public let m_hgyi56_EVS_cycleCrystalCoatLastPressTime: Float = 0.00;

@addField(VehicleComponent)
public let m_hgyi56_EVS_cycleCrystalCoatStep: Int32 = 0;

@addField(VehicleComponent)
public let m_hgyi56_EVS_cycleDoorLongInputTriggered: Bool = false;

@addField(VehicleComponent)
public let m_hgyi56_EVS_cycleDoorLastPressTime: Float = 0.00;

@addField(VehicleComponent)
public let m_hgyi56_EVS_cycleDoorStep: Int32 = 0;

@addField(VehicleComponent)
public let m_hgyi56_EVS_cycleWindowLongInputTriggered: Bool = false;

@addField(VehicleComponent)
public let m_hgyi56_EVS_cycleWindowLastPressTime: Float = 0.00;

@addField(VehicleComponent)
public let m_hgyi56_EVS_cycleWindowStep: Int32 = 0;

@addField(VehicleComponent)
public let m_hgyi56_EVS_cycleSpoilerLongInputTriggered: Bool = false;

@addField(VehicleComponent)
public let m_hgyi56_EVS_cycleSpoilerLastPressTime: Float = 0.00;

@addField(VehicleComponent)
public let m_hgyi56_EVS_cycleSpoilerStep: Int32 = 0;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_totalSeatSlots: Int32 = 0;

@addField(VehicleComponent)
public let m_hgyi56_EVS_cycleDomeLongInputTriggered: Bool = false;

@addField(VehicleComponent)
public let m_hgyi56_EVS_cycleDomeLastPressTime: Float = 0.00;

@addField(VehicleComponent)
public let m_hgyi56_EVS_cycleDomeStep: Int32 = 0;

@addField(VehicleComponent)
public let m_hgyi56_EVS_cyclePoliceSirenLongInputTriggered: Bool = false;

@addField(VehicleComponent)
public let m_hgyi56_EVS_cyclePoliceSirenLastPressTime: Float = 0.00;

@addField(VehicleComponent)
public let m_hgyi56_EVS_cyclePoliceSirenStep: Int32 = 0;

@addField(VehicleComponent)
public let m_hgyi56_EVS_cycleLightsLongInputTriggered: Bool = false;

@addField(VehicleComponent)
public let m_hgyi56_EVS_cycleLightsPressTime: Float = 0.00;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_roofLightState: Bool = false;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_interiorLightsState: Bool = false;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_powerState: Bool = false;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_engineState: Bool = false;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_spoilerState: Bool = false;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_poweredOnAtLeastOnceSinceLastEnter: Bool = false;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_auxiliaryState: Bool = false;

@addField(VehicleComponent)
public let m_hgyi56_EVS_playerIsDismounting: Bool = false;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_playerIsMounted: Bool = false;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_playerIsMountedFromPassengerSeat: Bool = false;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_isDriverCombat: Bool = false;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_isDriverCombatType_Doors: Bool = false;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_crystalDomeMeshTimings: ref<CrystalDomeTimingsArray> = null;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_windowTimings: ref<WindowTimingsArray> = null;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_isKmH: Bool = false;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_FL_windowState: EVehicleWindowState = EVehicleWindowState.Closed;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_FR_windowState: EVehicleWindowState = EVehicleWindowState.Closed;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_BL_windowState: EVehicleWindowState = EVehicleWindowState.Closed;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_BR_windowState: EVehicleWindowState = EVehicleWindowState.Closed;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_FL_doorState: VehicleDoorState = VehicleDoorState.Closed;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_FR_doorState: VehicleDoorState = VehicleDoorState.Closed;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_BL_doorState: VehicleDoorState = VehicleDoorState.Closed;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_BR_doorState: VehicleDoorState = VehicleDoorState.Closed;

@addField(VehicleComponent)
// This allows to only affect the vehicles that V has mounted (any seat)
public let m_hgyi56_EVS_vehicleUsedByV: Bool = false;

@addField(VehicleComponentPS)
// This allows to only affect the vehicles that V has mounted as driver
public persistent let m_hgyi56_EVS_vehicleDrivenByV: Bool = false;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_vehicleModel: CName;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_vehicleLongModel: CName;

@addField(VehicleComponent)
public let m_hgyi56_EVS_cycleEngineLastPressTime: Float = 0.00;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_hasWindows: Bool = false;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_hasCrystalDome: Bool = false;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_isSlidingDoors: Bool = false;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_isSingleFrontDoor: Bool = false;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_isPoliceVehicle: Bool = false;

@addField(VehicleComponentPS)
public persistent let m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow: Bool = false;

@addField(VehicleComponent)
public let m_hgyi56_EVS_vehicleDataPackage: wref<VehicleDataPackage_Record>;

@addField(VehicleComponent)
public let m_hgyi56_EVS_vehicleRecord: wref<Vehicle_Record>;

@addField(VehicleComponent)
public let m_hgyi56_EVS_AutoCloseDoors_OnStartMoving_State: Bool = true; // By default the vehicle is stationary

@addField(VehicleComponent)
public let m_hgyi56_EVS_vehicleMomentumType: EMomentumType = EMomentumType.Stable ; // By default the vehicle is stationary

@addField(VehicleComponent)
public let m_hgyi56_EVS_lastSpeed: Float = 0.00; // By default the vehicle is stationary

@addField(VehicleComponent)
public let m_hgyi56_EVS_brutalDeceleration: Bool = false;

@addField(VehicleComponent)
public let m_hgyi56_EVS_headlightsTimerIdentifier: Int32 = 0;

@addField(VehicleComponent)
public let m_hgyi56_EVS_minimalIntensity: Float = 0.05;

@addField(VehicleComponent)
public let m_hgyi56_EVS_colorFadeLatencyMultiplier: Float = 1.3;

@addField(VehicleComponent)
public let m_hgyi56_EVS_activeUtilityLightsEffectIdentifier: Int32 = 0;

@addField(VehicleComponent)
public let m_hgyi56_EVS_utilityLightsIsDefaultColor: Bool = true;

@addField(VehicleComponent)
public let m_hgyi56_EVS_utilityLightsIsDefaultIntensity: Bool = true;

@addField(VehicleComponent)
public let m_hgyi56_EVS_activeHeadlightsEffectIdentifier: Int32 = 0;

@addField(VehicleComponent)
public let m_hgyi56_EVS_headlightsIsDefaultColor: Bool = true;

@addField(VehicleComponent)
public let m_hgyi56_EVS_headlightsIsDefaultIntensity: Bool = true;

@addField(VehicleComponent)
public let m_hgyi56_EVS_activeTailLightsEffectIdentifier: Int32 = 0;

@addField(VehicleComponent)
public let m_hgyi56_EVS_tailLightsIsDefaultColor: Bool = true;

@addField(VehicleComponent)
public let m_hgyi56_EVS_tailLightsIsDefaultIntensity: Bool = true;

@addField(VehicleComponent)
public let m_hgyi56_EVS_activeBlinkerLightsEffectIdentifier: Int32 = 0;

@addField(VehicleComponent)
public let m_hgyi56_EVS_blinkerLightsIsDefaultColor: Bool = true;

@addField(VehicleComponent)
public let m_hgyi56_EVS_blinkerLightsIsDefaultIntensity: Bool = true;

@addField(VehicleComponent)
public let m_hgyi56_EVS_activeReverseLightsEffectIdentifier: Int32 = 0;

@addField(VehicleComponent)
public let m_hgyi56_EVS_reverseLightsIsDefaultColor: Bool = true;

@addField(VehicleComponent)
public let m_hgyi56_EVS_reverseLightsIsDefaultIntensity: Bool = true;

@addField(VehicleComponent)
public let m_hgyi56_EVS_activeInteriorLightsEffectIdentifier: Int32 = 0;

@addField(VehicleComponent)
public let m_hgyi56_EVS_roofLight_CycleIdentifier: Int32 = 0;

@addField(VehicleComponent)
public let m_hgyi56_EVS_interiorLightsIsDefaultColor: Bool = true;

@addField(VehicleComponent)
public let m_hgyi56_EVS_interiorLightsIsDefaultIntensity: Bool = true;

@addField(VehicleComponent)
public let m_hgyi56_EVS_reverseLightsUpdatedSinceLastReverse: Bool = false;

@addField(VehicleComponent)
public let m_hgyi56_EVS_headlightsSynchronizedWithTimeShallEnable: Bool = false;

@addField(VehicleComponent)
public let m_hgyi56_EVS_isHeadlightsCallStarted: Bool = false;

@addField(VehicleComponent)
public let m_hgyi56_EVS_isHeadlightsCallEnded: Bool = false;

@addField(VehicleComponent)
public let m_hgyi56_EVS_mountedSeats: array<MountingSlotId>;

@addField(VehicleComponentPS)
// 0 = side banner lights BLUE
// 1 = Roof lights ON + side banner lights RED
// 2 = Roof lights ON + side banner lights RED + Siren ON
public persistent let m_hgyi56_EVS_threeStatesSiren: Int32 = 0;

@addField(VehicleObject)
public let m_hgyi56_EVS_roofLightComponents: array<wref<vehicleLightComponent>>;

@addField(VehicleObject)
public let m_hgyi56_EVS_headlightsComponents: array<wref<vehicleLightComponent>>;

@addField(VehicleObject)
public let m_hgyi56_EVS_lightComponentsParameters: ref<inkHashMap>;

@addField(VehicleObject)
public let m_roofLight_TurnOnTime: Float;

@addField(VehicleDoorClose)
public let m_hgyi56_EVS_shouldOpenWindow: Bool = false;

@addField(VehicleDoorOpen)
public let m_hgyi56_EVS_shouldOpenWindow: Bool = false;

@addField(PlayerPuppetPS)
public persistent let m_hgyi56_EVS_customHeadlightsEnabled: Bool = true;

@addField(PlayerPuppetPS)
public persistent let m_hgyi56_EVS_customTailLightsEnabled: Bool = true;

@addField(PlayerPuppetPS)
public persistent let m_hgyi56_EVS_customUtilityLightsEnabled: Bool = true;

@addField(PlayerPuppetPS)
public persistent let m_hgyi56_EVS_customReverseLightsEnabled: Bool = true;

@addField(PlayerPuppetPS)
public persistent let m_hgyi56_EVS_customBlinkerLightsEnabled: Bool = true;

@addField(PlayerPuppetPS)
public persistent let m_hgyi56_EVS_customInteriorLightsEnabled: Bool = true;

@addField(PlayerPuppet)
public let m_hgyi56_EVS_customLightsAreBeingToggled: Bool = false; // False means that the player is modifying the ModSettings. True means that the player is toggling the custom lights settings

@addField(PlayerPuppetPS)
public persistent let m_hgyi56_EVS_drivenVehiclesID: [EntityID];

@addField(PlayerPuppet)
public let m_hgyi56_EVS_drivenVehicles: ref<inkHashMap>;

@addField(PlayerPuppet)
public let m_hgyi56_EVS_toggleCustomLightsLongInputTriggered: Bool = false;

@addField(PlayerPuppet)
public let m_hgyi56_EVS_toggleCustomLightsLastPressTime: Float = 0.00;

@addField(PlayerPuppet)
public let m_hgyi56_EVS_toggleCustomLightsStep: Int32 = 0;

@addField(PlayerPuppet)
private let m_hgyi56_EVS_inputListener: ref<GlobalInputListener>;

public class MultiTapLightsToggleEvent extends Event {
  let tapCount: Int32 = 0;
}

public class MultiTapCrystalCoatEvent extends Event {
  let tapCount: Int32 = 0;
}

public class MultiTapDoorEvent extends Event {
  let tapCount: Int32 = 0;
}

public class MultiTapWindowEvent extends Event {
  let tapCount: Int32 = 0;
}

public class MultiTapSpoilerEvent extends Event {
  let tapCount: Int32 = 0;
}

public class MultiTapDomeEvent extends Event {
  let tapCount: Int32 = 0;
}

public class MultiTapPoliceLightsEvent extends Event {
  let tapCount: Int32 = 0;
}

public class CrystalDomeMeshEvent extends Event {
  let tppEnabled: Bool = false;
}

public class SolidColorEffectEvent extends Event {
  let identifier: Int32 = 0;
  let lightType: vehicleELightType;
}

public class BlinkerEffectEvent extends Event {
  let identifier: Int32 = 0;
  let step: Int32 = 0;
  let lightType: vehicleELightType;
}

public class BeaconEffectEvent extends Event {
  let identifier: Int32 = 0;
  let step: Int32 = 0;
  let lightType: vehicleELightType;
}

public class PulseEffectEvent extends Event {
  let identifier: Int32 = 0;
  let step: Int32 = 0;
  let lightType: vehicleELightType;
}

public class TwoColorsCycleEffectEvent extends Event {
  let identifier: Int32 = 0;
  let step: Int32 = 0;
  let lightType: vehicleELightType;
}

public class RainbowEffectEvent extends Event {
  let identifier: Int32 = 0;
  let colorIndex: Int32;
  let lightType: vehicleELightType;
}

public class GameTimeElapsedEvent extends Event {
  let identifier: Int32 = 0;
}

public class PlayerIsAwayFromVehicleEvent extends Event {
  let hasBeenOutOfVehicleRange: Bool = false;
  let isVehicleSummoning: Bool = false;
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_IsCrystalCoatActive() -> Bool {
  return this.GetPS().GetIsVehicleVisualCustomizationActive() && !this.GetPS().GetIsVehicleVisualCustomizationBlockedByDamage();
}

@addMethod(VehicleComponent)
protected cb func hgyi56_EVS_OnMultiTapCrystalCoatEvent(evt: ref<MultiTapCrystalCoatEvent>) -> Bool {
  if evt.tapCount != this.m_hgyi56_EVS_cycleCrystalCoatStep {
    return false;
  }

  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = GetGameInstance();
  let player: ref<PlayerPuppet> = GetPlayer(gi);

  if !IsDefined(vehicle) {
    return false;
  }

  switch evt.tapCount {
    case 2:
      // Toggle on/off
      let vvcComponent: ref<vehicleVisualCustomizationComponent> = player.GetVehicleVisualCustomizationComponent();
      if !IsDefined(vvcComponent) {
        return false;
      }

      let definition: VehicleVisualCustomizationTemplate;
      vvcComponent.GetMyPS().GetAppliedCustomizationDataForVehicle(vehicle.GetRecordID(), definition);

      if this.hgyi56_EVS_IsCrystalCoatActive() {
        let evt: ref<NewVehicleVisualCustomizationEvent> = new NewVehicleVisualCustomizationEvent();
        evt.template = definition;
        evt.reset = true;
        vehicle.QueueEvent(evt);
      }
      else if VehicleVisualCustomizationTemplate.IsValid(this.GetPS().GetVehicleVisualCustomizationTemplate()) {
        let evt: ref<NewVehicleVisualCustomizationEvent> = new NewVehicleVisualCustomizationEvent();
        evt.template = definition;
        evt.reset = false;
        vehicle.QueueEvent(evt);
      }
      else {
        let event: ref<QuickSlotButtonHoldStartEvent> = new QuickSlotButtonHoldStartEvent();
        event.dPadItemDirection = EDPadSlot.VehicleVisualCustomization;
        player.QueueEvent(event);
      }
      break;

    case 3:
      // Toggle widget
      let event: ref<QuickSlotButtonHoldStartEvent> = new QuickSlotButtonHoldStartEvent();
      event.dPadItemDirection = EDPadSlot.VehicleVisualCustomization;
      player.QueueEvent(event);
      break;

    default:
      return false; // Don't toggle if user's choice is out of range
      break;
  }

  return true;
}

@addMethod(PlayerPuppet)
protected cb func hgyi56_EVS_OnMultiTapLightsToggleEvent(evt: ref<MultiTapLightsToggleEvent>) -> Bool {
  if !IsDefined(this.m_hgyi56_EVS_drivenVehicles) {
    return false;
  }

  if evt.tapCount != this.m_hgyi56_EVS_toggleCustomLightsStep {
    return false;
  }

  let lightType: vehicleELightType;

  switch evt.tapCount {
    case 1:
      lightType = vehicleELightType.Head;
      break;

    case 2:
      lightType = vehicleELightType.Brake;
      break;

    case 3:
      lightType = vehicleELightType.Utility;
      break;

    case 4:
      lightType = vehicleELightType.Blinkers;
      break;

    case 5:
      lightType = vehicleELightType.Reverse;
      break;

    case 6:
      lightType = vehicleELightType.Interior;
      break;

    default:
      return false; // Don't update lights if user's choice is out of range
      break;
  }

  this.hgyi56_EVS_SetLightsCustomSettingsEnabled(!this.hgyi56_EVS_GetLightsCustomSettingsEnabled(lightType), lightType);

  this.m_hgyi56_EVS_customLightsAreBeingToggled = true;
  let drivenVehicles: array<wref<IScriptable>>;
  this.m_hgyi56_EVS_drivenVehicles.GetValues(drivenVehicles);

  let i = 0;
  while i < ArraySize(drivenVehicles) {
    let vehComp: ref<VehicleComponent> = drivenVehicles[i] as VehicleComponent;

    if IsDefined(vehComp) {
      let vehicle: ref<VehicleObject> = vehComp.GetVehicle();

      if IsDefined(vehicle) {
        vehComp.hgyi56_EVS_OnModSettingsChange();
      }
    }

    i += 1;
  }
  this.m_hgyi56_EVS_customLightsAreBeingToggled = false;

  return true;
}

@addMethod(VehicleComponent)
protected cb func hgyi56_EVS_OnMultiTapDoorEvent(evt: ref<MultiTapDoorEvent>) -> Bool {
  if evt.tapCount != this.m_hgyi56_EVS_cycleDoorStep {
    return false;
  }

  // Ensure that the vehicle has enough controllable doors for user choice
  if evt.tapCount > this.GetPS().m_hgyi56_EVS_totalSeatSlots {
    return false;
  }

  // Some vehicles have a single front door for both sides
  if this.GetPS().m_hgyi56_EVS_isSingleFrontDoor {
    evt.tapCount = 1; // Redirect all doors actions to drivers door
  }

  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !IsDefined(vehicle) {
    return false;
  }

  let gi: GameInstance = GetGameInstance();
  let player: ref<PlayerPuppet> = GetPlayer(gi);

  let preventDoorClosingDuringCombat: Bool = this.GetPS().m_hgyi56_EVS_isDriverCombat && this.GetPS().m_hgyi56_EVS_isDriverCombatType_Doors;
  let preventWindowClosingDuringCombat: Bool = this.GetPS().m_hgyi56_EVS_isDriverCombat && !this.GetPS().m_hgyi56_EVS_isDriverCombatType_Doors;
  let playerSlotID: MountingSlotId = this.hgyi56_EVS_GetPlayerSlotID();

  // If the player is not mounted as driver, only allow sliding door to be opened
  if NotEquals(playerSlotID, VehicleComponent.GetDriverSlotID()) && !this.GetPS().m_hgyi56_EVS_isSlidingDoors {
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
      
    case VehicleComponent.hgyi56_EVS_GetBackLeftPassengerSlotID():
      evt.tapCount = 1;
      step1_VehicleDoor = EVehicleDoor.seat_back_left;
      step1_SlotID = playerSlotID;
      break;
      
    case VehicleComponent.hgyi56_EVS_GetBackRightPassengerSlotID():
      evt.tapCount = 1;
      step1_VehicleDoor = EVehicleDoor.seat_back_right;
      step1_SlotID = playerSlotID;
      break;
  }

  switch evt.tapCount {
    case 1:
      if !preventDoorClosingDuringCombat && Equals(this.GetPS().GetDoorState(step1_VehicleDoor), VehicleDoorState.Open) {
        VehicleComponent.CloseDoor(vehicle, step1_SlotID);
        this.GetPS().m_hgyi56_EVS_FL_doorState = VehicleDoorState.Closed;
        // FTLog(s"CloseDoor -> Memory FL set to \(this.GetPS().m_hgyi56_EVS_FL_doorState)");

        if this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow && IsDefined(this.GetPS().m_hgyi56_EVS_windowTimings) {
          if Equals(this.GetPS().m_hgyi56_EVS_FL_windowState, EVehicleWindowState.Open) {
            let event: ref<VehicleWindowOpen> = new VehicleWindowOpen();
            event.slotID = step1_SlotID.id;
            GameInstance.GetDelaySystem(gi).DelayPSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), event, this.GetPS().m_hgyi56_EVS_windowTimings.openTiming, true);
          }

          if this.GetPS().m_hgyi56_EVS_isSingleFrontDoor {
            if Equals(this.GetPS().m_hgyi56_EVS_FR_windowState, EVehicleWindowState.Open) {
              let event: ref<VehicleWindowOpen> = new VehicleWindowOpen();
              event.slotID = VehicleComponent.GetFrontPassengerSlotName();
              GameInstance.GetDelaySystem(gi).DelayPSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), event, this.GetPS().m_hgyi56_EVS_windowTimings.openTiming, true);
            }
          }
        }

        // DriverCombat modes:
        // - Doors: front doors need to be opened (like Rayfield Caliburn)
        // - Standard: front windows need to be open. However if doors type is Sliding Door (like Quadra V-Tech) then the user can still manipulate windows while doors are open only
        if preventWindowClosingDuringCombat {
          this.hgyi56_EVS_ForceFrontWindowsDuringCombat(VehicleDoorState.Closed, FR_doorState);
        }
      }
      else if !preventDoorClosingDuringCombat {
        // For some vehicles with sliding doors: if the window is opened we need to close it before we open the door because otherwise the window position will be weird once the sliding door is lift
        if this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow {
          if !this.GetPS().m_hgyi56_EVS_isDriverCombat || player.m_inMountedWeaponVehicle {
            this.GetPS().m_hgyi56_EVS_FL_windowState = this.GetPS().GetWindowState(step1_VehicleDoor);
          }

          if Equals(this.GetPS().GetWindowState(step1_VehicleDoor), EVehicleWindowState.Open) {
            VehicleComponent.ToggleVehicleWindow(gi, vehicle, step1_SlotID, false, n"Custom");
          }

          if this.GetPS().m_hgyi56_EVS_isSingleFrontDoor {
            if !this.GetPS().m_hgyi56_EVS_isDriverCombat || player.m_inMountedWeaponVehicle {
              this.GetPS().m_hgyi56_EVS_FR_windowState = this.GetPS().GetWindowState(EVehicleDoor.seat_front_right);
            }

            if Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_front_right), EVehicleWindowState.Open) {
              VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.GetFrontPassengerSlotID(), false, n"Custom");
            }
          }
        }
        
        VehicleComponent.OpenDoor(vehicle, step1_SlotID);
        this.GetPS().m_hgyi56_EVS_FL_doorState = VehicleDoorState.Open;
        // FTLog(s"OpenDoor -> Memory FL set to \(this.GetPS().m_hgyi56_EVS_FL_doorState)");

        // DriverCombat mode Standard: if doors type is Sliding Door (like Quadra V-Tech) then the user can still manipulate windows while doors are open only
        // If doors are hinged then windows will always stay opened during combat
        if preventWindowClosingDuringCombat && this.GetPS().m_hgyi56_EVS_isSlidingDoors {
          this.hgyi56_EVS_Recall_FL_WindowsState();
        }
      }
      break;

    case 2:
      if !preventDoorClosingDuringCombat && Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_right), VehicleDoorState.Open) {
        VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetFrontPassengerSlotID());
        this.GetPS().m_hgyi56_EVS_FR_doorState = VehicleDoorState.Closed;

        if this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow && IsDefined(this.GetPS().m_hgyi56_EVS_windowTimings) {
          if Equals(this.GetPS().m_hgyi56_EVS_FR_windowState, EVehicleWindowState.Open) {
            let event: ref<VehicleWindowOpen> = new VehicleWindowOpen();
            event.slotID = VehicleComponent.GetFrontPassengerSlotName();
            GameInstance.GetDelaySystem(gi).DelayPSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), event, this.GetPS().m_hgyi56_EVS_windowTimings.openTiming, true);
          }
        }

        // DriverCombat modes:
        // - Doors: front doors need to be opened (like Rayfield Caliburn)
        // - Standard: front windows need to be open. However if doors type is Sliding Door (like Quadra V-Tech) then the user can still manipulate windows while doors are open only
        if preventWindowClosingDuringCombat {
          this.hgyi56_EVS_ForceFrontWindowsDuringCombat(FL_doorState, VehicleDoorState.Closed);
        }
      }
      else if !preventDoorClosingDuringCombat {
        // For some vehicles with sliding doors: if the window is opened we need to close it before we open the door because otherwise the window position will be weird once the sliding door is lift
        if this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow {
          if !this.GetPS().m_hgyi56_EVS_isDriverCombat || player.m_inMountedWeaponVehicle {
            this.GetPS().m_hgyi56_EVS_FR_windowState = this.GetPS().GetWindowState(EVehicleDoor.seat_front_right);
          }
          
          if Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_front_right), EVehicleWindowState.Open) {
            VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.GetFrontPassengerSlotID(), false, n"Custom");
          }
        }
        VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetFrontPassengerSlotID());
        this.GetPS().m_hgyi56_EVS_FR_doorState = VehicleDoorState.Open;

        // DriverCombat mode Standard: if doors type is Sliding Door (like Quadra V-Tech) then the user can still manipulate windows while doors are open only
        // If doors are hinged then windows will always stay opened during combat
        if preventWindowClosingDuringCombat && this.GetPS().m_hgyi56_EVS_isSlidingDoors {
          this.hgyi56_EVS_Recall_FR_WindowsState();
        }
      }
      break;

    case 3:
      if Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_back_left), VehicleDoorState.Open) {
        VehicleComponent.CloseDoor(vehicle, VehicleComponent.hgyi56_EVS_GetBackLeftPassengerSlotID());
        this.GetPS().m_hgyi56_EVS_BL_doorState = VehicleDoorState.Closed;

        if this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow && IsDefined(this.GetPS().m_hgyi56_EVS_windowTimings) {
          if Equals(this.GetPS().m_hgyi56_EVS_BL_windowState, EVehicleWindowState.Open) {
            let event: ref<VehicleWindowOpen> = new VehicleWindowOpen();
            event.slotID = VehicleComponent.GetBackLeftPassengerSlotName();
            GameInstance.GetDelaySystem(gi).DelayPSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), event, this.GetPS().m_hgyi56_EVS_windowTimings.openTiming, true);
          }
        }
      }
      else {
        // For some vehicles with sliding doors: if the window is opened we need to close it before we open the door because otherwise the window position will be weird once the sliding door is lift
        if this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow {
          if !this.GetPS().m_hgyi56_EVS_isDriverCombat || player.m_inMountedWeaponVehicle {
            this.GetPS().m_hgyi56_EVS_BL_windowState = this.GetPS().GetWindowState(EVehicleDoor.seat_back_left);
          }
          
          if Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_back_left), EVehicleWindowState.Open) {
            VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.hgyi56_EVS_GetBackLeftPassengerSlotID(), false, n"Custom");
          }
        }
        VehicleComponent.OpenDoor(vehicle, VehicleComponent.hgyi56_EVS_GetBackLeftPassengerSlotID());
        this.GetPS().m_hgyi56_EVS_BL_doorState = VehicleDoorState.Open;
      }
      break;

    case 4:
      if Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_back_right), VehicleDoorState.Open) {
        VehicleComponent.CloseDoor(vehicle, VehicleComponent.hgyi56_EVS_GetBackRightPassengerSlotID());
        this.GetPS().m_hgyi56_EVS_BR_doorState = VehicleDoorState.Closed;

        if this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow && IsDefined(this.GetPS().m_hgyi56_EVS_windowTimings) {
          if Equals(this.GetPS().m_hgyi56_EVS_BR_windowState, EVehicleWindowState.Open) {
            let event: ref<VehicleWindowOpen> = new VehicleWindowOpen();
            event.slotID = VehicleComponent.GetBackRightPassengerSlotName();
            GameInstance.GetDelaySystem(gi).DelayPSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), event, this.GetPS().m_hgyi56_EVS_windowTimings.openTiming, true);
          }
        }
      }
      else {
        // For some vehicles with sliding doors: if the window is opened we need to close it before we open the door because otherwise the window position will be weird once the sliding door is lift
        if this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow {
          if !this.GetPS().m_hgyi56_EVS_isDriverCombat || player.m_inMountedWeaponVehicle {
            this.GetPS().m_hgyi56_EVS_BR_windowState = this.GetPS().GetWindowState(EVehicleDoor.seat_back_right);
          }
          
          if Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_back_right), EVehicleWindowState.Open) {
            VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.hgyi56_EVS_GetBackRightPassengerSlotID(), false, n"Custom");
          }
        }
        VehicleComponent.OpenDoor(vehicle, VehicleComponent.hgyi56_EVS_GetBackRightPassengerSlotID());
        this.GetPS().m_hgyi56_EVS_BR_doorState = VehicleDoorState.Open;
      }
      break;
  }

  return true;
}

@addMethod(VehicleComponent)
protected cb func hgyi56_EVS_OnMultiTapWindowEvent(evt: ref<MultiTapWindowEvent>) -> Bool {
  if evt.tapCount != this.m_hgyi56_EVS_cycleWindowStep {
    return false;
  }

  // Ensure that the vehicle has enough controllable windows for user choice
  if evt.tapCount > this.GetPS().m_hgyi56_EVS_totalSeatSlots {
    return false;
  }

  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !IsDefined(vehicle) {
    return false;
  }

  let gi: GameInstance = GetGameInstance();
  let preventWindowClosingDuringCombat: Bool = this.GetPS().m_hgyi56_EVS_isDriverCombat && !this.GetPS().m_hgyi56_EVS_isDriverCombatType_Doors;
  let playerSlotID: MountingSlotId = this.hgyi56_EVS_GetPlayerSlotID();

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

  if this.GetPS().m_hgyi56_EVS_isSingleFrontDoor {
    FR_doorState = step1_VehicleDoorState;
  }

  // If the player is mounted as a passenger then only allow him to toggle his own window
  // Redirect all multi-tap actions to the current player seat
  switch playerSlotID {
    case VehicleComponent.GetFrontPassengerSlotID():
      evt.tapCount = 1;
      step1_EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_front_right);
      step1_VehicleDoorState = this.GetPS().GetDoorState(EVehicleDoor.seat_front_right);
      step1_SlotID = playerSlotID;
      break;
      
    case VehicleComponent.hgyi56_EVS_GetBackLeftPassengerSlotID():
      evt.tapCount = 1;
      step1_EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_back_left);
      step1_VehicleDoorState = this.GetPS().GetDoorState(EVehicleDoor.seat_back_left);
      step1_SlotID = playerSlotID;
      break;
      
    case VehicleComponent.hgyi56_EVS_GetBackRightPassengerSlotID():
      evt.tapCount = 1;
      step1_EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_back_right);
      step1_VehicleDoorState = this.GetPS().GetDoorState(EVehicleDoor.seat_back_right);
      step1_SlotID = playerSlotID;
      break;
  }

  switch evt.tapCount {
    case 1:
      // Only opened sliding doors can still manipulate windows during combat
      if !preventWindowClosingDuringCombat || (this.GetPS().m_hgyi56_EVS_isSlidingDoors && Equals(step1_VehicleDoorState, VehicleDoorState.Open)) {
        if !this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow || Equals(step1_VehicleDoorState, VehicleDoorState.Closed) {
          VehicleComponent.ToggleVehicleWindow(gi, vehicle, step1_SlotID, Equals(step1_EVehicleWindowState, EVehicleWindowState.Open) ? false : true);

          // During DriverCombat mode: if the user manipulates window while sliding doors are open then remember these new states as the recall state
          this.GetPS().m_hgyi56_EVS_FL_windowState = Equals(step1_EVehicleWindowState, EVehicleWindowState.Open) ? EVehicleWindowState.Closed : EVehicleWindowState.Open;
        }
      }
      break;

    case 2:
      // Only opened sliding doors can still manipulate windows during combat
      if !preventWindowClosingDuringCombat || (this.GetPS().m_hgyi56_EVS_isSlidingDoors && Equals(FR_doorState, VehicleDoorState.Open)) {
        if !this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow || Equals(FR_doorState, VehicleDoorState.Closed) {
          VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.GetFrontPassengerSlotID(), Equals(FR_windowState, EVehicleWindowState.Open) ? false : true);
        
          // During DriverCombat mode: if the user manipulates window while sliding doors are open then remember these new states as the recall state
          this.GetPS().m_hgyi56_EVS_FR_windowState = Equals(FR_windowState, EVehicleWindowState.Open) ? EVehicleWindowState.Closed : EVehicleWindowState.Open;
        }
      }
      break;

    case 3:
      if !this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow || Equals(BL_doorState, VehicleDoorState.Closed) {
        VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.hgyi56_EVS_GetBackLeftPassengerSlotID(), Equals(BL_windowState, EVehicleWindowState.Open) ? false : true);
        this.GetPS().m_hgyi56_EVS_BL_windowState = Equals(BL_windowState, EVehicleWindowState.Open) ? EVehicleWindowState.Closed : EVehicleWindowState.Open;
      }
      break;

    case 4:
      if !this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow || Equals(BR_doorState, VehicleDoorState.Closed) {
        VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.hgyi56_EVS_GetBackRightPassengerSlotID(), Equals(BR_windowState, EVehicleWindowState.Open) ? false : true);
        this.GetPS().m_hgyi56_EVS_BR_windowState = Equals(BR_windowState, EVehicleWindowState.Open) ? EVehicleWindowState.Closed : EVehicleWindowState.Open;
      }
      break;
  }

  return true;
}

@addMethod(VehicleComponent)
protected cb func hgyi56_EVS_OnMultiTapSpoilerEvent(evt: ref<MultiTapSpoilerEvent>) -> Bool {
  if evt.tapCount != this.m_hgyi56_EVS_cycleSpoilerStep {
    return false;
  }

  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !IsDefined(vehicle) {
    return false;
  }

  switch evt.tapCount {
    case 1:
      if Equals(this.GetPS().GetDoorState(EVehicleDoor.hood), VehicleDoorState.Open) {
        VehicleComponent.CloseDoor(vehicle, VehicleComponent.hgyi56_EVS_GetHoodSlotID());
      }
      else {
        VehicleComponent.OpenDoor(vehicle, VehicleComponent.hgyi56_EVS_GetHoodSlotID());
      }
      break;

    case 2:
      if Equals(this.GetPS().GetDoorState(EVehicleDoor.trunk), VehicleDoorState.Open) {
        VehicleComponent.CloseDoor(vehicle, VehicleComponent.hgyi56_EVS_GetTrunkSlotID());
      }
      else {
        VehicleComponent.OpenDoor(vehicle, VehicleComponent.hgyi56_EVS_GetTrunkSlotID());
      }
      break;

    case 3:
      this.hgyi56_EVS_ToggleSpoiler(!this.GetPS().m_hgyi56_EVS_spoilerState);
      break;
  }
  
  return true;
}

@addMethod(VehicleComponent)
protected cb func hgyi56_EVS_OnMultiTapDomeEvent(evt: ref<MultiTapDomeEvent>) -> Bool {
  if evt.tapCount != this.m_hgyi56_EVS_cycleDomeStep {
    return false;
  }

  switch evt.tapCount {
    case 1:
      this.hgyi56_EVS_ToggleRoofLight(!this.GetPS().m_hgyi56_EVS_roofLightState);
      break;

    case 2:
      this.hgyi56_EVS_ToggleInteriorLights(!this.GetPS().m_hgyi56_EVS_interiorLightsState);
      break;
  }
  
  return true;
}

@addMethod(VehicleComponent)
protected cb func hgyi56_EVS_OnMultiTapPoliceLightsEvent(evt: ref<MultiTapPoliceLightsEvent>) -> Bool {
  if evt.tapCount != this.m_hgyi56_EVS_cyclePoliceSirenStep {
    return false;
  }

  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = GetGameInstance();
  
  if !IsDefined(vehicle) {
    return false;
  }
  
  switch evt.tapCount {
    case 1: // Toggle police lights
      switch this.GetPS().m_hgyi56_EVS_threeStatesSiren {
        case 0:
          this.GetPS().m_hgyi56_EVS_threeStatesSiren = 1;

          // Lights ON (internal game siren state is ON)
          this.ToggleSiren(true, false);
          break;

        case 1:
          this.GetPS().m_hgyi56_EVS_threeStatesSiren = 0;

          // All OFF (internal game siren state is OFF)
          this.ToggleSiren(false, false);
          
          if vehicle == (vehicle as BikeObject)
          && MyModSettings.Get(gi).policeBikeSirenEnabled() {
            GameInstance.GetAudioSystem(gi).Stop(n"v_car_villefort_cortes_police_siren_start", vehicle.GetEntityID(), n"vehicle_engine_emitter");
          }
          break;

        case 2:
          this.GetPS().m_hgyi56_EVS_threeStatesSiren = 1;

          // Siren OFF
          this.GetPS().SetSirenSoundsState(false);
          vehicle.ToggleSiren(false);
          
          if vehicle == (vehicle as BikeObject)
          && MyModSettings.Get(gi).policeBikeSirenEnabled() {
            GameInstance.GetAudioSystem(gi).Stop(n"v_car_villefort_cortes_police_siren_start", vehicle.GetEntityID(), n"vehicle_engine_emitter");
          }
          break;
      }
      break;

    case 2: // Toggle police siren
      if vehicle == (vehicle as BikeObject)
      && !MyModSettings.Get(gi).policeBikeSirenEnabled() {
        return true;
      }

      switch this.GetPS().m_hgyi56_EVS_threeStatesSiren {
        case 0:
          this.GetPS().m_hgyi56_EVS_threeStatesSiren = 2;

          // Lights + Siren ON (internal game siren state is ON)
          this.ToggleSiren(true, true);

          if vehicle == (vehicle as BikeObject)
          && MyModSettings.Get(gi).policeBikeSirenEnabled() {
            GameInstance.GetAudioSystem(gi).PlayOnEmitter(n"v_car_villefort_cortes_police_siren_start", vehicle.GetEntityID(), n"vehicle_engine_emitter");
          }
          break;

        case 1:
          this.GetPS().m_hgyi56_EVS_threeStatesSiren = 2;

          // Siren ON (internal game siren state is ON)
          this.GetPS().SetSirenSoundsState(true);
          vehicle.ToggleSiren(true);

          if vehicle == (vehicle as BikeObject)
          && MyModSettings.Get(gi).policeBikeSirenEnabled() {
            GameInstance.GetAudioSystem(gi).PlayOnEmitter(n"v_car_villefort_cortes_police_siren_start", vehicle.GetEntityID(), n"vehicle_engine_emitter");
          }
          break;

        case 2:
          this.GetPS().m_hgyi56_EVS_threeStatesSiren = 0;

          // All OFF (internal game siren state is OFF)
          this.ToggleSiren(false, false);
          
          if vehicle == (vehicle as BikeObject)
          && MyModSettings.Get(gi).policeBikeSirenEnabled() {
            GameInstance.GetAudioSystem(gi).Stop(n"v_car_villefort_cortes_police_siren_start", vehicle.GetEntityID(), n"vehicle_engine_emitter");
          }
          break;
      }
      break;

    case 3: // Police signal
      if Utils.AudiowareIsInstalled() && Utils.PoliceSirenAsHornIsInstalled() {
        // FTLog("Police signal triggered");
        GameInstance.GetAudioSystem(gi).Play(n"hgyi56_police_signal", vehicle.GetEntityID());
        vehicle.GetStimBroadcasterComponent().TriggerSingleBroadcast(vehicle, gamedataStimType.VehicleHorn);
      }
      break;
  }

  return true;
}

@addMethod(VehicleComponent)
protected cb func hgyi56_EVS_OnCrystalDomeMeshEvent(evt: ref<CrystalDomeMeshEvent>) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  
  if !IsDefined(vehicle) {
    return false;
  }

  let animFeature: ref<AnimFeature_VehicleState> = new AnimFeature_VehicleState();
  animFeature.tppEnabled = evt.tppEnabled && !vehicle.GetCameraManager().IsTPPActive();
  AnimationControllerComponent.ApplyFeatureToReplicate(vehicle, n"VehicleState", animFeature);
  this.TogglePanzerShadowMeshes(evt.tppEnabled);
}

@addMethod(VehicleComponent)
protected cb func hgyi56_EVS_OnSolidColorEffectEvent(evt: ref<SolidColorEffectEvent>) -> Bool {
  let activeEffectIdentifier: Int32 = this.hgyi56_EVS_GetActiveEffectIdentifier(evt.lightType);

  if activeEffectIdentifier != evt.identifier {
    return false;
  }

  // FTLog(s"[SolidEffect \(evt.lightType)Light \(evt.identifier)] \(this.GetPS().m_hgyi56_EVS_vehicleModel)");

  this.hgyi56_EVS_ApplyLightsParameters(false, false, false, evt.lightType);

  return true;
}

@addMethod(VehicleComponent)
protected cb func hgyi56_EVS_OnBlinkerEffectEvent(evt: ref<BlinkerEffectEvent>) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = GetGameInstance();
  let activeEffectIdentifier: Int32 = this.hgyi56_EVS_GetActiveEffectIdentifier(evt.lightType);
  let sequenceSpeed: Float = this.hgyi56_EVS_GetLightsSequenceSpeed(evt.lightType);

  if !IsDefined(vehicle) {
    return false;
  }

  if activeEffectIdentifier != evt.identifier {
    return false;
  }

  // FTLog(s"[BlinkerEffect \(evt.lightType)Light \(evt.identifier)] \(this.GetPS().m_hgyi56_EVS_vehicleModel)");

  switch evt.step {
    case 0:
      // Instant color
      this.hgyi56_EVS_ApplyLightsParameters(true, false, false, evt.lightType);

      let event: ref<BlinkerEffectEvent> = new BlinkerEffectEvent();
      event.identifier = evt.identifier;
      event.step = 1;
      event.lightType = evt.lightType;
      GameInstance.GetDelaySystem(gi).DelayEvent(vehicle, event, sequenceSpeed, true);
      break;
      
    case 1:
      // Black color
      this.hgyi56_EVS_ApplyLightsParameters(true, false, true, evt.lightType, this.hgyi56_EVS_GetBlackColor());

      let event: ref<BlinkerEffectEvent> = new BlinkerEffectEvent();
      event.identifier = evt.identifier;
      event.step = 0;
      event.lightType = evt.lightType;
      GameInstance.GetDelaySystem(gi).DelayEvent(vehicle, event, sequenceSpeed, true);
      break;
  }

  return true;
}

@addMethod(VehicleComponent)
protected cb func hgyi56_EVS_OnBeaconEffectEvent(evt: ref<BeaconEffectEvent>) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = GetGameInstance();
  let beaconDelay: Float = 0.10;
  let activeEffectIdentifier: Int32 = this.hgyi56_EVS_GetActiveEffectIdentifier(evt.lightType);
  let sequenceSpeed: Float = this.hgyi56_EVS_GetLightsSequenceSpeed(evt.lightType);

  if !IsDefined(vehicle) {
    return false;
  }

  if activeEffectIdentifier != evt.identifier {
    return false;
  }

  // FTLog(s"[BeaconEffect \(evt.lightType)Light \(evt.identifier)] \(this.GetPS().m_hgyi56_EVS_vehicleModel)");

  switch evt.step {
    case 0:
      // Instant color
      this.hgyi56_EVS_ApplyLightsParameters(true, false, false, evt.lightType);

      let event: ref<BeaconEffectEvent> = new BeaconEffectEvent();
      event.identifier = evt.identifier;
      event.step = 1;
      event.lightType = evt.lightType;
      GameInstance.GetDelaySystem(gi).DelayEvent(vehicle, event, beaconDelay, true);
      break;
      
    case 1:
      // Black color
      this.hgyi56_EVS_ApplyLightsParameters(true, false, true, evt.lightType, this.hgyi56_EVS_GetBlackColor());

      let event: ref<BeaconEffectEvent> = new BeaconEffectEvent();
      event.identifier = evt.identifier;
      event.step = 2;
      event.lightType = evt.lightType;
      GameInstance.GetDelaySystem(gi).DelayEvent(vehicle, event, beaconDelay, true);
      break;
      
    case 2:
      // Instant color
      this.hgyi56_EVS_ApplyLightsParameters(true, false, false, evt.lightType);

      let event: ref<BeaconEffectEvent> = new BeaconEffectEvent();
      event.identifier = evt.identifier;
      event.step = 3;
      event.lightType = evt.lightType;
      GameInstance.GetDelaySystem(gi).DelayEvent(vehicle, event, beaconDelay, true);
      break;
      
    case 3:
      // Black color
      this.hgyi56_EVS_ApplyLightsParameters(true, false, true, evt.lightType, this.hgyi56_EVS_GetBlackColor());

      let event: ref<BeaconEffectEvent> = new BeaconEffectEvent();
      event.identifier = evt.identifier;
      event.step = 0;
      event.lightType = evt.lightType;
      GameInstance.GetDelaySystem(gi).DelayEvent(vehicle, event, sequenceSpeed, true);
      break;
  }

  return true;
}

@addMethod(VehicleComponent)
protected cb func hgyi56_EVS_OnPulseEffectEvent(evt: ref<PulseEffectEvent>) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = GetGameInstance();
  let activeEffectIdentifier: Int32 = this.hgyi56_EVS_GetActiveEffectIdentifier(evt.lightType);
  let sequenceSpeed: Float = this.hgyi56_EVS_GetLightsSequenceSpeed(evt.lightType);

  if !IsDefined(vehicle) {
    return false;
  }

  if activeEffectIdentifier != evt.identifier {
    return false;
  }

  // FTLog(s"[PulseEffect \(evt.lightType)Light \(evt.identifier)] \(this.GetPS().m_hgyi56_EVS_vehicleModel)");

  switch evt.step {
    case 0:
      // Fade to color
      this.hgyi56_EVS_ApplyLightsParameters(false, false, false, evt.lightType);

      let event: ref<PulseEffectEvent> = new PulseEffectEvent();
      event.identifier = evt.identifier;
      event.step = 1;
      event.lightType = evt.lightType;
      GameInstance.GetDelaySystem(gi).DelayEvent(vehicle, event, sequenceSpeed, true);
      break;
      
    case 1:
      // Fade to color minimum
      this.hgyi56_EVS_ApplyLightsParameters(false, true, false, evt.lightType);

      let event: ref<PulseEffectEvent> = new PulseEffectEvent();
      event.identifier = evt.identifier;
      event.step = 0;
      event.lightType = evt.lightType;
      GameInstance.GetDelaySystem(gi).DelayEvent(vehicle, event, sequenceSpeed, true);
      break;
  }

  return true;
}

@addMethod(VehicleComponent)
protected cb func hgyi56_EVS_OnTwoColorsCycleEffectEvent(evt: ref<TwoColorsCycleEffectEvent>) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = GetGameInstance();
  let activeEffectIdentifier: Int32 = this.hgyi56_EVS_GetActiveEffectIdentifier(evt.lightType);
  let sequenceSpeed: Float = this.hgyi56_EVS_GetLightsSequenceSpeed(evt.lightType);

  if !IsDefined(vehicle) {
    return false;
  }

  if activeEffectIdentifier != evt.identifier {
    return false;
  }

  // FTLog(s"[TwoColorsCycleEffect \(evt.lightType)Light \(evt.identifier)] \(this.GetPS().m_hgyi56_EVS_vehicleModel)");

  switch evt.step {
    case 0:
      // Fade to custom color
      this.hgyi56_EVS_ApplyLightsParameters(false, false, false, evt.lightType);

      let event: ref<TwoColorsCycleEffectEvent> = new TwoColorsCycleEffectEvent();
      event.identifier = evt.identifier;
      event.step = 1;
      event.lightType = evt.lightType;
      GameInstance.GetDelaySystem(gi).DelayEvent(vehicle, event, sequenceSpeed * this.m_hgyi56_EVS_colorFadeLatencyMultiplier, true);
      break;
      
    case 1:
      // Fade to cycle color
      this.hgyi56_EVS_ApplyLightsParameters(false, false, false, evt.lightType, this.hgyi56_EVS_GetLightsCycleColor(evt.lightType));

      let event: ref<TwoColorsCycleEffectEvent> = new TwoColorsCycleEffectEvent();
      event.identifier = evt.identifier;
      event.step = 0;
      event.lightType = evt.lightType;
      GameInstance.GetDelaySystem(gi).DelayEvent(vehicle, event, sequenceSpeed * this.m_hgyi56_EVS_colorFadeLatencyMultiplier, true);
      break;
  }

  return true;
}

@addMethod(VehicleComponent)
protected cb func hgyi56_EVS_OnRainbowEffectEvent(evt: ref<RainbowEffectEvent>) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = GetGameInstance();
  let vehData: ref<VehicleData> = VehicleData.Get(gi);
  let activeEffectIdentifier: Int32 = this.hgyi56_EVS_GetActiveEffectIdentifier(evt.lightType);
  let sequenceSpeed: Float = this.hgyi56_EVS_GetLightsSequenceSpeed(evt.lightType);

  if !IsDefined(vehicle) || !IsDefined(vehData) {
    return false;
  }

  if activeEffectIdentifier != evt.identifier {
    return false;
  }

  // FTLog(s"[RainbowEffect \(evt.lightType)Light \(evt.identifier)] \(this.GetPS().m_hgyi56_EVS_vehicleModel)");

  let rainbowColor: Color = this.hgyi56_EVS_ToColor(vehData.rainbowColors[evt.colorIndex]);

  this.hgyi56_EVS_ApplyLightsParameters(false, false, false, evt.lightType, rainbowColor);

  let event: ref<RainbowEffectEvent> = new RainbowEffectEvent();
  event.identifier = evt.identifier;
  event.colorIndex = evt.colorIndex == 6 ? 0 : evt.colorIndex + 1;
  event.lightType = evt.lightType;
  GameInstance.GetDelaySystem(gi).DelayEvent(vehicle, event, sequenceSpeed * this.m_hgyi56_EVS_colorFadeLatencyMultiplier, true);

  return true;
}

@addMethod(VehicleComponent)
protected cb func hgyi56_EVS_OnGameTimeElapsedEvent(evt: ref<GameTimeElapsedEvent>) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = GetGameInstance();
  let settings: ref<MyModSettings> = MyModSettings.Get(GetGameInstance());

  if !IsDefined(vehicle) {
    return false;
  }

  if this.m_hgyi56_EVS_headlightsTimerIdentifier != evt.identifier {
    return false;
  }
  
  if !this.GetPS().m_hgyi56_EVS_powerState || !this.GetPS().m_hgyi56_EVS_vehicleDrivenByV || !settings.headlightsSynchronizedWithTimeEnabled() {
    return false;
  }

  let historyTime: GameTime = GameInstance.GetTimeSystem(gi).GetGameTime();

  let turnOnTime: GameTime = GameTime.MakeGameTime(0, settings.headlightsTurnOnHour(), settings.headlightsTurnOnMinute(), 0);
  let turnOffTime: GameTime = GameTime.MakeGameTime(0, settings.headlightsTurnOffHour(), settings.headlightsTurnOffMinute(), 0);

  let now: GameTime = GameTime.MakeGameTime(0, GameTime.Hours(historyTime), GameTime.Minutes(historyTime), GameTime.Seconds(historyTime));
  
  let toggle: Bool = false;

  // We cannot know if turnOn and turnOff times will be used in a realistic way (turnOn ~ sunset, turnOff ~ sunrise) so we must check which is after the other
  if this.hgyi56_EVS_IsAfter(now, turnOnTime) {    
    if this.hgyi56_EVS_IsAfter(now, turnOffTime) {
      if this.hgyi56_EVS_IsAfter(turnOnTime, turnOffTime) {
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
    if this.hgyi56_EVS_IsAfter(now, turnOffTime) {
      toggle = false;
    }
    else {
      if this.hgyi56_EVS_IsAfter(turnOnTime, turnOffTime) {
        toggle = true;
      }
      else {
        toggle = false;
      }
    }
  }

  this.m_hgyi56_EVS_headlightsSynchronizedWithTimeShallEnable = toggle;

  // FTLog(s"[HeadlightsWithTime \(evt.identifier)] \(this.GetPS().m_hgyi56_EVS_vehicleModel) \(this.hgyi56_EVS_GameTimeToString(now)) -> shall turn \(toggle ? "ON" : "OFF")");

  // Only force toggle to apply if the power is on and V has driven that vehicle and we are currently close to the turn ON/OFF time
  if this.hgyi56_EVS_GameTimeEquals(now, turnOnTime) || this.hgyi56_EVS_GameTimeEquals(now, turnOffTime) {
    this.hgyi56_EVS_UpdateHeadlightsWithTimeSync();

    this.hgyi56_EVS_ApplyHeadlightsModeWithShutOff();
    this.hgyi56_EVS_ApplyUtilityLightsWithShutOff();
  }

  let event: ref<GameTimeElapsedEvent> = new GameTimeElapsedEvent();
  event.identifier = evt.identifier;
  GameInstance.GetDelaySystem(gi).DelayEvent(vehicle, event, 1.00, true);

  return true;
}

@addMethod(VehicleComponent)
protected cb func hgyi56_EVS_OnPlayerIsAwayFromVehicleEvent(evt: ref<PlayerIsAwayFromVehicleEvent>) -> Bool {
  let gi: GameInstance = GetGameInstance();
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let player: ref<PlayerPuppet> = GetPlayer(gi);

  if !IsDefined(vehicle) {
    return false;
  }
  
  let enableDistance: Float = 400.0; // Meters
  let distancePlayerVehicle: Float = Vector4.DistanceSquared(player.GetWorldPosition(), vehicle.GetWorldPosition()) * 0.3048; // Base unit is feet

  // FTLog(s"\(this.GetPS().m_hgyi56_EVS_vehicleModel) -> player is \(distancePlayerVehicle) meters away");

  // If player gets too far away from a vehicle, its crystal dome will become off even if its state is still on (seems to be triggered from inside the native code).
  // To restore its ON state we wait for V to get close enough to the vehicle again with this looping event
  if distancePlayerVehicle <= enableDistance {
    if evt.hasBeenOutOfVehicleRange {
      // Handle crystal dome state
      if evt.isVehicleSummoning {
        this.ToggleCrystalDome(true, true, true);
      }
      else {
        this.hgyi56_EVS_EnsureIsActive_CrystalDome();
      }

      // Handle crystal dome mesh
      let animFeature: ref<AnimFeature_VehicleState> = new AnimFeature_VehicleState();
      animFeature.tppEnabled = false;
      AnimationControllerComponent.ApplyFeatureToReplicate(vehicle, n"VehicleState", animFeature);

      evt.hasBeenOutOfVehicleRange = false;
    }
  }
  else { // Wait for player to get out of defined range to enable crystal dome reactivation
    evt.hasBeenOutOfVehicleRange = true;
  }
  
  // Loop event only if the player is not mounted into the vehicle
  if !VehicleComponent.IsMountedToProvidedVehicle(gi, player.GetEntityID(), vehicle) {
    let event: ref<PlayerIsAwayFromVehicleEvent> = new PlayerIsAwayFromVehicleEvent();
    event.hasBeenOutOfVehicleRange = evt.hasBeenOutOfVehicleRange;
    event.isVehicleSummoning = evt.isVehicleSummoning;
    GameInstance.GetDelaySystem(gi).DelayEvent(vehicle, event, 1.00, true);

    return false;
  }
  
  return true;
}

@wrapMethod(VehicleComponent)
private final func RegisterInputListener() -> Void {
  if this.hgyi56_EVS_IsUnsupportedVehicleType() {
    wrappedMethod();
    return;
  }

  let player: ref<PlayerPuppet> = GetPlayer(GetGameInstance());

  wrappedMethod();

  // // // // // // //
  // Register additional events we need
  //
  player.RegisterInputListener(this, n"CameraX");
  player.RegisterInputListener(this, n"CameraY");
  player.RegisterInputListener(this, n"CameraMouseX");
  player.RegisterInputListener(this, n"CameraMouseY");

  player.RegisterInputListener(this, n"CycleDoor");
  player.RegisterInputListener(this, n"CycleWindow");

  player.RegisterInputListener(this, n"CycleEngineStep1");
  player.RegisterInputListener(this, n"CycleEngineStep2");

  player.RegisterInputListener(this, n"Exit");
  player.RegisterInputListener(this, n"CycleDome");
  player.RegisterInputListener(this, n"CycleSpoiler");

  player.RegisterInputListener(this, n"HeadlightsCall");
  player.RegisterInputListener(this, n"ModdedCycleLights");
  player.RegisterInputListener(this, n"CycleLights"); // Prevent police lights to be cycled when toggling headlights

  player.RegisterInputListener(this, n"Accelerate");
  player.RegisterInputListener(this, n"Decelerate");
  
  player.RegisterInputListener(this, n"VehicleVisualCustomization");
  // // // // // // //
}

@replaceMethod(VehicleComponent)
protected cb func OnAction(action: ListenerAction, consumer: ListenerActionConsumer) -> Bool {
  let cycleEvent: ref<UIVehicleRadioCycleEvent>;
  let radioEvent: ref<VehicleRadioEvent>;
  let releaseTime: Float;
  let sirenState: Bool;
  let toggleEvent: ref<RadioToggleEvent>;
  let vehicle: ref<VehicleObject>;
  if this.GetPS().GetIsDestroyed() {
    return false;
  };
  vehicle = this.GetVehicle();
  if !IsDefined(vehicle) {
    return false;
  };
  //////////////////////
  let gi: GameInstance = vehicle.GetGame();
  //////////////////////
  if Equals(ListenerAction.GetName(action), n"VehicleInsideWheel") {
    if !StatusEffectSystem.ObjectHasStatusEffectWithTag(vehicle, n"VehicleBlockRadioInput") && this.IsRadioEnabled(vehicle.GetGame()) {
      if ListenerAction.IsButtonJustPressed(action) {
        this.m_radioPressTime = EngineTime.ToFloat(GameInstance.GetEngineTime(vehicle.GetGame()));
      };
      if ListenerAction.IsButtonJustReleased(action) {
        releaseTime = EngineTime.ToFloat(GameInstance.GetEngineTime(vehicle.GetGame()));
        if releaseTime <= this.m_radioPressTime + 0.20 {
          if this.ShouldCycle() {
            radioEvent = new VehicleRadioEvent();
            radioEvent.toggle = true;
            vehicle.QueueEvent(radioEvent);
            if vehicle.IsRadioReceiverActive() {
              cycleEvent = new UIVehicleRadioCycleEvent();
              GameInstance.GetUISystem(vehicle.GetGame()).QueueEvent(cycleEvent);
            };
            if IsDefined(this.m_mountedPlayer) {
              this.m_mountedPlayer.QueueEvent(radioEvent);
            };
          } else {
            toggleEvent = new RadioToggleEvent();
            vehicle.QueueEvent(toggleEvent);
            if IsDefined(this.m_mountedPlayer) {
              this.m_mountedPlayer.QueueEvent(toggleEvent);
            };
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

  
  
  if this.hgyi56_EVS_IsUnsupportedVehicleType() {
    return false;
  }

  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = GetGameInstance();
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gi).GetLocalPlayerMainGameObject() as PlayerPuppet;

  if !IsDefined(vehicle) {
    return false;
  };

  if VehicleComponent.IsMountedToProvidedVehicle(gi, player.GetEntityID(), vehicle) {
    // // // // // // //
    // Event that toggles police siren/lights
    // 1 : toggle police light
    // 2 : toggle police siren
    //
    // Multi-tap
    //
    if this.GetPS().m_hgyi56_EVS_isPoliceVehicle 
    && Equals(ListenerAction.GetName(action), n"VehicleSiren") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_RELEASED) {

      if !this.m_hgyi56_EVS_cyclePoliceSirenLongInputTriggered {
        // If the last press time is older than "MyModSettings.Get(GetGameInstance()).multiTapTimeWindow()" consider this is a new sequence
        if Utils.GetCurrentTime(gi) - this.m_hgyi56_EVS_cyclePoliceSirenLastPressTime > MyModSettings.Get(GetGameInstance()).multiTapTimeWindow() {
          this.m_hgyi56_EVS_cyclePoliceSirenStep = 0;
        }

        this.m_hgyi56_EVS_cyclePoliceSirenLastPressTime = Utils.GetCurrentTime(gi);
        this.m_hgyi56_EVS_cyclePoliceSirenStep += 1;

        let event: ref<MultiTapPoliceLightsEvent> = new MultiTapPoliceLightsEvent();
        event.tapCount = this.m_hgyi56_EVS_cyclePoliceSirenStep;
        GameInstance.GetDelaySystem(gi).DelayEvent(vehicle, event, MyModSettings.Get(GetGameInstance()).multiTapTimeWindow(), false);
      }

      this.m_hgyi56_EVS_cyclePoliceSirenLongInputTriggered = false;
    }
    // // // // // // //

    // // // // // // //
    // Hold: cycle headlights, prevent to trigger police lights
    //
    if Equals(ListenerAction.GetName(action), n"CycleLights") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) {
      this.m_hgyi56_EVS_cyclePoliceSirenLongInputTriggered = true;
    }
    // // // // // // //

    // // // // // // //
    // Event that toggles utility/auxiliary lights (short press)
    //
    // Short press: toggle utility lights
    //
    if !this.GetPS().m_hgyi56_EVS_isPoliceVehicle {
      if Equals(ListenerAction.GetName(action), n"ModdedCycleLights") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_PRESSED) {
        this.m_hgyi56_EVS_cycleLightsPressTime = Utils.GetCurrentTime(gi);
      }
      if Equals(ListenerAction.GetName(action), n"ModdedCycleLights") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_RELEASED) {
        let holdTime: Float = Utils.GetCurrentTime(gi) - this.m_hgyi56_EVS_cycleLightsPressTime;

        if !this.m_hgyi56_EVS_cycleLightsLongInputTriggered && holdTime >= MyModSettings.Get(GetGameInstance()).cycleUtilityLightsHoldTime() && this.m_useAuxiliary && !this.GetPS().m_hgyi56_EVS_isPoliceVehicle {

          // If the headlights shutoff is active and the player toggles headlights then simply disable the headlights shutoff
          if this.GetPS().m_hgyi56_EVS_temporaryHeadlightsShutOff && MyModSettings.Get(GetGameInstance()).utilityLightsSynchronizedWithHeadlightsShutoff() {
            this.hgyi56_EVS_ToggleHeadlightsShutoff(false);
          }
          else {
            this.hgyi56_EVS_ToggleUtilityLights(!this.GetPS().m_hgyi56_EVS_auxiliaryState);
          }

          this.hgyi56_EVS_ApplyHeadlightsModeWithShutOff();
          this.hgyi56_EVS_EnsureIsActive_UtilityLights();
          this.hgyi56_EVS_EnsureIsDisabled_UtilityLights();
        }

        this.m_hgyi56_EVS_cycleLightsLongInputTriggered = false;
      }
    }
    // // // // // // //

    // // // // // // //
    // Hold: cycle headlights mode
    //
    if Equals(ListenerAction.GetName(action), n"ModdedCycleLights") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) {
      this.m_hgyi56_EVS_cycleLightsLongInputTriggered = true;

      // If the headlights shutoff is active and the player toggles headlights then simply disable the headlights shutoff
      if this.GetPS().m_hgyi56_EVS_temporaryHeadlightsShutOff {
        this.hgyi56_EVS_ToggleHeadlightsShutoff(false);
      }
      else { // Otherwise, cycle the headlights mode
        if Equals(this.GetPS().m_hgyi56_EVS_currentHeadlightsState, vehicleELightMode.Off) {
              this.GetPS().m_hgyi56_EVS_currentHeadlightsState = vehicleELightMode.On;
          }
          else if Equals(this.GetPS().m_hgyi56_EVS_currentHeadlightsState, vehicleELightMode.On) {
              this.GetPS().m_hgyi56_EVS_currentHeadlightsState = vehicleELightMode.HighBeams;
          }
          else {
              this.GetPS().m_hgyi56_EVS_currentHeadlightsState = vehicleELightMode.Off;
          }
      }
      
      this.hgyi56_EVS_ApplyHeadlightsMode();
      this.hgyi56_EVS_EnsureIsActive_UtilityLights();
      this.hgyi56_EVS_EnsureIsDisabled_UtilityLights();
    }
    // // // // // // //

    // // // // // // //
    // Event that triggers headlights calls
    //
    // Short press: headlights calls
    //
    if Equals(ListenerAction.GetName(action), n"HeadlightsCall") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_PRESSED) {
      this.m_hgyi56_EVS_isHeadlightsCallStarted = true;

      for lightComp in this.GetVehicle().m_hgyi56_EVS_headlightsComponents {
        lightComp.turnOnTime = 0;
        lightComp.turnOffTime = 0;
        lightComp.turnOnCurve = n"None";
        lightComp.turnOffCurve = n"None";
      }

      this.GetVehicleControllerPS().SetHeadLightMode(vehicleELightMode.HighBeams);
    }
    else if Equals(ListenerAction.GetName(action), n"HeadlightsCall") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_RELEASED) {
      this.m_hgyi56_EVS_isHeadlightsCallEnded = true;
      this.hgyi56_EVS_ApplyHeadlightsModeWithShutOff();
    }
    // // // // // // //

    // All user actions that cannot work on motorbikes
    if vehicle != (vehicle as BikeObject) {
      // // // // // // //
      // Listen to the Exit user input so we can save doors state before the vehicle modifies them
      if Equals(ListenerAction.GetName(action), n"Exit") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) {
        // Remember current doors state so when the player has finished unmounting we can restore the doors state
        this.GetPS().m_hgyi56_EVS_FL_doorState = this.GetPS().GetDoorState(EVehicleDoor.seat_front_left);
        this.GetPS().m_hgyi56_EVS_FR_doorState = this.GetPS().m_hgyi56_EVS_isSingleFrontDoor ? this.GetPS().m_hgyi56_EVS_FL_doorState : this.GetPS().GetDoorState(EVehicleDoor.seat_front_right);
        this.GetPS().m_hgyi56_EVS_BL_doorState = this.GetPS().GetDoorState(EVehicleDoor.seat_back_left);
        this.GetPS().m_hgyi56_EVS_BR_doorState = this.GetPS().GetDoorState(EVehicleDoor.seat_back_right);
        // FTLog(s"Exit -> Memory FL set to \(this.GetPS().m_hgyi56_EVS_FL_doorState)");
        // FTLog(s"Exit -> Memory FR set to \(this.GetPS().m_hgyi56_EVS_FR_doorState)");
      }
      // // // // // // //

      // // // // // // //
      // Event that toggles doors
      //
      // Multi-tap: toggle a specific door
      //
      if Equals(ListenerAction.GetName(action), n"CycleDoor") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_RELEASED) {

        if !this.m_hgyi56_EVS_cycleDoorLongInputTriggered {
          // If the last press time is older than "MyModSettings.Get(GetGameInstance()).multiTapTimeWindow()" consider this is a new sequence
          if Utils.GetCurrentTime(gi) - this.m_hgyi56_EVS_cycleDoorLastPressTime > MyModSettings.Get(GetGameInstance()).multiTapTimeWindow() {
            this.m_hgyi56_EVS_cycleDoorStep = 0;
          }

          this.m_hgyi56_EVS_cycleDoorLastPressTime = Utils.GetCurrentTime(gi);
          this.m_hgyi56_EVS_cycleDoorStep += 1;

          let event: ref<MultiTapDoorEvent> = new MultiTapDoorEvent();
          event.tapCount = this.m_hgyi56_EVS_cycleDoorStep;
          GameInstance.GetDelaySystem(gi).DelayEvent(vehicle, event, MyModSettings.Get(GetGameInstance()).multiTapTimeWindow(), false);
        }

        this.m_hgyi56_EVS_cycleDoorLongInputTriggered = false;
      }
      // // // // // // //

      // // // // // // //
      // Hold: toggle all doors
      //
      if Equals(ListenerAction.GetName(action), n"CycleDoor") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) {
        this.m_hgyi56_EVS_cycleDoorLongInputTriggered = true;

        if vehicle.IsPlayerDriver() {

          let preventDoorClosingDuringCombat: Bool = this.GetPS().m_hgyi56_EVS_isDriverCombat && this.GetPS().m_hgyi56_EVS_isDriverCombatType_Doors;
          let preventWindowClosingDuringCombat: Bool = this.GetPS().m_hgyi56_EVS_isDriverCombat && !this.GetPS().m_hgyi56_EVS_isDriverCombatType_Doors;

          let FL_doorState: VehicleDoorState = this.GetPS().GetDoorState(EVehicleDoor.seat_front_left);
          let FR_doorState: VehicleDoorState = this.GetPS().m_hgyi56_EVS_isSingleFrontDoor ? FL_doorState : this.GetPS().GetDoorState(EVehicleDoor.seat_front_right);

          let FL_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_front_left);
          let FR_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_front_right);
          let BL_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_back_left);
          let BR_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_back_right);

          if (this.GetPS().m_hgyi56_EVS_totalSeatSlots > 0 && Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_left), VehicleDoorState.Open))
          || (this.GetPS().m_hgyi56_EVS_totalSeatSlots > 1 && !this.GetPS().m_hgyi56_EVS_isSingleFrontDoor && Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_right), VehicleDoorState.Open))
          || (this.GetPS().m_hgyi56_EVS_totalSeatSlots > 2 && Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_back_left), VehicleDoorState.Open))
          || (this.GetPS().m_hgyi56_EVS_totalSeatSlots > 3 && Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_back_right), VehicleDoorState.Open)) {

            if this.GetPS().m_hgyi56_EVS_totalSeatSlots > 0 && !preventDoorClosingDuringCombat {
              VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetDriverSlotID());
              this.GetPS().m_hgyi56_EVS_FL_doorState = VehicleDoorState.Closed;
        
              if this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow && IsDefined(this.GetPS().m_hgyi56_EVS_windowTimings) {
                if Equals(this.GetPS().m_hgyi56_EVS_FL_windowState, EVehicleWindowState.Open) {
                  let event: ref<VehicleWindowOpen> = new VehicleWindowOpen();
                  event.slotID = VehicleComponent.GetDriverSlotName();
                  GameInstance.GetDelaySystem(gi).DelayPSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), event, this.GetPS().m_hgyi56_EVS_windowTimings.openTiming, true);
                }

                if this.GetPS().m_hgyi56_EVS_isSingleFrontDoor {
                  if Equals(this.GetPS().m_hgyi56_EVS_FR_windowState, EVehicleWindowState.Open) {
                    let event: ref<VehicleWindowOpen> = new VehicleWindowOpen();
                    event.slotID = VehicleComponent.GetFrontPassengerSlotName();
                    GameInstance.GetDelaySystem(gi).DelayPSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), event, this.GetPS().m_hgyi56_EVS_windowTimings.openTiming, true);
                  }
                }
              }

              // DriverCombat modes:
              // - Doors: front doors need to be opened (like Rayfield Caliburn)
              // - Standard: front windows need to be open. However if doors type is Sliding Door (like Quadra V-Tech) then the user can still manipulate windows while doors are open only
              if preventWindowClosingDuringCombat {
                this.hgyi56_EVS_ForceFrontWindowsDuringCombat(VehicleDoorState.Closed, FR_doorState);
              }
            }
            if this.GetPS().m_hgyi56_EVS_totalSeatSlots > 1 && !preventDoorClosingDuringCombat && !this.GetPS().m_hgyi56_EVS_isSingleFrontDoor {
              VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetFrontPassengerSlotID());
              this.GetPS().m_hgyi56_EVS_FR_doorState = VehicleDoorState.Closed;
        
              if this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow && IsDefined(this.GetPS().m_hgyi56_EVS_windowTimings) {
                if Equals(this.GetPS().m_hgyi56_EVS_FR_windowState, EVehicleWindowState.Open) {
                  let event: ref<VehicleWindowOpen> = new VehicleWindowOpen();
                  event.slotID = VehicleComponent.GetFrontPassengerSlotName();
                  GameInstance.GetDelaySystem(gi).DelayPSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), event, this.GetPS().m_hgyi56_EVS_windowTimings.openTiming, true);
                }
              }

              // DriverCombat modes:
              // - Doors: front doors need to be opened (like Rayfield Caliburn)
              // - Standard: front windows need to be open. However if doors type is Sliding Door (like Quadra V-Tech) then the user can still manipulate windows while doors are open only
              if preventWindowClosingDuringCombat {
                this.hgyi56_EVS_ForceFrontWindowsDuringCombat(FL_doorState, VehicleDoorState.Closed);
              }
            }
            if this.GetPS().m_hgyi56_EVS_totalSeatSlots > 2 {
              VehicleComponent.CloseDoor(vehicle, VehicleComponent.hgyi56_EVS_GetBackLeftPassengerSlotID());
              this.GetPS().m_hgyi56_EVS_BL_doorState = VehicleDoorState.Closed;
        
              if this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow && IsDefined(this.GetPS().m_hgyi56_EVS_windowTimings) {
                if Equals(this.GetPS().m_hgyi56_EVS_BL_windowState, EVehicleWindowState.Open) {
                  let event: ref<VehicleWindowOpen> = new VehicleWindowOpen();
                  event.slotID = VehicleComponent.GetBackLeftPassengerSlotName();
                  GameInstance.GetDelaySystem(gi).DelayPSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), event, this.GetPS().m_hgyi56_EVS_windowTimings.openTiming, true);
                }
              }
            }
            if this.GetPS().m_hgyi56_EVS_totalSeatSlots > 3 {
              VehicleComponent.CloseDoor(vehicle, VehicleComponent.hgyi56_EVS_GetBackRightPassengerSlotID());
              this.GetPS().m_hgyi56_EVS_BR_doorState = VehicleDoorState.Closed;
        
              if this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow && IsDefined(this.GetPS().m_hgyi56_EVS_windowTimings) {
                if Equals(this.GetPS().m_hgyi56_EVS_BR_windowState, EVehicleWindowState.Open) {
                  let event: ref<VehicleWindowOpen> = new VehicleWindowOpen();
                  event.slotID = VehicleComponent.GetBackRightPassengerSlotName();
                  GameInstance.GetDelaySystem(gi).DelayPSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), event, this.GetPS().m_hgyi56_EVS_windowTimings.openTiming, true);
                }
              }
            }
          }
          else {
            // For some vehicles with sliding doors: if the window is opened we need to close it before we open the door because otherwise the window position will be weird once the sliding door is lift
            if this.GetPS().m_hgyi56_EVS_totalSeatSlots > 0 {
              // For some vehicles with sliding doors: if the window is opened we need to close it before we open the door because otherwise the window position will be weird once the sliding door is lift
              if this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow {
                if !this.GetPS().m_hgyi56_EVS_isDriverCombat || player.m_inMountedWeaponVehicle {
                  this.GetPS().m_hgyi56_EVS_FL_windowState = FL_windowState;
                }
                
                if Equals(FL_windowState, EVehicleWindowState.Open) {
                  VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.GetDriverSlotID(), false, n"Custom");
                }

                if this.GetPS().m_hgyi56_EVS_isSingleFrontDoor {
                  if !this.GetPS().m_hgyi56_EVS_isDriverCombat || player.m_inMountedWeaponVehicle {
                    this.GetPS().m_hgyi56_EVS_FR_windowState = FR_windowState;
                  }
                  
                  if Equals(FR_windowState, EVehicleWindowState.Open) {
                    VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.GetFrontPassengerSlotID(), false, n"Custom");
                  }
                }
              }

              VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetDriverSlotID());
              this.GetPS().m_hgyi56_EVS_FL_doorState = VehicleDoorState.Open;

              // DriverCombat mode Standard: if doors type is Sliding Door (like Quadra V-Tech) then the user can still manipulate windows while doors are open only
              if preventWindowClosingDuringCombat && this.GetPS().m_hgyi56_EVS_isSlidingDoors {
                this.hgyi56_EVS_Recall_FL_WindowsState();
              }
            }

            // For some vehicles with sliding doors: if the window is opened we need to close it before we open the door because otherwise the window position will be weird once the sliding door is lift
            if this.GetPS().m_hgyi56_EVS_totalSeatSlots > 1 && !this.GetPS().m_hgyi56_EVS_isSingleFrontDoor {
              if this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow {
                if !this.GetPS().m_hgyi56_EVS_isDriverCombat || player.m_inMountedWeaponVehicle {
                  this.GetPS().m_hgyi56_EVS_FR_windowState = FR_windowState;
                }
                
                if Equals(FR_windowState, EVehicleWindowState.Open) {
                  VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.GetFrontPassengerSlotID(), false, n"Custom");
                }
              }
              VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetFrontPassengerSlotID());
              this.GetPS().m_hgyi56_EVS_FR_doorState = VehicleDoorState.Open;

              // DriverCombat mode Standard: if doors type is Sliding Door (like Quadra V-Tech) then the user can still manipulate windows while doors are open only
              if preventWindowClosingDuringCombat && this.GetPS().m_hgyi56_EVS_isSlidingDoors {
                this.hgyi56_EVS_Recall_FR_WindowsState();
              }
            }

            // For some vehicles with sliding doors: if the window is opened we need to close it before we open the door because otherwise the window position will be weird once the sliding door is lift
            if this.GetPS().m_hgyi56_EVS_totalSeatSlots > 2 {
              if this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow {
                if !this.GetPS().m_hgyi56_EVS_isDriverCombat || player.m_inMountedWeaponVehicle {
                  this.GetPS().m_hgyi56_EVS_BL_windowState = BL_windowState;
                }
                
                if Equals(BL_windowState, EVehicleWindowState.Open) {
                  VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.hgyi56_EVS_GetBackLeftPassengerSlotID(), false, n"Custom");
                }
              }
              VehicleComponent.OpenDoor(vehicle, VehicleComponent.hgyi56_EVS_GetBackLeftPassengerSlotID());
              this.GetPS().m_hgyi56_EVS_BL_doorState = VehicleDoorState.Open;
            }

            // For some vehicles with sliding doors: if the window is opened we need to close it before we open the door because otherwise the window position will be weird once the sliding door is lift
            if this.GetPS().m_hgyi56_EVS_totalSeatSlots > 3 {
              if this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow {
                if !this.GetPS().m_hgyi56_EVS_isDriverCombat || player.m_inMountedWeaponVehicle {
                  this.GetPS().m_hgyi56_EVS_BR_windowState = BR_windowState;
                }
                
                if Equals(BR_windowState, EVehicleWindowState.Open) {
                  VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.hgyi56_EVS_GetBackRightPassengerSlotID(), false, n"Custom");
                }
              }
              VehicleComponent.OpenDoor(vehicle, VehicleComponent.hgyi56_EVS_GetBackRightPassengerSlotID());
              this.GetPS().m_hgyi56_EVS_BR_doorState = VehicleDoorState.Open;
            }
          }
        }
      }
      // // // // // // //

      // // // // // // //
      // Event that toggles interior lights and crystal dome
      // 1 : toggle roof light
      // 2 : toggle ambient lights
      //
      // Multi-tap
      //
      if Equals(ListenerAction.GetName(action), n"CycleDome") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_RELEASED) {

        if !this.m_hgyi56_EVS_cycleDomeLongInputTriggered {
          // If the last press time is older than "MyModSettings.Get(GetGameInstance()).multiTapTimeWindow()" consider this is a new sequence
          if Utils.GetCurrentTime(gi) - this.m_hgyi56_EVS_cycleDomeLastPressTime > MyModSettings.Get(GetGameInstance()).multiTapTimeWindow() {
            this.m_hgyi56_EVS_cycleDomeStep = 0;
          }

          this.m_hgyi56_EVS_cycleDomeLastPressTime = Utils.GetCurrentTime(gi);
          this.m_hgyi56_EVS_cycleDomeStep += 1;

          let event: ref<MultiTapDomeEvent> = new MultiTapDomeEvent();
          event.tapCount = this.m_hgyi56_EVS_cycleDomeStep;
          GameInstance.GetDelaySystem(gi).DelayEvent(vehicle, event, MyModSettings.Get(GetGameInstance()).multiTapTimeWindow(), false);
        }

        this.m_hgyi56_EVS_cycleDomeLongInputTriggered = false;
      }
      // // // // // // //

      // // // // // // //
      // Hold: toggle crystal dome
      //
      if Equals(ListenerAction.GetName(action), n"CycleDome") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) {
        this.m_hgyi56_EVS_cycleDomeLongInputTriggered = true;

        this.hgyi56_EVS_MyToggleCrystalDome(!this.GetPS().GetCrystalDomeState());
      }
      // // // // // // //

      // Not all vehicles have movable windows. Some have a crystal dome (fixed plates with screens inside) like the Rayfield Caliburn or the Rayfield Aerondight.
      // Some others have both a crystal dome and "window plates" that can be opened as regular windows such as the nomad Thorton Colby "Little Mule".
      //
      // Windows shall only be toggleable in the following cases:
      //  - Doors are "hasIncompatibleSlidingDoorsWindow" and closed. Otherwise the window animation will become weird while the door is lift.
      //  - Doors are not "hasIncompatibleSlidingDoorsWindow".
      //
      if this.GetPS().m_hgyi56_EVS_hasWindows {
        // // // // // // //
        // Event that toggles windows
        //
        // Multi-tap: toggle a specific window
        //
        if Equals(ListenerAction.GetName(action), n"CycleWindow") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_RELEASED) {

          if !this.m_hgyi56_EVS_cycleWindowLongInputTriggered {
            // If the last press time is older than "MyModSettings.Get(GetGameInstance()).multiTapTimeWindow()" consider this is a new sequence
            if Utils.GetCurrentTime(gi) - this.m_hgyi56_EVS_cycleWindowLastPressTime > MyModSettings.Get(GetGameInstance()).multiTapTimeWindow() {
              this.m_hgyi56_EVS_cycleWindowStep = 0;
            }

            this.m_hgyi56_EVS_cycleWindowLastPressTime = Utils.GetCurrentTime(gi);
            this.m_hgyi56_EVS_cycleWindowStep += 1;

            let event: ref<MultiTapWindowEvent> = new MultiTapWindowEvent();
            event.tapCount = this.m_hgyi56_EVS_cycleWindowStep;
            GameInstance.GetDelaySystem(gi).DelayEvent(vehicle, event, MyModSettings.Get(GetGameInstance()).multiTapTimeWindow(), false);
          }

          this.m_hgyi56_EVS_cycleWindowLongInputTriggered = false;
        }
        // // // // // // //

        // // // // // // //
        // Hold: toggle all windows
        //
        if Equals(ListenerAction.GetName(action), n"CycleWindow") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) {
          this.m_hgyi56_EVS_cycleWindowLongInputTriggered = true;

          if vehicle.IsPlayerDriver() {

            let preventWindowClosingDuringCombat: Bool = this.GetPS().m_hgyi56_EVS_isDriverCombat && !this.GetPS().m_hgyi56_EVS_isDriverCombatType_Doors;

            let FL_doorState: VehicleDoorState = this.GetPS().GetDoorState(EVehicleDoor.seat_front_left);
            let FR_doorState: VehicleDoorState = this.GetPS().m_hgyi56_EVS_isSingleFrontDoor ? FL_doorState : this.GetPS().GetDoorState(EVehicleDoor.seat_front_right);
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
            if (this.GetPS().m_hgyi56_EVS_totalSeatSlots > 0 && Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_front_left), EVehicleWindowState.Open))
            || (this.GetPS().m_hgyi56_EVS_totalSeatSlots > 1 && Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_front_right), EVehicleWindowState.Open))
            || (this.GetPS().m_hgyi56_EVS_totalSeatSlots > 2 && Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_back_left), EVehicleWindowState.Open))
            || (this.GetPS().m_hgyi56_EVS_totalSeatSlots > 3 && Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_back_right), EVehicleWindowState.Open)) {

              if this.GetPS().m_hgyi56_EVS_totalSeatSlots > 0 && (!preventWindowClosingDuringCombat || (this.GetPS().m_hgyi56_EVS_isSlidingDoors && Equals(FL_doorState, VehicleDoorState.Open))) && (!this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow || Equals(FL_doorState, VehicleDoorState.Closed)) && Equals(FL_windowState, EVehicleWindowState.Open) {
                VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.GetDriverSlotID(), false);

                // During DriverCombat mode: if the user manipulates window while sliding doors are open then remember these new states as the recall state
                this.GetPS().m_hgyi56_EVS_FL_windowState = Equals(FL_windowState, EVehicleWindowState.Open) ? EVehicleWindowState.Closed : EVehicleWindowState.Open;
              }
              if this.GetPS().m_hgyi56_EVS_totalSeatSlots > 1 && (!preventWindowClosingDuringCombat || (this.GetPS().m_hgyi56_EVS_isSlidingDoors && Equals(FR_doorState, VehicleDoorState.Open))) && (!this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow || Equals(FR_doorState, VehicleDoorState.Closed)) && Equals(FR_windowState, EVehicleWindowState.Open) {
                VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.GetFrontPassengerSlotID(), false);

                // During DriverCombat mode: if the user manipulates window while sliding doors are open then remember these new states as the recall state
                this.GetPS().m_hgyi56_EVS_FR_windowState = Equals(FR_windowState, EVehicleWindowState.Open) ? EVehicleWindowState.Closed : EVehicleWindowState.Open;
              }
              if this.GetPS().m_hgyi56_EVS_totalSeatSlots > 2 && (!this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow || Equals(BL_doorState, VehicleDoorState.Closed)) && Equals(BL_windowState, EVehicleWindowState.Open) {
                VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.hgyi56_EVS_GetBackLeftPassengerSlotID(), false);
                this.GetPS().m_hgyi56_EVS_BL_windowState = Equals(BL_windowState, EVehicleWindowState.Open) ? EVehicleWindowState.Closed : EVehicleWindowState.Open;
              }
              if this.GetPS().m_hgyi56_EVS_totalSeatSlots > 3 && (!this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow || Equals(BR_doorState, VehicleDoorState.Closed)) && Equals(BR_windowState, EVehicleWindowState.Open) {
                VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.hgyi56_EVS_GetBackRightPassengerSlotID(), false);
                this.GetPS().m_hgyi56_EVS_BR_windowState = Equals(BR_windowState, EVehicleWindowState.Open) ? EVehicleWindowState.Closed : EVehicleWindowState.Open;
              }
            }
            else {
              if this.GetPS().m_hgyi56_EVS_totalSeatSlots > 0 && (!this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow || Equals(FL_doorState, VehicleDoorState.Closed)) && Equals(FL_windowState, EVehicleWindowState.Closed) {
                VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.GetDriverSlotID(), true);

                // During DriverCombat mode: if the user manipulates window while sliding doors are open then remember these new states as the recall state
                this.GetPS().m_hgyi56_EVS_FL_windowState = Equals(FL_windowState, EVehicleWindowState.Open) ? EVehicleWindowState.Closed : EVehicleWindowState.Open;
              }
              if this.GetPS().m_hgyi56_EVS_totalSeatSlots > 1 && (!this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow || Equals(FR_doorState, VehicleDoorState.Closed)) && Equals(FR_windowState, EVehicleWindowState.Closed) {
                VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.GetFrontPassengerSlotID(), true);

                // During DriverCombat mode: if the user manipulates window while sliding doors are open then remember these new states as the recall state
                this.GetPS().m_hgyi56_EVS_FR_windowState = Equals(FR_windowState, EVehicleWindowState.Open) ? EVehicleWindowState.Closed : EVehicleWindowState.Open;
              }
              if this.GetPS().m_hgyi56_EVS_totalSeatSlots > 2 && (!this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow || Equals(BL_doorState, VehicleDoorState.Closed)) && Equals(BL_windowState, EVehicleWindowState.Closed) {
                VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.hgyi56_EVS_GetBackLeftPassengerSlotID(), true);
                this.GetPS().m_hgyi56_EVS_BL_windowState = Equals(BL_windowState, EVehicleWindowState.Open) ? EVehicleWindowState.Closed : EVehicleWindowState.Open;
              }
              if this.GetPS().m_hgyi56_EVS_totalSeatSlots > 3 && (!this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow || Equals(BR_doorState, VehicleDoorState.Closed)) && Equals(BR_windowState, EVehicleWindowState.Closed) {
                VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.hgyi56_EVS_GetBackRightPassengerSlotID(), true);
                this.GetPS().m_hgyi56_EVS_BR_windowState = Equals(BR_windowState, EVehicleWindowState.Open) ? EVehicleWindowState.Closed : EVehicleWindowState.Open;
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

        if !this.m_hgyi56_EVS_cycleSpoilerLongInputTriggered {
          // If the last press time is older than "MyModSettings.Get(GetGameInstance()).multiTapTimeWindow()" consider this is a new sequence
          if Utils.GetCurrentTime(gi) - this.m_hgyi56_EVS_cycleSpoilerLastPressTime > MyModSettings.Get(GetGameInstance()).multiTapTimeWindow() {
            this.m_hgyi56_EVS_cycleSpoilerStep = 0;
          }

          this.m_hgyi56_EVS_cycleSpoilerLastPressTime = Utils.GetCurrentTime(gi);
          this.m_hgyi56_EVS_cycleSpoilerStep += 1;

          let event: ref<MultiTapSpoilerEvent> = new MultiTapSpoilerEvent();
          event.tapCount = this.m_hgyi56_EVS_cycleSpoilerStep;
          GameInstance.GetDelaySystem(gi).DelayEvent(vehicle, event, MyModSettings.Get(GetGameInstance()).multiTapTimeWindow(), false);
        }

        this.m_hgyi56_EVS_cycleSpoilerLongInputTriggered = false;
      }
      // // // // // // //

      // // // // // // //
      // Hold: toggle hood + trunk
      //
      if Equals(ListenerAction.GetName(action), n"CycleSpoiler") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) {
        this.m_hgyi56_EVS_cycleSpoilerLongInputTriggered = true;

        if Equals(this.GetPS().GetDoorState(EVehicleDoor.hood), VehicleDoorState.Open)
        || Equals(this.GetPS().GetDoorState(EVehicleDoor.trunk), VehicleDoorState.Open) {

          VehicleComponent.CloseDoor(vehicle, VehicleComponent.hgyi56_EVS_GetHoodSlotID());
          VehicleComponent.CloseDoor(vehicle, VehicleComponent.hgyi56_EVS_GetTrunkSlotID());
        }
        else {
          VehicleComponent.OpenDoor(vehicle, VehicleComponent.hgyi56_EVS_GetHoodSlotID());
          VehicleComponent.OpenDoor(vehicle, VehicleComponent.hgyi56_EVS_GetTrunkSlotID());
        }
      }
      // // // // // // //
    }

    // // // // // // //
    // Use this trick in case V has got out of the vehicle with the engine running, and then got back in. The engine sound is still present but the internal logic of the vehicle object is engine off.
    // So we turn it fully back on seemlessly when the player accelerates.
    //
    if (Equals(ListenerAction.GetName(action), n"Accelerate") || Equals(ListenerAction.GetName(action), n"Decelerate")) && vehicle.IsEngineTurnedOn() && NotEquals(this.GetVehicleControllerPS().GetState(), vehicleEState.On) {
      this.hgyi56_EVS_TogglePowerState(true);
      this.hgyi56_EVS_ToggleEngineState(true);
    }
    // // // // // // //

    let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gi).GetLocalPlayerMainGameObject() as PlayerPuppet;

    let preventEngineShutdown: Bool = vehicle.IsEngineTurnedOn() && player.IsInCombat() && MyModSettings.Get(GetGameInstance()).preventPowerOffDuringCombat();
    let preventPowerShutdown: Bool = this.GetPS().m_hgyi56_EVS_powerState && player.IsInCombat() && MyModSettings.Get(GetGameInstance()).preventPowerOffDuringCombat();

    // // // // // // //
    // Event that toggles crystal coat
    //
    // Double-tap: toggle crystal coat state
    //
    if Equals(ListenerAction.GetName(action), n"VehicleVisualCustomization") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_PRESSED)
    && this.GetIsVehicleVisualCustomizationEnabled()
    && !this.GetPS().GetIsVehicleVisualCustomizationBlockedByDamage() {

      if !this.m_hgyi56_EVS_cycleCrystalCoatLongInputTriggered {
        // If the last press time is older than "MyModSettings.Get(GetGameInstance()).multiTapTimeWindow()" consider this is a new sequence
        if Utils.GetCurrentTime(gi) - this.m_hgyi56_EVS_cycleCrystalCoatLastPressTime > MyModSettings.Get(GetGameInstance()).multiTapTimeWindow() {
          this.m_hgyi56_EVS_cycleCrystalCoatStep = 0;
        }

        this.m_hgyi56_EVS_cycleCrystalCoatLastPressTime = Utils.GetCurrentTime(gi);
        this.m_hgyi56_EVS_cycleCrystalCoatStep += 1;

        let event: ref<MultiTapCrystalCoatEvent> = new MultiTapCrystalCoatEvent();
        event.tapCount = this.m_hgyi56_EVS_cycleCrystalCoatStep;
        GameInstance.GetDelaySystem(gi).DelayEvent(vehicle, event, MyModSettings.Get(GetGameInstance()).multiTapTimeWindow(), false);
      }

      this.m_hgyi56_EVS_cycleCrystalCoatLongInputTriggered = false;
    }
    // // // // // // //

    // // // // // // //
    // Event that toggles power state and engine
    //
    // Double-tap: toggle power state
    //
    if Equals(ListenerAction.GetName(action), n"CycleEngineStep1") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_PRESSED) {

      // If the last press time is older than "MyModSettings.Get(GetGameInstance()).multiTapTimeWindow()" consider this is a new sequence
      if Utils.GetCurrentTime(gi) - this.m_hgyi56_EVS_cycleEngineLastPressTime > MyModSettings.Get(GetGameInstance()).multiTapTimeWindow() {
        this.m_hgyi56_EVS_cycleEngineLastPressTime = Utils.GetCurrentTime(gi);
      }
      else if !preventPowerShutdown {
        this.hgyi56_EVS_TogglePowerState(!this.GetPS().m_hgyi56_EVS_powerState);

        if !this.GetPS().m_hgyi56_EVS_powerState && vehicle.IsEngineTurnedOn() {
          this.hgyi56_EVS_ToggleEngineState(false);
        }
      }
    }
    // // // // // // //

    // // // // // // //
    // First step of the CycleEngine HOLD event: toggle the engine.
    //
    if !preventEngineShutdown && Equals(ListenerAction.GetName(action), n"CycleEngineStep1") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) {
      
      // When turning the engine ON without power on first, the interior lights always light up automatically
      if !this.GetPS().m_hgyi56_EVS_powerState {
        this.hgyi56_EVS_TogglePowerState(true);
      }

      // In case we start the engine, then shut the engine off with headlights shut off (hold step 2), then start the engine again we need to disable shut off
      if !vehicle.IsEngineTurnedOn() && this.GetPS().m_hgyi56_EVS_temporaryHeadlightsShutOff {
        this.hgyi56_EVS_ToggleHeadlightsShutoff(false);

        this.hgyi56_EVS_ApplyHeadlightsModeWithShutOff();
        this.hgyi56_EVS_ApplyUtilityLightsWithShutOff();
      }

      this.hgyi56_EVS_ToggleEngineState(!vehicle.IsEngineTurnedOn());
    }
    // // // // // // //
    
    // // // // // // //
    // Second step of the CycleEngine HOLD event: turn the headlights off.
    //
    if Equals(ListenerAction.GetName(action), n"CycleEngineStep2") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) && !vehicle.IsEngineTurnedOn() {
      
      this.hgyi56_EVS_ToggleHeadlightsShutoff(true);

      this.hgyi56_EVS_ApplyHeadlightsModeWithShutOff();
      this.hgyi56_EVS_ApplyUtilityLightsWithShutOff();
    }
    // // // // // // //
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_GetPlayerSlotID() -> MountingSlotId {
  let gi: GameInstance = GetGameInstance();
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gi).GetLocalPlayerMainGameObject() as PlayerPuppet;

  let mountInfos: MountingInfo = GameInstance.GetMountingFacility(gi).GetMountingInfoSingleWithIds(player.GetEntityID());
  
  return mountInfos.slotId;
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_ApplyHeadlightsModeWithShutOff() {
  let vehCtrlPS: ref<vehicleControllerPS> = this.GetVehicleControllerPS();
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !IsDefined(vehCtrlPS) || !IsDefined(vehicle) {
    return;
  }

  if !this.GetPS().m_hgyi56_EVS_temporaryHeadlightsShutOff
  && (NotEquals(vehCtrlPS.GetHeadLightMode(), this.GetPS().m_hgyi56_EVS_currentHeadlightsState)
      || (this.hgyi56_EVS_IsCrystalCoatActive() && NotEquals(this.GetPS().m_hgyi56_EVS_currentHeadlightsState, vehicleELightMode.Off))) {
    if Equals(this.GetPS().m_hgyi56_EVS_currentHeadlightsState, vehicleELightMode.Off) {
      this.hgyi56_EVS_UpdateActiveEffectIdentifier(vehicleELightType.Head);
      this.hgyi56_EVS_UpdateActiveEffectIdentifier(vehicleELightType.Brake);
      this.hgyi56_EVS_UpdateActiveEffectIdentifier(vehicleELightType.Blinkers);
    }

    vehCtrlPS.SetHeadLightMode(this.GetPS().m_hgyi56_EVS_currentHeadlightsState);
    this.hgyi56_EVS_ApplyTailLightsSettingsChange();
    this.hgyi56_EVS_ApplyHeadlightsColorSettingsChange();
    this.hgyi56_EVS_ApplyBlinkerLightsSettingsChange();
    // FTLog(s"Set headlights -> \(this.GetPS().m_hgyi56_EVS_currentHeadlightsState)");
  }
  else if this.GetPS().m_hgyi56_EVS_temporaryHeadlightsShutOff && NotEquals(vehCtrlPS.GetHeadLightMode(), vehicleELightMode.Off) {
    this.hgyi56_EVS_UpdateActiveEffectIdentifier(vehicleELightType.Head);
    this.hgyi56_EVS_UpdateActiveEffectIdentifier(vehicleELightType.Brake);
    this.hgyi56_EVS_UpdateActiveEffectIdentifier(vehicleELightType.Blinkers);

    vehCtrlPS.SetHeadLightMode(vehicleELightMode.Off);
    // FTLog(s"Set headlights -> \(vehCtrlPS.GetHeadLightMode())");
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_ApplyHeadlightsMode() {
  let vehCtrlPS: ref<vehicleControllerPS> = this.GetVehicleControllerPS();
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !IsDefined(vehCtrlPS) || !IsDefined(vehicle) {
    return;
  }

  if NotEquals(vehCtrlPS.GetHeadLightMode(), this.GetPS().m_hgyi56_EVS_currentHeadlightsState) {   
    if Equals(this.GetPS().m_hgyi56_EVS_currentHeadlightsState, vehicleELightMode.Off) {
      this.hgyi56_EVS_UpdateActiveEffectIdentifier(vehicleELightType.Head);
      this.hgyi56_EVS_UpdateActiveEffectIdentifier(vehicleELightType.Brake);
      this.hgyi56_EVS_UpdateActiveEffectIdentifier(vehicleELightType.Blinkers);
    }

    vehCtrlPS.SetHeadLightMode(this.GetPS().m_hgyi56_EVS_currentHeadlightsState);
    this.hgyi56_EVS_ApplyTailLightsSettingsChange();
    this.hgyi56_EVS_ApplyHeadlightsColorSettingsChange();
    this.hgyi56_EVS_ApplyBlinkerLightsSettingsChange();
    // FTLog(s"Set headlights -> \(this.GetPS().m_hgyi56_EVS_currentHeadlightsState)");
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_UpdateHeadlightsWithTimeSync() {
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !IsDefined(vehicle) {
    return;
  }

  if this.m_hgyi56_EVS_headlightsSynchronizedWithTimeShallEnable {

    // If utility lights are included
    switch MyModSettings.Get(GetGameInstance()).utilityLightsSynchronizedWithTimeVehicleType() {

      case EUtilityLightsSynchronizedWithTimeVehicleType.No:
        // Do nothing
        break;

      case EUtilityLightsSynchronizedWithTimeVehicleType.Motorcycles:
        if vehicle == (vehicle as BikeObject) {
          this.GetPS().m_hgyi56_EVS_auxiliaryState = true; // Silent toggle
          // FTLog(s"Set utility lights mode by time sync -> \(this.GetPS().m_hgyi56_EVS_auxiliaryState)");
        }
        break;
        
      case EUtilityLightsSynchronizedWithTimeVehicleType.AllVehicles:
        this.GetPS().m_hgyi56_EVS_auxiliaryState = true; // Silent toggle
        // FTLog(s"Set utility lights mode by time sync -> \(this.GetPS().m_hgyi56_EVS_auxiliaryState)");
        break;
    }

    // Only update headlights state if they are not already turned on no matter the current mode
    if Equals(this.GetPS().m_hgyi56_EVS_currentHeadlightsState, vehicleELightMode.Off) {
      switch MyModSettings.Get(GetGameInstance()).headlightsSynchronizedWithTimeMode() {

        case EHeadlightsSynchronizedWithTimeMode.LowBeam:
          this.GetPS().m_hgyi56_EVS_currentHeadlightsState = vehicleELightMode.On;
          // FTLog(s"Set headlights mode by time sync -> \(this.GetPS().m_hgyi56_EVS_currentHeadlightsState)");
          break;
          
        case EHeadlightsSynchronizedWithTimeMode.HighBeam:
          this.GetPS().m_hgyi56_EVS_currentHeadlightsState = vehicleELightMode.HighBeams;
          // FTLog(s"Set headlights mode by time sync -> \(this.GetPS().m_hgyi56_EVS_currentHeadlightsState)");
          break;
      }
    }
  }
  else {
    this.GetPS().m_hgyi56_EVS_currentHeadlightsState = vehicleELightMode.Off;
    // FTLog(s"Set headlights mode by time sync -> \(this.GetPS().m_hgyi56_EVS_currentHeadlightsState)");

    // If utility lights are included
    switch MyModSettings.Get(GetGameInstance()).utilityLightsSynchronizedWithTimeVehicleType() {

      case EUtilityLightsSynchronizedWithTimeVehicleType.No:
        // Do nothing
        break;

      case EUtilityLightsSynchronizedWithTimeVehicleType.Motorcycles:
        if vehicle == (vehicle as BikeObject) {
          this.GetPS().m_hgyi56_EVS_auxiliaryState = false; // Silent toggle
          // FTLog(s"Set utility lights mode by time sync -> \(this.GetPS().m_hgyi56_EVS_auxiliaryState)");
        }
        break;
        
      case EUtilityLightsSynchronizedWithTimeVehicleType.AllVehicles:
        this.GetPS().m_hgyi56_EVS_auxiliaryState = false; // Silent toggle
        // FTLog(s"Set utility lights mode by time sync -> \(this.GetPS().m_hgyi56_EVS_auxiliaryState)");
        break;
    }
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_ToggleRoofLight(toggle: Bool, opt force: Bool) {
  if force || NotEquals(this.GetPS().m_hgyi56_EVS_roofLightState, toggle) {
    this.m_hgyi56_EVS_roofLight_CycleIdentifier += 1;

    this.GetPS().m_hgyi56_EVS_roofLightState = toggle;

    if force {
      this.GetPS().m_hgyi56_EVS_roofLightState = false;
      this.hgyi56_EVS_EnsureIsDisabled_RoofLight();
      this.GetPS().m_hgyi56_EVS_roofLightState = true;
    }

    this.hgyi56_EVS_EnsureIsActive_RoofLight();
    this.hgyi56_EVS_EnsureIsDisabled_RoofLight();
    
    // FTLog(s"Set roof light -> \(this.GetPS().m_hgyi56_EVS_roofLightState)");
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_EnsureIsActive_RoofLight() {
  let vehCtrl: ref<vehicleController> = this.GetVehicleController();
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !IsDefined(vehCtrl) || !IsDefined(vehicle) {
    return;
  }

  if this.GetPS().m_hgyi56_EVS_roofLightState {
    vehCtrl.ToggleLights(this.GetPS().m_hgyi56_EVS_roofLightState, IntEnum<vehicleELightType>(EnumValueFromName(n"vehicleELightType", n"hgyi56_RoofLining")));
    
    if Equals(MyModSettings.Get(GetGameInstance()).interiorlightsRoofLightOperatingMode(), ERoofLightOperatingMode.Temporary) {
      let callback: ref<RoofLightRearmCallback> = new RoofLightRearmCallback();
      callback.vehComp = this;
      callback.identifier = this.m_hgyi56_EVS_roofLight_CycleIdentifier;

      GameInstance.GetDelaySystem(GetGameInstance()).DelayCallback(callback, this.GetVehicle().m_roofLight_TurnOnTime, true);
    }

    // FTLog(s"Ensure roof light active -> \(this.GetPS().m_hgyi56_EVS_roofLightState)");
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_EnsureIsDisabled_RoofLight() {
  let vehCtrl: ref<vehicleController> = this.GetVehicleController();
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !IsDefined(vehCtrl) || !IsDefined(vehicle) {
    return;
  }

  if !this.GetPS().m_hgyi56_EVS_roofLightState {
    vehCtrl.ToggleLights(this.GetPS().m_hgyi56_EVS_roofLightState, IntEnum<vehicleELightType>(EnumValueFromName(n"vehicleELightType", n"hgyi56_RoofLining")));
    // FTLog(s"Ensure roof light disabled -> \(this.GetPS().m_hgyi56_EVS_roofLightState)");
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_ToggleInteriorLights(toggle: Bool) {
  if NotEquals(this.GetPS().m_hgyi56_EVS_interiorLightsState, toggle) {
    this.GetPS().m_hgyi56_EVS_interiorLightsState = toggle;

    this.hgyi56_EVS_EnsureIsActive_InteriorLights();
    this.hgyi56_EVS_EnsureIsDisabled_InteriorLights();
    
    // FTLog(s"Set interior lights -> \(this.GetPS().m_hgyi56_EVS_interiorLightsState)");
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_EnsureIsActive_InteriorLights() {
  let vehCtrl: ref<vehicleController> = this.GetVehicleController();

  if !IsDefined(vehCtrl) {
    return;
  }

  if this.GetPS().m_hgyi56_EVS_interiorLightsState {
    this.hgyi56_EVS_ApplyInteriorLightsSettingsChange();
    vehCtrl.ToggleLights(this.GetPS().m_hgyi56_EVS_interiorLightsState, vehicleELightType.Interior);
    // FTLog(s"Ensure interior lights active -> \(this.GetPS().m_hgyi56_EVS_interiorLightsState)");
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_EnsureIsDisabled_InteriorLights() {
  let vehCtrl: ref<vehicleController> = this.GetVehicleController();
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !IsDefined(vehCtrl) || !IsDefined(vehicle) {
    return;
  }

  if !this.GetPS().m_hgyi56_EVS_interiorLightsState {
    this.hgyi56_EVS_UpdateActiveEffectIdentifier(vehicleELightType.Interior);
    vehCtrl.ToggleLights(this.GetPS().m_hgyi56_EVS_interiorLightsState, vehicleELightType.Interior);
    // FTLog(s"Ensure interior lights disabled -> \(this.GetPS().m_hgyi56_EVS_interiorLightsState)");
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_MyToggleCrystalDome(toggle: Bool) {
  let gi: GameInstance = GetGameInstance();
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !IsDefined(vehicle) {
    return;
  }

  if player.IsInCombat() && !toggle && MyModSettings.Get(GetGameInstance()).preventCrystalDomeOffDuringCombat() {
    return;
  }

  if NotEquals(this.GetPS().GetCrystalDomeState(), toggle) {
    this.ToggleCrystalDome(toggle);
    // FTLog(s"Set crystal dome -> \(this.GetPS().GetCrystalDomeState())");
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_EnsureIsActive_CrystalDome() {
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !IsDefined(vehicle) {
    return;
  }

  if this.GetPS().GetCrystalDomeState() {
    this.ToggleCrystalDome(true, true, true);
    // FTLog(s"Ensure crystal dome active -> true");
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_ToggleHeadlightsShutoff(toggle: Bool) {
  if NotEquals(this.GetPS().m_hgyi56_EVS_temporaryHeadlightsShutOff, toggle) {
    this.GetPS().m_hgyi56_EVS_temporaryHeadlightsShutOff = toggle;
    // FTLog(s"Set headlights shutoff -> \(this.GetPS().m_hgyi56_EVS_temporaryHeadlightsShutOff)");
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_TogglePowerState(toggle: Bool) {
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !IsDefined(vehicle) {
    return;
  }

  if NotEquals(this.GetPS().m_hgyi56_EVS_powerState, toggle) {
    this.GetPS().m_hgyi56_EVS_powerState = toggle;
    // FTLog(s"Set power state -> \(this.GetPS().m_hgyi56_EVS_powerState)");

    this.hgyi56_EVS_ToggleDashboard(toggle);

    // Ambient lights
    if toggle && Equals(MyModSettings.Get(GetGameInstance()).interiorlightsAutomaticTurnOn(), EInteriorLightsToggleOn.OnPowerOn) {
      this.hgyi56_EVS_ToggleInteriorLights(toggle);
    }
    else if !toggle && Equals(MyModSettings.Get(GetGameInstance()).interiorlightsAutomaticTurnOff(), EInteriorLightsToggleOff.OnPowerOff) {
      this.hgyi56_EVS_ToggleInteriorLights(toggle);
    }

    // Roof light
    if toggle && MyModSettings.Get(GetGameInstance()).interiorlightsRoofLightTurnOnWithPowerState() {
      this.hgyi56_EVS_ToggleRoofLight(toggle, true);
    }

    this.hgyi56_EVS_ToggleHeadlightsShutoff(!toggle);

    this.m_hgyi56_EVS_headlightsTimerIdentifier += 1;

    if MyModSettings.Get(GetGameInstance()).headlightsSynchronizedWithTimeEnabled() {
      let event: ref<GameTimeElapsedEvent> = new GameTimeElapsedEvent();
      event.identifier = this.m_hgyi56_EVS_headlightsTimerIdentifier;

      // Call the event synchronously for the first time
      this.hgyi56_EVS_OnGameTimeElapsedEvent(event);
      
      this.hgyi56_EVS_UpdateHeadlightsWithTimeSync();
    }

    this.hgyi56_EVS_ApplyHeadlightsModeWithShutOff();
    this.hgyi56_EVS_ApplyUtilityLightsWithShutOff();

    if MyModSettings.Get(GetGameInstance()).crystalDomeSynchronizedWithPowerState() {
      if toggle || !MyModSettings.Get(GetGameInstance()).crystalDomeKeepOnUntilExit() {
        this.hgyi56_EVS_MyToggleCrystalDome(toggle);
      }
    }

    if MyModSettings.Get(GetGameInstance()).spoilerSynchronizedWithPowerState() {
      this.hgyi56_EVS_ToggleSpoiler(toggle);
    }

    if toggle {
      this.GetPS().m_hgyi56_EVS_poweredOnAtLeastOnceSinceLastEnter = true;      
      // FTLog(s"Powered on at least once -> \(this.GetPS().m_hgyi56_EVS_poweredOnAtLeastOnceSinceLastEnter)");
    }
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_ToggleEngineState(toggle: Bool) {
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !IsDefined(vehicle) {
    return;
  }

  this.GetPS().m_hgyi56_EVS_engineState = toggle;
  vehicle.TurnEngineOn(this.GetPS().m_hgyi56_EVS_engineState);
  // FTLog(s"Set engine state -> \(this.GetPS().m_hgyi56_EVS_engineState)");
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_ToggleSpoiler(toggle: Bool) {
  let animFeature: ref<AnimFeature_PartData>;
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !IsDefined(vehicle) {
    return;
  }

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
    
    this.GetPS().m_hgyi56_EVS_spoilerState = this.m_spoilerDeployed;
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_ToggleUtilityLights(toggle: Bool) {
  if this.GetPS().m_hgyi56_EVS_isPoliceVehicle {
    return;
  }

  if NotEquals(this.GetPS().m_hgyi56_EVS_auxiliaryState, toggle) {
    this.GetPS().m_hgyi56_EVS_auxiliaryState = toggle;

    this.hgyi56_EVS_EnsureIsActive_UtilityLights();
    this.hgyi56_EVS_EnsureIsDisabled_UtilityLights();

    // FTLog(s"Set utility lights -> \(this.GetPS().m_hgyi56_EVS_auxiliaryState)");
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_ApplyUtilityLightsWithShutOff() {
  if this.GetPS().m_hgyi56_EVS_isPoliceVehicle {
    return;
  }

  let vehCtrl: ref<vehicleController> = this.GetVehicleController();
  if !IsDefined(vehCtrl) {
    return;
  }

  let vehicle: ref<VehicleObject> = this.GetVehicle();
  if !IsDefined(vehicle) {
    return;
  }
  
  if !this.GetPS().m_hgyi56_EVS_temporaryHeadlightsShutOff {
    this.hgyi56_EVS_EnsureIsActive_UtilityLights();
    this.hgyi56_EVS_EnsureIsDisabled_UtilityLights();
  }
  else { // Shut off
    if MyModSettings.Get(GetGameInstance()).utilityLightsSynchronizedWithHeadlightsShutoff() {
      this.hgyi56_EVS_UpdateActiveEffectIdentifier(vehicleELightType.Utility);
      vehCtrl.ToggleLights(false, vehicleELightType.Utility);
      // FTLog(s"Set utility lights with shutoff -> false");
    }
    else {
      this.hgyi56_EVS_EnsureIsActive_UtilityLights();
      this.hgyi56_EVS_EnsureIsDisabled_UtilityLights();
    }
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_EnsureIsActive_UtilityLights() {
  let vehCtrl: ref<vehicleController> = this.GetVehicleController();
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !IsDefined(vehCtrl) || !IsDefined(vehicle) {
    return;
  }

  if this.GetPS().m_hgyi56_EVS_auxiliaryState && !this.GetPS().m_hgyi56_EVS_isPoliceVehicle {
    this.hgyi56_EVS_ApplyUtilityLightsSettingsChange();
    vehCtrl.ToggleLights(this.GetPS().m_hgyi56_EVS_auxiliaryState, vehicleELightType.Utility);
    // FTLog(s"Ensure utility lights active -> \(this.GetPS().m_hgyi56_EVS_auxiliaryState)");
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_EnsureIsDisabled_UtilityLights() {
  let vehCtrl: ref<vehicleController> = this.GetVehicleController();
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !IsDefined(vehCtrl) || !IsDefined(vehicle) {
    return;
  }

  if !this.GetPS().m_hgyi56_EVS_auxiliaryState && !this.GetPS().m_hgyi56_EVS_isPoliceVehicle {
    this.hgyi56_EVS_UpdateActiveEffectIdentifier(vehicleELightType.Utility);
    vehCtrl.ToggleLights(this.GetPS().m_hgyi56_EVS_auxiliaryState, vehicleELightType.Utility);
    // FTLog(s"Ensure utility lights disabled -> \(this.GetPS().m_hgyi56_EVS_auxiliaryState)");
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_TogglePlayerMounted(toggle: Bool) {
  if NotEquals(this.GetPS().m_hgyi56_EVS_playerIsMounted, toggle) {
    this.GetPS().m_hgyi56_EVS_playerIsMounted = toggle;
    // FTLog(s"Set player mounted -> \(this.GetPS().m_hgyi56_EVS_playerIsMounted)");
  }

  if !toggle {
    this.GetPS().m_hgyi56_EVS_playerIsMountedFromPassengerSeat = false;
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_ToggleDashboard(toggle: Bool) {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  if !IsDefined(vehicle) {
    return;
  }

  if toggle {
    vehicle.SetInteriorUIEnabled(toggle); // Enable widgets
  }
  else {
    vehicle.GetBlackboard().SetBool(GetAllBlackboardDefs().Vehicle.IsUIActive, false);
    vehicle.GetBlackboard().FireCallbacks();
  }
  // FTLog(s"Set dashboard -> \(toggle)");
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_Ensure_VehicleState(state: vehicleEState) {
  let vehCtrlPS: ref<vehicleControllerPS> = this.GetVehicleControllerPS();
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !IsDefined(vehCtrlPS) || !IsDefined(vehicle) {
    return;
  }

  if NotEquals(vehCtrlPS.GetState(), state) {
    vehCtrlPS.SetState(state);
    // FTLog(s"Set vehicle state -> \(state)");
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_OnEnter_CrystalDomeMesh() {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = GetGameInstance();
    
  if !IsDefined(vehicle) {
    return;
  }
  
  if IsDefined(this.GetPS().m_hgyi56_EVS_crystalDomeMeshTimings) {
    let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gi).GetLocalPlayerMainGameObject() as PlayerPuppet;
    let fastEntryMultiplier: Float = player.IsInCombat() ? 0.60 : 1.00;

    let event: ref<CrystalDomeMeshEvent> = new CrystalDomeMeshEvent();
    event.tppEnabled = this.GetPS().GetCrystalDomeState(); // While entering we are always using FPP, so it depends on CrystalDome state
    GameInstance.GetDelaySystem(gi).DelayEvent(vehicle, event, this.GetPS().m_hgyi56_EVS_crystalDomeMeshTimings.FL_in * fastEntryMultiplier, true);
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_OnPassengerEnter_CrystalDomeMesh() {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = GetGameInstance();
    
  if !IsDefined(vehicle) {
    return;
  }
  
  if IsDefined(this.GetPS().m_hgyi56_EVS_crystalDomeMeshTimings) {
    let event: ref<CrystalDomeMeshEvent> = new CrystalDomeMeshEvent();
    event.tppEnabled = this.GetPS().GetCrystalDomeState(); // While entering we are always using FPP, so it depends on CrystalDome state
    GameInstance.GetDelaySystem(gi).DelayEvent(vehicle, event, this.GetPS().m_hgyi56_EVS_crystalDomeMeshTimings.FR_in, true);
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_OnExit_CrystalDomeMesh() {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = GetGameInstance();
    
  if !IsDefined(vehicle) {
    return;
  }

  if IsDefined(this.GetPS().m_hgyi56_EVS_crystalDomeMeshTimings) {
    let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gi).GetLocalPlayerMainGameObject() as PlayerPuppet;
    let fastExitTiming: Float = player.IsInCombat() ? this.m_hgyi56_EVS_vehicleDataPackage.CombatEntering() / this.m_hgyi56_EVS_vehicleDataPackage.Entering() : 1.00;

    let event: ref<CrystalDomeMeshEvent> = new CrystalDomeMeshEvent();
    event.tppEnabled = false;
    GameInstance.GetDelaySystem(gi).DelayEvent(vehicle, event, this.GetPS().m_hgyi56_EVS_crystalDomeMeshTimings.FL_out * fastExitTiming, true);
  }
}

// This method will cycle doors only if their previous state before entering/exiting is the opposite
@addMethod(VehicleComponent)
private final func hgyi56_EVS_RecallVehicleDoorsState(opt autoCloseDelay: Float, opt m_hgyi56_EVS_shouldOpenWindow: Bool) -> Void {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = GetGameInstance();
  let PSVehicleDoorCloseRequest: ref<VehicleDoorClose>;

  if !IsDefined(vehicle) {
    return;
  }

  if NotEquals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_left), this.GetPS().m_hgyi56_EVS_FL_doorState)
  || (this.GetPS().m_hgyi56_EVS_isSingleFrontDoor && NotEquals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_right), this.GetPS().m_hgyi56_EVS_FL_doorState)) {
    if Equals(this.GetPS().m_hgyi56_EVS_FL_doorState, VehicleDoorState.Open) {
      VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetDriverSlotID());
    }
    else {
      if autoCloseDelay > 0.00 {
        PSVehicleDoorCloseRequest = new VehicleDoorClose();
        PSVehicleDoorCloseRequest.slotID = VehicleComponent.GetDriverSlotName();
        PSVehicleDoorCloseRequest.m_hgyi56_EVS_shouldOpenWindow = m_hgyi56_EVS_shouldOpenWindow;
        GameInstance.GetDelaySystem(gi).DelayPSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), PSVehicleDoorCloseRequest, autoCloseDelay, true);
      }
      else {
        VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetDriverSlotID());
      }
    }
  }
  
  if !this.GetPS().m_hgyi56_EVS_isSingleFrontDoor && NotEquals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_right), this.GetPS().m_hgyi56_EVS_FR_doorState) {
    if Equals(this.GetPS().m_hgyi56_EVS_FR_doorState, VehicleDoorState.Open) {
      VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetFrontPassengerSlotID());
    }
    else {
      if autoCloseDelay > 0.00 {
        PSVehicleDoorCloseRequest = new VehicleDoorClose();
        PSVehicleDoorCloseRequest.slotID = VehicleComponent.GetFrontPassengerSlotName();
        PSVehicleDoorCloseRequest.m_hgyi56_EVS_shouldOpenWindow = m_hgyi56_EVS_shouldOpenWindow;
        GameInstance.GetDelaySystem(gi).DelayPSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), PSVehicleDoorCloseRequest, autoCloseDelay, true);
      }
      else {
        VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetFrontPassengerSlotID());
      }
    }
  }
  
  if NotEquals(this.GetPS().GetDoorState(EVehicleDoor.seat_back_left), this.GetPS().m_hgyi56_EVS_BL_doorState) {
    if Equals(this.GetPS().m_hgyi56_EVS_BL_doorState, VehicleDoorState.Open) {
      VehicleComponent.OpenDoor(vehicle, VehicleComponent.hgyi56_EVS_GetBackLeftPassengerSlotID());
    }
    else {
      if autoCloseDelay > 0.00 {
        PSVehicleDoorCloseRequest = new VehicleDoorClose();
        PSVehicleDoorCloseRequest.slotID = VehicleComponent.GetBackLeftPassengerSlotName();
        PSVehicleDoorCloseRequest.m_hgyi56_EVS_shouldOpenWindow = m_hgyi56_EVS_shouldOpenWindow;
        GameInstance.GetDelaySystem(gi).DelayPSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), PSVehicleDoorCloseRequest, autoCloseDelay, true);
      }
      else {
        VehicleComponent.CloseDoor(vehicle, VehicleComponent.hgyi56_EVS_GetBackLeftPassengerSlotID());
      }
    }
  }
  
  if NotEquals(this.GetPS().GetDoorState(EVehicleDoor.seat_back_right), this.GetPS().m_hgyi56_EVS_BR_doorState) {
    if Equals(this.GetPS().m_hgyi56_EVS_BR_doorState, VehicleDoorState.Open) {
      VehicleComponent.OpenDoor(vehicle, VehicleComponent.hgyi56_EVS_GetBackRightPassengerSlotID());
    }
    else {
      if autoCloseDelay > 0.00 {
        PSVehicleDoorCloseRequest = new VehicleDoorClose();
        PSVehicleDoorCloseRequest.slotID = VehicleComponent.GetBackRightPassengerSlotName();
        PSVehicleDoorCloseRequest.m_hgyi56_EVS_shouldOpenWindow = m_hgyi56_EVS_shouldOpenWindow;
        GameInstance.GetDelaySystem(gi).DelayPSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), PSVehicleDoorCloseRequest, autoCloseDelay, true);
      }
      else {
        VehicleComponent.CloseDoor(vehicle, VehicleComponent.hgyi56_EVS_GetBackRightPassengerSlotID());
      }
    }
  }
}

@addMethod(VehicleComponent)
private final func hgyi56_EVS_Recall_FL_WindowsState() -> Void {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = GetGameInstance();
    
  if !IsDefined(vehicle) {
    return;
  }

  let FL_doorState: VehicleDoorState = this.GetPS().GetDoorState(EVehicleDoor.seat_front_left);
  let FL_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_front_left);

  if NotEquals(FL_windowState, this.GetPS().m_hgyi56_EVS_FL_windowState) {

    if Equals(this.GetPS().m_hgyi56_EVS_FL_windowState, EVehicleWindowState.Closed) {
      VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.GetDriverSlotID(), false);
    }
    else if this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow && Equals(FL_doorState, VehicleDoorState.Closed) {
      VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.GetDriverSlotID(), true);
    }
  }
}

@addMethod(VehicleComponent)
private final func hgyi56_EVS_Recall_FR_WindowsState() -> Void {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = GetGameInstance();
    
  if !IsDefined(vehicle) {
    return;
  }

  let FR_doorState: VehicleDoorState = this.GetPS().GetDoorState(this.GetPS().m_hgyi56_EVS_isSingleFrontDoor ? EVehicleDoor.seat_front_left: EVehicleDoor.seat_front_right);
  let FR_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_front_right);

  if NotEquals(FR_windowState, this.GetPS().m_hgyi56_EVS_FR_windowState) {

    if Equals(this.GetPS().m_hgyi56_EVS_FR_windowState, EVehicleWindowState.Closed) {
      VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.GetFrontPassengerSlotID(), false);
    }
    else if this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow && Equals(FR_doorState, VehicleDoorState.Closed) {
      VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.GetFrontPassengerSlotID(), true);
    }
  }
}

@addMethod(VehicleComponent)
private final func hgyi56_EVS_CloseWindow(slotId: MountingSlotId) -> Void {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = GetGameInstance();
    
  if !IsDefined(vehicle) {
    return;
  }

  let doorEnum: EVehicleDoor = EVehicleDoor.invalid;

  this.GetVehicleDoorEnum(doorEnum, slotId.id);

  if Equals(this.GetPS().GetWindowState(doorEnum), EVehicleWindowState.Open) {
    VehicleComponent.ToggleVehicleWindow(gi, vehicle, slotId, false);
  }
}

// This method will cycle front windows only if their previous state before entering/exiting is the opposite
@addMethod(VehicleComponent)
private final func hgyi56_EVS_ForceFrontWindowsDuringCombat(FL_doorState: VehicleDoorState, FR_doorState: VehicleDoorState) -> Void {

  if !this.GetPS().m_hgyi56_EVS_hasWindows {
    return;
  }

  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = GetGameInstance();
    
  if !IsDefined(vehicle) {
    return;
  }

  if this.GetPS().m_hgyi56_EVS_isSingleFrontDoor {
    FR_doorState = FL_doorState;
  }

  let FL_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_front_left);
  let FR_windowState: EVehicleWindowState = this.GetPS().GetWindowState(EVehicleDoor.seat_front_right);

  if this.GetPS().m_hgyi56_EVS_isSlidingDoors || this.GetPS().m_hgyi56_EVS_isSingleFrontDoor {
    // Sliding doors: only force windows open even if doors are closed
    if Equals(FL_doorState, VehicleDoorState.Closed)
    && Equals(FL_windowState, EVehicleWindowState.Closed) {
      VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.GetDriverSlotID(), true);
    }
    if Equals(FR_doorState, VehicleDoorState.Closed)
    && Equals(FR_windowState, EVehicleWindowState.Closed) {
      VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.GetFrontPassengerSlotID(), true);
    }
  }
  else { // Hinged doors: always force windows open even if doors are open
    if Equals(FL_windowState, EVehicleWindowState.Closed) {
      VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.GetDriverSlotID(), true);
    }
    if Equals(FR_windowState, EVehicleWindowState.Closed) {
      VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.GetFrontPassengerSlotID(), true);
    }
  }
}

@addMethod(VehicleComponent)
public final static func hgyi56_EVS_GetBackLeftPassengerSlotID() -> MountingSlotId {
  let slotID: MountingSlotId;
  slotID.id = n"seat_back_left";
  return slotID;
}

@addMethod(VehicleComponent)
public final static func hgyi56_EVS_GetBackRightPassengerSlotID() -> MountingSlotId {
  let slotID: MountingSlotId;
  slotID.id = n"seat_back_right";
  return slotID;
}

@addMethod(VehicleComponent)
public final static func hgyi56_EVS_GetHoodSlotID() -> MountingSlotId {
  let slotID: MountingSlotId;
  slotID.id = n"hood";
  return slotID;
}

@addMethod(VehicleComponent)
public final static func hgyi56_EVS_GetTrunkSlotID() -> MountingSlotId {
  let slotID: MountingSlotId;
  slotID.id = n"trunk";
  return slotID;
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_ToColor(colorArray: array<Int32>) -> Color {

  let customRed = Cast<Uint8>(colorArray[0]);
  let customGreen = Cast<Uint8>(colorArray[1]);
  let customBlue = Cast<Uint8>(colorArray[2]);
  
  return new Color(customRed, customGreen, customBlue, Cast<Uint8>(0));
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_IsAfter(time1: GameTime, time2: GameTime) -> Bool {

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
public func hgyi56_EVS_IsHeadlightsOff() -> Bool {
  let vehCtrlPS: ref<vehicleControllerPS> = this.GetVehicleControllerPS();
  let vehicle: ref<VehicleObject> = this.GetVehicle();
    
  if !IsDefined(vehCtrlPS) || !IsDefined(vehicle) {
    return false;
  }

  return Equals(vehCtrlPS.GetHeadLightMode(), vehicleELightMode.Off);
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_ShouldApplyReverseLights() -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  if !IsDefined(vehicle) {
    return false;
  }

  return vehicle.GetCurrentSpeed() < -0.10 && !this.m_hgyi56_EVS_reverseLightsUpdatedSinceLastReverse && Equals(this.m_hgyi56_EVS_vehicleMomentumType, EMomentumType.Accelerate);
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_GameTimeToString(time: GameTime) -> String {
  return s"\(GameTime.Hours(time)):\(GameTime.Minutes(time)):\(GameTime.Seconds(time))";
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_GameTimeEquals(time1: GameTime, time2: GameTime) -> Bool {

  // Check if times are the same more or less few seconds because the in game time is not 1:1 with reality
  if GameTime.Hours(time1) == GameTime.Hours(time2)
  && GameTime.Minutes(time1) == GameTime.Minutes(time2)
  && Abs(GameTime.Seconds(time1) - GameTime.Seconds(time2)) <= 10 {
    return true;
  }
  
  return false;
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_ResetLightsDefaultColor(instant: Bool, lightType: vehicleELightType) -> Void {
  let gi: GameInstance = GetGameInstance();
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  let vehCtrl: ref<vehicleController> = this.GetVehicleController();
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !IsDefined(vehCtrl) || !IsDefined(vehicle) {
    return;
  }

  if !MyModSettings.Get(gi).autoResetLightColorEnabled()
  && !player.m_hgyi56_EVS_customLightsAreBeingToggled {
    return;
  }

  let sequenceSpeed: Float = this.hgyi56_EVS_GetLightsSequenceSpeed(lightType);
  let defaultColor: Color = this.hgyi56_EVS_TryGetDefaultLightsColor(lightType);
  let isDefaultColor: Bool = this.hgyi56_EVS_GetLightsIsDefaultColor(lightType);

  let delay: Float = instant ? 0.00 : sequenceSpeed;

  if !isDefaultColor {

    if this.hgyi56_EVS_IsColorDefined(defaultColor) {
      vehCtrl.SetLightColor(lightType, defaultColor, delay);
    }
    else {
      vehCtrl.ResetLightColor(lightType, delay);
    }

    this.hgyi56_EVS_SetLightsIsDefaultColor(true, lightType);
  }
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_ResetLightsDefaultIntensity(instant: Bool, lightType: vehicleELightType) -> Void {
  let sequenceSpeed: Float = this.hgyi56_EVS_GetLightsSequenceSpeed(lightType);
  let isDefaultIntensity: Bool = this.hgyi56_EVS_GetLightsIsDefaultIntensity(lightType);
  let vehCtrl: ref<vehicleController> = this.GetVehicleController();
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !IsDefined(vehCtrl) || !IsDefined(vehicle) {
    return;
  }

  let delay: Float = instant ? 0.00 : sequenceSpeed;

  if !isDefaultIntensity {
    vehCtrl.ResetLightStrength(lightType, delay);
    this.hgyi56_EVS_SetLightsIsDefaultIntensity(true, lightType);
  }
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_ShouldApplyCrystalCoatLightColor(lightType: vehicleELightType) -> Bool {
  let colorType: ECrystalCoatColorType = this.hgyi56_EVS_GetCrystalCoatColorType(lightType);
  
  return this.hgyi56_EVS_GetCrystalCoatLightsIncluded(lightType)
      && this.hgyi56_EVS_GetCrystalCoatLightsColorTypeDefined(colorType);
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_ApplyLightsParameters(instant: Bool, minimalIntensity: Bool, nullIntensity: Bool, lightType: vehicleELightType, opt inputColor: Color) -> Void {
  let vehCtrl: ref<vehicleController> = this.GetVehicleController();
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !IsDefined(vehCtrl) || !IsDefined(vehicle) {
    return;
  }

  let delay: Float = instant ? 0.00 : this.hgyi56_EVS_GetLightsSequenceSpeed(lightType);

  let inputColorDefined: Bool = this.hgyi56_EVS_IsColorDefined(inputColor);
  let color: Color = inputColorDefined ? inputColor : this.hgyi56_EVS_GetLightsCustomColor(lightType);  

  if inputColorDefined {
    this.hgyi56_EVS_SetLightsIsDefaultColor(false, lightType);    
    vehCtrl.SetLightColor(lightType, inputColor, delay);
  }
  else if this.hgyi56_EVS_GetLightsCustomColorEnabled(lightType) || this.hgyi56_EVS_ShouldApplyCrystalCoatLightColor(lightType) {
    this.hgyi56_EVS_SetLightsIsDefaultColor(false, lightType);    
    vehCtrl.SetLightColor(lightType, color, delay);
  }
  else {
    this.hgyi56_EVS_ResetLightsDefaultColor(instant, lightType);
  }

  if nullIntensity {
    this.hgyi56_EVS_SetLightsIsDefaultIntensity(false, lightType);
    vehCtrl.SetLightStrength(lightType, 0.00, delay);
  }
  else if minimalIntensity {
    this.hgyi56_EVS_SetLightsIsDefaultIntensity(false, lightType);
    vehCtrl.SetLightStrength(lightType, this.m_hgyi56_EVS_minimalIntensity, delay);
  }
  else if this.hgyi56_EVS_GetLightsCustomIntensityEnabled(lightType) {
    this.hgyi56_EVS_SetLightsIsDefaultIntensity(false, lightType);
    vehCtrl.SetLightStrength(lightType, Cast<Float>(this.hgyi56_EVS_GetLightsCustomIntensity(lightType)) / 100.0, delay);
  }
  else {
    this.hgyi56_EVS_ResetLightsDefaultIntensity(instant, lightType);
  }
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_ResetLightsParameters(instant: Bool, lightType: vehicleELightType) -> Void {
  this.hgyi56_EVS_ResetLightsDefaultColor(instant, lightType);
  this.hgyi56_EVS_ResetLightsDefaultIntensity(instant, lightType);
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_GetLightsCustomColor(lightType: vehicleELightType) -> Color {
  let gi: GameInstance = GetGameInstance();
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  let settings: ref<MyModSettings> = MyModSettings.Get(gi);
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !IsDefined(player) || !IsDefined(vehicle) {
    return this.hgyi56_EVS_GetBlackColor();
  }

  let vvcComp: ref<vehicleVisualCustomizationComponent> = player.GetVehicleVisualCustomizationComponent();

  if !IsDefined(vvcComp) {
    return this.hgyi56_EVS_GetBlackColor();
  }

  let customRed: Uint8;
  let customGreen: Uint8;
  let customBlue: Uint8;

  // If crystal coat is active and light type is included and definition color is defined
  if this.hgyi56_EVS_ShouldApplyCrystalCoatLightColor(lightType) {
    
    let colorTemplate: VehicleVisualCustomizationTemplate = this.GetPS().GetVehicleVisualCustomizationTemplate();
    let colorType: ECrystalCoatColorType = this.hgyi56_EVS_GetCrystalCoatColorType(lightType);

    switch colorType {
      case ECrystalCoatColorType.Primary:
        return new Color(colorTemplate.genericData.primaryColorR, colorTemplate.genericData.primaryColorG, colorTemplate.genericData.primaryColorB, Cast<Uint8>(255));
        break;
        
      case ECrystalCoatColorType.Secondary:
        return new Color(colorTemplate.genericData.secondaryColorR, colorTemplate.genericData.secondaryColorG, colorTemplate.genericData.secondaryColorB, Cast<Uint8>(255));
        break;

      case ECrystalCoatColorType.Lights:
        return Color.HSBToColor(colorTemplate.genericData.lightsColorHue, false, 0.50, 1.00);
        break;
    }
  }

  switch lightType {
    case vehicleELightType.Utility:
      customRed = Cast<Uint8>(settings.utilitylights_LightColorRed());
      customGreen = Cast<Uint8>(settings.utilitylights_LightColorGreen());
      customBlue = Cast<Uint8>(settings.utilitylights_LightColorBlue());
      break;
      
    case vehicleELightType.Head:
      customRed = Cast<Uint8>(settings.headlights_LightColorRed());
      customGreen = Cast<Uint8>(settings.headlights_LightColorGreen());
      customBlue = Cast<Uint8>(settings.headlights_LightColorBlue());
      break;
      
    case vehicleELightType.Brake:
      customRed = Cast<Uint8>(settings.taillights_LightColorRed());
      customGreen = Cast<Uint8>(settings.taillights_LightColorGreen());
      customBlue = Cast<Uint8>(settings.taillights_LightColorBlue());
      break;
      
    case vehicleELightType.Blinkers:
      customRed = Cast<Uint8>(settings.blinkerlights_LightColorRed());
      customGreen = Cast<Uint8>(settings.blinkerlights_LightColorGreen());
      customBlue = Cast<Uint8>(settings.blinkerlights_LightColorBlue());
      break;
      
    case vehicleELightType.Reverse:
      customRed = Cast<Uint8>(settings.reverselights_LightColorRed());
      customGreen = Cast<Uint8>(settings.reverselights_LightColorGreen());
      customBlue = Cast<Uint8>(settings.reverselights_LightColorBlue());
      break;
      
    case vehicleELightType.Interior:
      customRed = Cast<Uint8>(settings.interiorlights_LightColorRed());
      customGreen = Cast<Uint8>(settings.interiorlights_LightColorGreen());
      customBlue = Cast<Uint8>(settings.interiorlights_LightColorBlue());
      break;
  }
  
  return new Color(customRed, customGreen, customBlue, Cast<Uint8>(255));
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_GetLightsCycleColor(lightType: vehicleELightType) -> Color {
  let gi: GameInstance = GetGameInstance();
  let settings: ref<MyModSettings> = MyModSettings.Get(gi);
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  if !IsDefined(vehicle) {
    return this.hgyi56_EVS_GetBlackColor();
  }

  let cycleRed: Uint8;
  let cycleGreen: Uint8;
  let cycleBlue: Uint8;

  switch lightType {
    case vehicleELightType.Utility:
      cycleRed = Cast<Uint8>(settings.utilitylights_CycleColorRed());
      cycleGreen = Cast<Uint8>(settings.utilitylights_CycleColorGreen());
      cycleBlue = Cast<Uint8>(settings.utilitylights_CycleColorBlue());
      break;
      
    case vehicleELightType.Head:
      cycleRed = Cast<Uint8>(settings.headlights_CycleColorRed());
      cycleGreen = Cast<Uint8>(settings.headlights_CycleColorGreen());
      cycleBlue = Cast<Uint8>(settings.headlights_CycleColorBlue());
      break;
      
    case vehicleELightType.Brake:
      cycleRed = Cast<Uint8>(settings.taillights_CycleColorRed());
      cycleGreen = Cast<Uint8>(settings.taillights_CycleColorGreen());
      cycleBlue = Cast<Uint8>(settings.taillights_CycleColorBlue());
      break;
      
    case vehicleELightType.Blinkers:
      cycleRed = Cast<Uint8>(settings.blinkerlights_CycleColorRed());
      cycleGreen = Cast<Uint8>(settings.blinkerlights_CycleColorGreen());
      cycleBlue = Cast<Uint8>(settings.blinkerlights_CycleColorBlue());
      break;
      
    case vehicleELightType.Reverse:
      cycleRed = Cast<Uint8>(settings.reverselights_CycleColorRed());
      cycleGreen = Cast<Uint8>(settings.reverselights_CycleColorGreen());
      cycleBlue = Cast<Uint8>(settings.reverselights_CycleColorBlue());
      break;
      
    case vehicleELightType.Interior:
      cycleRed = Cast<Uint8>(settings.interiorlights_CycleColorRed());
      cycleGreen = Cast<Uint8>(settings.interiorlights_CycleColorGreen());
      cycleBlue = Cast<Uint8>(settings.interiorlights_CycleColorBlue());
      break;
  }
  
  return new Color(cycleRed, cycleGreen, cycleBlue, Cast<Uint8>(255));
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_TryGetDefaultLightsColor(lightType: vehicleELightType) -> Color {
  let defaultColor: Color;

  switch lightType {
    case vehicleELightType.Utility:
      defaultColor = this.hgyi56_EVS_ToColor(this.m_hgyi56_EVS_vehicleRecord.UtilityLightColor());
      break;
      
    case vehicleELightType.Head:
      defaultColor = this.hgyi56_EVS_ToColor(this.m_hgyi56_EVS_vehicleRecord.HeadlightColor());
      break;
      
    case vehicleELightType.Brake:
      defaultColor = this.hgyi56_EVS_ToColor(this.m_hgyi56_EVS_vehicleRecord.BrakelightColor());
      break;
      
    case vehicleELightType.Blinkers:
      defaultColor = this.hgyi56_EVS_ToColor(this.m_hgyi56_EVS_vehicleRecord.LeftBlinkerlightColor());
      break;
      
    case vehicleELightType.Reverse:
      defaultColor = this.hgyi56_EVS_ToColor(this.m_hgyi56_EVS_vehicleRecord.ReverselightColor());
      break;
      
    case vehicleELightType.Interior:
      defaultColor = this.hgyi56_EVS_ToColor(this.m_hgyi56_EVS_vehicleRecord.InteriorDamageColor());
      break;
  }

  return defaultColor;
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_GetBlackColor() -> Color {

  let zero: Uint8 = Cast<Uint8>(0);
  
  return new Color(zero, zero, zero, zero);
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_GetLightsSequenceSpeed(lightType: vehicleELightType) -> Float {
  let gi: GameInstance = GetGameInstance();
  let settings: ref<MyModSettings> = MyModSettings.Get(gi);

  let sequenceSpeed: Float;

  switch lightType {
    case vehicleELightType.Utility:
      sequenceSpeed = settings.utilitylights_SequenceLatency();
      break;
      
    case vehicleELightType.Head:
      sequenceSpeed = settings.headlights_SequenceLatency();
      break;
      
    case vehicleELightType.Brake:
      sequenceSpeed = settings.taillights_SequenceLatency();
      break;
      
    case vehicleELightType.Blinkers:
      sequenceSpeed = settings.blinkerlights_SequenceLatency();
      break;
      
    case vehicleELightType.Reverse:
      sequenceSpeed = settings.reverselights_SequenceLatency();
      break;
      
    case vehicleELightType.Interior:
      sequenceSpeed = settings.interiorlights_SequenceLatency();
      break;
  }

  return sequenceSpeed;
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_SetLightsSequenceSpeed(value: Float, lightType: vehicleELightType) {
  let gi: GameInstance = GetGameInstance();
  let settings: ref<MyModSettings> = MyModSettings.Get(gi);
  
  switch lightType {
    case vehicleELightType.Utility:
      settings.utilitylights_SequenceLatency() = value;
      break;
      
    case vehicleELightType.Head:
      settings.headlights_SequenceLatency() = value;
      break;
      
    case vehicleELightType.Brake:
      settings.taillights_SequenceLatency() = value;
      break;
      
    case vehicleELightType.Blinkers:
      settings.blinkerlights_SequenceLatency() = value;
      break;
      
    case vehicleELightType.Reverse:
      settings.reverselights_SequenceLatency() = value;
      break;
      
    case vehicleELightType.Interior:
      settings.interiorlights_SequenceLatency() = value;
      break;
  }
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_GetLightsIsDefaultColor(lightType: vehicleELightType) -> Bool {
  let isDefaultColor: Bool;

  switch lightType {
    case vehicleELightType.Utility:
      isDefaultColor = this.m_hgyi56_EVS_utilityLightsIsDefaultColor;
      break;
      
    case vehicleELightType.Head:
      isDefaultColor = this.m_hgyi56_EVS_headlightsIsDefaultColor;
      break;
      
    case vehicleELightType.Brake:
      isDefaultColor = this.m_hgyi56_EVS_tailLightsIsDefaultColor;
      break;
      
    case vehicleELightType.Blinkers:
      isDefaultColor = this.m_hgyi56_EVS_blinkerLightsIsDefaultColor;
      break;
      
    case vehicleELightType.Reverse:
      isDefaultColor = this.m_hgyi56_EVS_reverseLightsIsDefaultColor;
      break;
      
    case vehicleELightType.Interior:
      isDefaultColor = this.m_hgyi56_EVS_interiorLightsIsDefaultColor;
      break;
  }

  return isDefaultColor;
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_GetCrystalCoatLightsIncluded(lightType: vehicleELightType) -> Bool {
  let gi: GameInstance = GetGameInstance();
  let settings: ref<MyModSettings> = MyModSettings.Get(gi);

  switch lightType {
    case vehicleELightType.Utility:
      return settings.utilitylights_CrystalCoatInclude();
      break;
      
    case vehicleELightType.Head:
      return settings.headlights_CrystalCoatInclude();
      break;
      
    case vehicleELightType.Brake:
      return settings.taillights_CrystalCoatInclude();
      break;
      
    case vehicleELightType.Blinkers:
      return settings.blinkerlights_CrystalCoatInclude();
      break;
      
    case vehicleELightType.Reverse:
      return settings.reverselights_CrystalCoatInclude();
      break;
      
    case vehicleELightType.Interior:
      return settings.interiorlights_CrystalCoatInclude();
      break;
  }

  return false;
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_GetCrystalCoatLightsColorTypeDefined(colorType: ECrystalCoatColorType) -> Bool {

  let colorTemplate: VehicleVisualCustomizationTemplate = this.GetPS().GetVehicleVisualCustomizationTemplate();

  switch colorType {
    case ECrystalCoatColorType.Primary:
      // Primary color shall be considered as defined only if the crystal coat is activated
      return colorTemplate.genericData.primaryColorDefined && this.hgyi56_EVS_IsCrystalCoatActive();
      break;
      
    case ECrystalCoatColorType.Secondary:
      // Secondary color shall be considered as defined only if the crystal coat is activated
      return colorTemplate.genericData.secondaryColorDefined && this.hgyi56_EVS_IsCrystalCoatActive();
      break;
      
    case ECrystalCoatColorType.Lights:
      // "Lights color" can always be defined with the Cosmetic_Troll feature so it does not imply to activate crystal coat
      return colorTemplate.genericData.lightsColorDefined;
      break;
  }

  return false;
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_GetCrystalCoatColorType(lightType: vehicleELightType) -> ECrystalCoatColorType {
  let gi: GameInstance = GetGameInstance();
  let settings: ref<MyModSettings> = MyModSettings.Get(gi);

  switch lightType {
    case vehicleELightType.Utility:
      return settings.utilitylights_CrystalCoatColorType();
      break;
      
    case vehicleELightType.Head:
      return settings.headlights_CrystalCoatColorType();
      break;
      
    case vehicleELightType.Brake:
      return settings.taillights_CrystalCoatColorType();
      break;
      
    case vehicleELightType.Blinkers:
      return settings.blinkerlights_CrystalCoatColorType();
      break;
      
    case vehicleELightType.Reverse:
      return settings.reverselights_CrystalCoatColorType();
      break;
      
    case vehicleELightType.Interior:
      return settings.interiorlights_CrystalCoatColorType();
      break;
  }
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_SetLightsIsDefaultColor(value: Bool, lightType: vehicleELightType) {
  switch lightType {
    case vehicleELightType.Utility:
      this.m_hgyi56_EVS_utilityLightsIsDefaultColor = value;
      break;
      
    case vehicleELightType.Head:
      this.m_hgyi56_EVS_headlightsIsDefaultColor = value;
      break;
      
    case vehicleELightType.Brake:
      this.m_hgyi56_EVS_tailLightsIsDefaultColor = value;
      break;
      
    case vehicleELightType.Blinkers:
      this.m_hgyi56_EVS_blinkerLightsIsDefaultColor = value;
      break;
      
    case vehicleELightType.Reverse:
      this.m_hgyi56_EVS_reverseLightsIsDefaultColor = value;
      break;
      
    case vehicleELightType.Interior:
      this.m_hgyi56_EVS_interiorLightsIsDefaultColor = value;
      break;
  }
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_GetLightsIsDefaultIntensity(lightType: vehicleELightType) -> Bool {
  let isDefaultColor: Bool;

  switch lightType {
    case vehicleELightType.Utility:
      isDefaultColor = this.m_hgyi56_EVS_utilityLightsIsDefaultIntensity;
      break;
      
    case vehicleELightType.Head:
      isDefaultColor = this.m_hgyi56_EVS_headlightsIsDefaultIntensity;
      break;
      
    case vehicleELightType.Brake:
      isDefaultColor = this.m_hgyi56_EVS_tailLightsIsDefaultIntensity;
      break;
      
    case vehicleELightType.Blinkers:
      isDefaultColor = this.m_hgyi56_EVS_blinkerLightsIsDefaultIntensity;
      break;
      
    case vehicleELightType.Reverse:
      isDefaultColor = this.m_hgyi56_EVS_reverseLightsIsDefaultIntensity;
      break;
      
    case vehicleELightType.Interior:
      isDefaultColor = this.m_hgyi56_EVS_interiorLightsIsDefaultIntensity;
      break;
  }

  return isDefaultColor;
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_SetLightsIsDefaultIntensity(value: Bool, lightType: vehicleELightType) {
  switch lightType {
    case vehicleELightType.Utility:
      this.m_hgyi56_EVS_utilityLightsIsDefaultIntensity = value;
      break;
      
    case vehicleELightType.Head:
      this.m_hgyi56_EVS_headlightsIsDefaultIntensity = value;
      break;
      
    case vehicleELightType.Brake:
      this.m_hgyi56_EVS_tailLightsIsDefaultIntensity = value;
      break;
      
    case vehicleELightType.Blinkers:
      this.m_hgyi56_EVS_blinkerLightsIsDefaultIntensity = value;
      break;
      
    case vehicleELightType.Reverse:
      this.m_hgyi56_EVS_reverseLightsIsDefaultIntensity = value;
      break;
      
    case vehicleELightType.Interior:
      this.m_hgyi56_EVS_interiorLightsIsDefaultIntensity = value;
      break;
  }
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_GetLightsCustomIntensity(lightType: vehicleELightType) -> Int32 {
  let gi: GameInstance = GetGameInstance();
  let settings: ref<MyModSettings> = MyModSettings.Get(gi);

  let intensity: Int32;

  switch lightType {
    case vehicleELightType.Utility:
      intensity = settings.utilitylights_LightIntensity();
      break;
      
    case vehicleELightType.Head:
      intensity = settings.headlights_LightIntensity();
      break;
      
    case vehicleELightType.Brake:
      intensity = settings.taillights_LightIntensity();
      break;
      
    case vehicleELightType.Blinkers:
      intensity = settings.blinkerlights_LightIntensity();
      break;
      
    case vehicleELightType.Reverse:
      intensity = settings.reverselights_LightIntensity();
      break;
      
    case vehicleELightType.Interior:
      intensity = settings.interiorlights_LightIntensity();
      break;
  }

  return intensity;
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_GetLightsCustomColorEnabled(lightType: vehicleELightType) -> Bool {
  let gi: GameInstance = GetGameInstance();
  let settings: ref<MyModSettings> = MyModSettings.Get(gi);

  let enabled: Bool;

  switch lightType {
    case vehicleELightType.Utility:
      enabled = settings.utilitylights_LightColorEnabled();
      break;
      
    case vehicleELightType.Head:
      enabled = settings.headlights_LightColorEnabled();
      break;
      
    case vehicleELightType.Brake:
      enabled = settings.taillights_LightColorEnabled();
      break;
      
    case vehicleELightType.Blinkers:
      enabled = settings.blinkerlights_LightColorEnabled();
      break;
      
    case vehicleELightType.Reverse:
      enabled = settings.reverselights_LightColorEnabled();
      break;
      
    case vehicleELightType.Interior:
      enabled = settings.interiorlights_LightColorEnabled();
      break;
  }

  return enabled;
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_GetLightsCustomIntensityEnabled(lightType: vehicleELightType) -> Bool {
  let gi: GameInstance = GetGameInstance();
  let settings: ref<MyModSettings> = MyModSettings.Get(gi);

  let enabled: Bool;

  switch lightType {
    case vehicleELightType.Utility:
      enabled = settings.utilitylights_LightIntensityEnabled();
      break;
      
    case vehicleELightType.Head:
      enabled = settings.headlights_LightIntensityEnabled();
      break;
      
    case vehicleELightType.Brake:
      enabled = settings.taillights_LightIntensityEnabled();
      break;
      
    case vehicleELightType.Blinkers:
      enabled = settings.blinkerlights_LightIntensityEnabled();
      break;
      
    case vehicleELightType.Reverse:
      enabled = settings.reverselights_LightIntensityEnabled();
      break;
      
    case vehicleELightType.Interior:
      enabled = settings.interiorlights_LightIntensityEnabled();
      break;
  }

  return enabled;
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_GetLightsColorVehicleType(lightType: vehicleELightType) -> ELightsColorVehicleType {
  let gi: GameInstance = GetGameInstance();
  let settings: ref<MyModSettings> = MyModSettings.Get(gi);

  let vehicleType: ELightsColorVehicleType;

  switch lightType {
    case vehicleELightType.Utility:
      vehicleType = settings.utilitylights_ImpactedVehicles();
      break;
      
    case vehicleELightType.Head:
      vehicleType = settings.headlights_ImpactedVehicles();
      break;
      
    case vehicleELightType.Brake:
      vehicleType = settings.taillights_ImpactedVehicles();
      break;
      
    case vehicleELightType.Blinkers:
      vehicleType = settings.blinkerlights_ImpactedVehicles();
      break;
      
    case vehicleELightType.Reverse:
      vehicleType = settings.reverselights_ImpactedVehicles();
      break;
      
    case vehicleELightType.Interior:
      vehicleType = settings.interiorlights_ImpactedVehicles();
      break;
  }

  return vehicleType;
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_GetLightsColorSequence(lightType: vehicleELightType) -> ELightsColorCycleType {
  let gi: GameInstance = GetGameInstance();
  let settings: ref<MyModSettings> = MyModSettings.Get(gi);

  let cycleType : ELightsColorCycleType;

  switch lightType {
    case vehicleELightType.Utility:
      cycleType = settings.utilitylights_ColorSequence();
      break;
      
    case vehicleELightType.Head:
      cycleType = settings.headlights_ColorSequence();
      break;
      
    case vehicleELightType.Brake:
      cycleType = settings.taillights_ColorSequence();
      break;
      
    case vehicleELightType.Blinkers:
      cycleType = settings.blinkerlights_ColorSequence();
      break;
      
    case vehicleELightType.Reverse:
      cycleType = settings.reverselights_ColorSequence();
      break;
      
    case vehicleELightType.Interior:
      cycleType = settings.interiorlights_ColorSequence();
      break;
  }

  return cycleType;
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_GetActiveEffectIdentifier(lightType: vehicleELightType) -> Int32 {
  let identifier : Int32;

  switch lightType {
    case vehicleELightType.Utility:
      identifier = this.m_hgyi56_EVS_activeUtilityLightsEffectIdentifier;
      break;
      
    case vehicleELightType.Head:
      identifier = this.m_hgyi56_EVS_activeHeadlightsEffectIdentifier;
      break;
      
    case vehicleELightType.Brake:
      identifier = this.m_hgyi56_EVS_activeTailLightsEffectIdentifier;
      break;
      
    case vehicleELightType.Blinkers:
      identifier = this.m_hgyi56_EVS_activeBlinkerLightsEffectIdentifier;
      break;
      
    case vehicleELightType.Reverse:
      identifier = this.m_hgyi56_EVS_activeReverseLightsEffectIdentifier;
      break;
      
    case vehicleELightType.Interior:
      identifier = this.m_hgyi56_EVS_activeInteriorLightsEffectIdentifier;
      break;
  }

  return identifier;
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_UpdateActiveEffectIdentifier(lightType: vehicleELightType) {
  switch lightType {
    case vehicleELightType.Utility:
      this.m_hgyi56_EVS_activeUtilityLightsEffectIdentifier += 1;
      break;
      
    case vehicleELightType.Head:
      this.m_hgyi56_EVS_activeHeadlightsEffectIdentifier += 1;
      break;
      
    case vehicleELightType.Brake:
      this.m_hgyi56_EVS_activeTailLightsEffectIdentifier += 1;
      break;
      
    case vehicleELightType.Blinkers:
      this.m_hgyi56_EVS_activeBlinkerLightsEffectIdentifier += 1;
      break;
      
    case vehicleELightType.Reverse:
      this.m_hgyi56_EVS_activeReverseLightsEffectIdentifier += 1;
      break;
      
    case vehicleELightType.Interior:
      this.m_hgyi56_EVS_activeInteriorLightsEffectIdentifier += 1;
      break;
  }
}

@addMethod(PlayerPuppet)
public func hgyi56_EVS_GetLightsCustomSettingsEnabled(lightType: vehicleELightType) -> Bool {
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(this.GetGame()).GetLocalPlayerMainGameObject() as PlayerPuppet;

  switch lightType {
    case vehicleELightType.Utility:
      return player.GetPS().m_hgyi56_EVS_customUtilityLightsEnabled;
      break;
      
    case vehicleELightType.Head:
      return player.GetPS().m_hgyi56_EVS_customHeadlightsEnabled;
      break;
      
    case vehicleELightType.Brake:
      return player.GetPS().m_hgyi56_EVS_customTailLightsEnabled;
      break;
      
    case vehicleELightType.Blinkers:
      return player.GetPS().m_hgyi56_EVS_customBlinkerLightsEnabled;
      break;
      
    case vehicleELightType.Reverse:
      return player.GetPS().m_hgyi56_EVS_customReverseLightsEnabled;
      break;
      
    case vehicleELightType.Interior:
      return player.GetPS().m_hgyi56_EVS_customInteriorLightsEnabled;
      break;
  }

  return false;
}

@addMethod(PlayerPuppet)
public func hgyi56_EVS_SetLightsCustomSettingsEnabled(value: Bool, lightType: vehicleELightType) {
  if !IsDefined(this.m_hgyi56_EVS_drivenVehicles) {
    return;
  }

  let drivenVehicles: array<wref<IScriptable>>;
  this.m_hgyi56_EVS_drivenVehicles.GetValues(drivenVehicles);

  let i = 0;
  while i < ArraySize(drivenVehicles) {
    let vehicleComp: ref<VehicleComponent> = drivenVehicles[i] as VehicleComponent;

    if IsDefined(vehicleComp) {
      let vehicle: ref<VehicleObject> = vehicleComp.GetVehicle();

      if IsDefined(vehicle) {
        switch lightType {
          case vehicleELightType.Utility:
            this.GetPS().m_hgyi56_EVS_customUtilityLightsEnabled = value;
            break;
            
          case vehicleELightType.Head:
            this.GetPS().m_hgyi56_EVS_customHeadlightsEnabled = value;
            break;
            
          case vehicleELightType.Brake:
            this.GetPS().m_hgyi56_EVS_customTailLightsEnabled = value;
            break;
            
          case vehicleELightType.Blinkers:
            this.GetPS().m_hgyi56_EVS_customBlinkerLightsEnabled = value;
            break;
            
          case vehicleELightType.Reverse:
            this.GetPS().m_hgyi56_EVS_customReverseLightsEnabled = value;
            break;
            
          case vehicleELightType.Interior:
            this.GetPS().m_hgyi56_EVS_customInteriorLightsEnabled = value;
            break;
        }
      }
    }
    
    i += 1;
  }
}

@addMethod(PlayerPuppet)
public func hgyi56_EVS_ShouldDisplayToggleLightSettingsInputHint() -> Bool {
  if !IsDefined(this.m_hgyi56_EVS_drivenVehicles) {
    return false;
  }

  let drivenVehicles: array<wref<IScriptable>>;
  this.m_hgyi56_EVS_drivenVehicles.GetValues(drivenVehicles);

  if ArraySize(drivenVehicles) == 0 {
    return false;
  }

  // Check if at least one vehicle has lights enabled
  let i = 0;
  while i < ArraySize(drivenVehicles) {
    let vehicleComp: ref<VehicleComponent> = drivenVehicles[i] as VehicleComponent;

    if IsDefined(vehicleComp) {
      let vehicle: ref<VehicleObject> = vehicleComp.GetVehicle();

      if IsDefined(vehicle) {
        if NotEquals(vehicleComp.GetVehicleControllerPS().GetHeadLightMode(), vehicleELightMode.Off) {
          return true;
        }
      }
    }

    i += 1;
  }
  
  return false;
}

@addMethod(PlayerPuppet)
public func hgyi56_EVS_SetAllLightsCustomSettingsEnabled(value: Bool) {
  this.hgyi56_EVS_SetLightsCustomSettingsEnabled(value, vehicleELightType.Head);
  this.hgyi56_EVS_SetLightsCustomSettingsEnabled(value, vehicleELightType.Brake);
  this.hgyi56_EVS_SetLightsCustomSettingsEnabled(value, vehicleELightType.Utility);
  this.hgyi56_EVS_SetLightsCustomSettingsEnabled(value, vehicleELightType.Blinkers);
  this.hgyi56_EVS_SetLightsCustomSettingsEnabled(value, vehicleELightType.Reverse);
  this.hgyi56_EVS_SetLightsCustomSettingsEnabled(value, vehicleELightType.Interior);
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_IsColorDefined(color: Color) -> Bool {
  let zero: Uint8 = Cast<Uint8>(0);

  return !(color.Red == zero && color.Green == zero && color.Blue == zero);
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_GameSpeedMultiplier(speed: Float) -> Float {
  return GameInstance.GetStatsDataSystem(GetGameInstance()).GetValueFromCurve(n"vehicle_ui", AbsF(speed), n"speed_to_multiplier");
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_RealSpeedMultiplier(speed: Float) -> Float {
  return GameInstance.GetStatsDataSystem(GetGameInstance()).GetValueFromCurve(n"vehicle_ui", AbsF(speed), this.GetPS().m_hgyi56_EVS_isKmH ? n"kmh_to_multiplier" : n"mph_to_multiplier");
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_ToGameSpeed(mph_kmh_speed: Float) -> Float {
  let vehData: ref<VehicleData> = VehicleData.Get(GetGameInstance());

  if !IsDefined(vehData) {
    return 1;
  }

  let kmh_multiplier: Float = this.GetPS().m_hgyi56_EVS_isKmH ? vehData.kmh_multiplier : 1.000000;
  return mph_kmh_speed / kmh_multiplier / this.hgyi56_EVS_RealSpeedMultiplier(mph_kmh_speed);
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_ToRealWorldSpeed(gameSpeed: Float) -> Float {
  let vehData: ref<VehicleData> = VehicleData.Get(GetGameInstance());

  if !IsDefined(vehData) {
    return 1;
  }

  let kmh_multiplier: Float = this.GetPS().m_hgyi56_EVS_isKmH ? vehData.kmh_multiplier : 1.000000;

  return gameSpeed * kmh_multiplier * this.hgyi56_EVS_GameSpeedMultiplier(gameSpeed);
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_UpdateMomentumType(gameSpeed: Float) -> Void {
  gameSpeed = AbsF(gameSpeed);

  let speedDelta: Float = AbsF(gameSpeed - this.m_hgyi56_EVS_lastSpeed);
  let brutalDecelerationSpeedDelta: Float = this.hgyi56_EVS_ToGameSpeed(20.0); // Kmh or Mph -> Game speed unit
  this.m_hgyi56_EVS_brutalDeceleration = false;

  // Update vehicle momentum type
  if speedDelta > 0.005 {
    // In case the current speed and the last speed are too close together, then consider that the vehicle momentum type is stable
    if gameSpeed > this.m_hgyi56_EVS_lastSpeed {
      this.m_hgyi56_EVS_vehicleMomentumType = EMomentumType.Accelerate;
    }
    else if gameSpeed < this.m_hgyi56_EVS_lastSpeed {
      this.m_hgyi56_EVS_vehicleMomentumType = EMomentumType.Decelerate;
      
      if speedDelta > brutalDecelerationSpeedDelta {
        this.m_hgyi56_EVS_brutalDeceleration = true;
        // FTLog(s"Brutal deceleration -> \(this.hgyi56_EVS_ToRealWorldSpeed(speedDelta))");
      }
    }
  }
  else {
    this.m_hgyi56_EVS_vehicleMomentumType = EMomentumType.Stable;
  }
  
  this.m_hgyi56_EVS_lastSpeed = gameSpeed;
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_ApplyUtilityLightsSettingsChange() -> Void {
  if !this.m_useAuxiliary || this.GetPS().m_hgyi56_EVS_isPoliceVehicle || !this.GetPS().m_hgyi56_EVS_auxiliaryState {
    return;
  }

  this.hgyi56_EVS_ApplyLightsColorSettingsChange(vehicleELightType.Utility);
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_ApplyTailLightsSettingsChange() -> Void {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  if !IsDefined(vehicle) {
    return;
  }

  if this.GetPS().m_hgyi56_EVS_temporaryHeadlightsShutOff || Equals(this.GetPS().m_hgyi56_EVS_currentHeadlightsState, vehicleELightMode.Off) {
    return;
  }

  this.hgyi56_EVS_ApplyLightsColorSettingsChange(vehicleELightType.Brake);
  
  // New plastic color effect on the vehicle mesh will only properly apply when the vehicle brakes for the first time
  if !vehicle.IsPlayerDriver() {
    vehicle.ForceBrakesFor(0.25);
  }
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_ApplyBlinkerLightsSettingsChange() -> Void {
  if this.GetPS().m_hgyi56_EVS_temporaryHeadlightsShutOff || Equals(this.GetPS().m_hgyi56_EVS_currentHeadlightsState, vehicleELightMode.Off) {
    return;
  }
  
  this.hgyi56_EVS_ApplyLightsColorSettingsChange(vehicleELightType.Blinkers);
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_ApplyReverseLightsSettingsChange() -> Void {
  if !this.hgyi56_EVS_ShouldApplyReverseLights() {
    return;
  }

  this.m_hgyi56_EVS_reverseLightsUpdatedSinceLastReverse = true;
  this.hgyi56_EVS_ApplyLightsColorSettingsChange(vehicleELightType.Reverse);
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_ApplyHeadlightsColorSettingsChange() -> Void {
  if this.GetPS().m_hgyi56_EVS_temporaryHeadlightsShutOff || Equals(this.GetPS().m_hgyi56_EVS_currentHeadlightsState, vehicleELightMode.Off) {
    return;
  }

  this.hgyi56_EVS_ApplyLightsColorSettingsChange(vehicleELightType.Head);
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_ApplyInteriorLightsSettingsChange() -> Void {
  if !this.GetPS().m_hgyi56_EVS_interiorLightsState {
    return;
  }

  this.hgyi56_EVS_ApplyLightsColorSettingsChange(vehicleELightType.Interior);
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_ApplyLightsColorSettingsChange(lightType: vehicleELightType) -> Void {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = GetGameInstance();
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gi).GetLocalPlayerMainGameObject() as PlayerPuppet;

  if !IsDefined(vehicle) {
    return;
  }

  this.hgyi56_EVS_UpdateActiveEffectIdentifier(lightType);

  // Crystal Coat
  if this.hgyi56_EVS_ShouldApplyCrystalCoatLightColor(lightType) {
    
    let event: ref<SolidColorEffectEvent> = new SolidColorEffectEvent();
    event.identifier = this.hgyi56_EVS_GetActiveEffectIdentifier(lightType);
    event.lightType = lightType;
    vehicle.QueueEvent(event);

    return;
  }

  // If custom lights settings are disabled for this light type then restore default lights
  if !player.hgyi56_EVS_GetLightsCustomSettingsEnabled(lightType) {
    this.hgyi56_EVS_ResetLightsParameters(false, lightType);
    return;
  }

  if Equals(this.hgyi56_EVS_GetLightsColorVehicleType(lightType), ELightsColorVehicleType.Motorcycles) && vehicle != (vehicle as BikeObject) {
    this.hgyi56_EVS_ResetLightsParameters(false, lightType);
    return;
  }
  
  switch this.hgyi56_EVS_GetLightsColorSequence(lightType) {

    case ELightsColorCycleType.Solid:

      let event: ref<SolidColorEffectEvent> = new SolidColorEffectEvent();
      event.identifier = this.hgyi56_EVS_GetActiveEffectIdentifier(lightType);
      event.lightType = lightType;
      vehicle.QueueEvent(event);
      break;

    case ELightsColorCycleType.Blinker:

      let event: ref<BlinkerEffectEvent> = new BlinkerEffectEvent();
      event.identifier = this.hgyi56_EVS_GetActiveEffectIdentifier(lightType);
      event.step = 0;
      event.lightType = lightType;
      vehicle.QueueEvent(event);
      break;

    case ELightsColorCycleType.Beacon:

      let event: ref<BeaconEffectEvent> = new BeaconEffectEvent();
      event.identifier = this.hgyi56_EVS_GetActiveEffectIdentifier(lightType);
      event.step = 0;
      event.lightType = lightType;
      vehicle.QueueEvent(event);
      break;

    case ELightsColorCycleType.Pulse:

      let event: ref<PulseEffectEvent> = new PulseEffectEvent();
      event.identifier = this.hgyi56_EVS_GetActiveEffectIdentifier(lightType);
      event.step = 0;
      event.lightType = lightType;
      vehicle.QueueEvent(event);
      break;

    case ELightsColorCycleType.TwoColorsCycle:

      let event: ref<TwoColorsCycleEffectEvent> = new TwoColorsCycleEffectEvent();
      event.identifier = this.hgyi56_EVS_GetActiveEffectIdentifier(lightType);
      event.step = 0;
      event.lightType = lightType;
      vehicle.QueueEvent(event);
      break;

    case ELightsColorCycleType.Rainbow:
    
      let event: ref<RainbowEffectEvent> = new RainbowEffectEvent();
      event.identifier = this.hgyi56_EVS_GetActiveEffectIdentifier(lightType);
      event.colorIndex = 0;
      event.lightType = lightType;
      vehicle.QueueEvent(event);
      break;
  }
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_ApplyHeadlightsTimeSyncSettingsChange() -> Void {
  this.m_hgyi56_EVS_headlightsTimerIdentifier += 1;

  let vehicle: ref<VehicleObject> = this.GetVehicle();
  if !IsDefined(vehicle) {
    return;
  }

  if MyModSettings.Get(GetGameInstance()).headlightsSynchronizedWithTimeEnabled() {
    let event: ref<GameTimeElapsedEvent> = new GameTimeElapsedEvent();
    event.identifier = this.m_hgyi56_EVS_headlightsTimerIdentifier;

    // Call the event synchronously for the first time
    this.hgyi56_EVS_OnGameTimeElapsedEvent(event);
    
    this.hgyi56_EVS_UpdateHeadlightsWithTimeSync();
  }
  
  this.hgyi56_EVS_ApplyHeadlightsModeWithShutOff();
  this.hgyi56_EVS_ApplyUtilityLightsWithShutOff();
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_ApplyHeadlightsSettingsChange() -> Void {
  this.hgyi56_EVS_ApplyHeadlightsColorSettingsChange();
  this.hgyi56_EVS_ApplyHeadlightsTimeSyncSettingsChange();
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_OnModSettingsChange() -> Void {
  let gi: GameInstance = GetGameInstance();
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gi).GetLocalPlayerMainGameObject() as PlayerPuppet;
  let vehicle: ref<VehicleObject> = this.GetVehicle();

  if !IsDefined(vehicle) {
    return;
  }

  // Auto-enable custom lights settings if the player is modifying ModSettings
  if !player.m_hgyi56_EVS_customLightsAreBeingToggled {
    player.hgyi56_EVS_SetAllLightsCustomSettingsEnabled(true);
  }
  
  this.hgyi56_EVS_ApplyTailLightsSettingsChange();
  this.hgyi56_EVS_ApplyHeadlightsSettingsChange();
  this.hgyi56_EVS_ApplyBlinkerLightsSettingsChange();
  this.hgyi56_EVS_ApplyReverseLightsSettingsChange();
  this.hgyi56_EVS_ApplyUtilityLightsSettingsChange();
  this.hgyi56_EVS_ApplyInteriorLightsSettingsChange();
}

@replaceMethod(VehicleComponent)
protected cb func OnMountingEvent(evt: ref<MountingEvent>) -> Bool {
  let PSvehicleDooropenRequest: ref<VehicleDoorOpen>;
  let isDriverSlot: Bool;
  let vehicleDataPackage: wref<VehicleDataPackage_Record>;
  let vehicleRecord: ref<Vehicle_Record>;
  let shouldAutoClose: Bool = true;
  let gameInstance: GameInstance = GetGameInstance();
  let mountChild: ref<GameObject> = GameInstance.FindEntityByID(gameInstance, evt.request.lowLevelMountingInfo.childId) as GameObject;
  VehicleComponent.GetVehicleDataPackage(gameInstance, this.GetVehicle(), vehicleDataPackage);
  if mountChild.IsPlayer() {

    ////////////////////////////////////
    // Update roof light settings before door opening
    let watcher: ref<EntityWatcher> = EntityWatcher.Get(GetGameInstance());
    watcher.CustomizeVehicleRoofLight(this.GetVehicle());
    ////////////////////////////////////

    this.m_mountedPlayer = mountChild as PlayerPuppet;
    isDriverSlot = VehicleComponent.IsDriverSlot(evt.request.lowLevelMountingInfo.slotId.id);
    if isDriverSlot {
      PreventionSystem.SetPlayerMounted(gameInstance, true);
      PreventionSystemHackerLoop.UpdatePlayerVehicle(gameInstance, this.GetVehicle());

      if MyModSettings.Get(GetGameInstance()).policeDispatchRadioEnabled() {
        PoliceRadioScriptSystem.UpdatePoliceRadioOnVehicleEntrance(gameInstance);
      }
    };
    this.m_mountedPlayer.GetPlayerStateMachineBlackboard().SetBool(GetAllBlackboardDefs().PlayerStateMachine.MountedToVehicleInDriverSeat, isDriverSlot);
    VehicleComponent.GetVehicleRecord(gameInstance, this.m_mountedPlayer, vehicleRecord);
    VehicleComponent.QueueEventToAllPassengers(this.m_mountedPlayer.GetGame(), this.GetVehicle().GetEntityID(), PlayerMuntedToMyVehicle.Create(this.m_mountedPlayer));
    PlayerPuppet.ReevaluateAllBreathingEffects(mountChild as PlayerPuppet);
    if !this.GetVehicle().IsCrowdVehicle() {
      this.GetVehicle().GetDeviceLink().TriggerSecuritySystemNotification(this.GetVehicle().GetWorldPosition(), mountChild, ESecurityNotificationType.ALARM);
    };
    this.ToggleScanningComponent(false);
    if this.GetVehicle().GetHudManager().IsRegistered(this.GetVehicle().GetEntityID()) {
      this.RegisterToHUDManager(false);
    };
    if this.GetVehicle().IsPlayerVehicle() && !this.GetPS().GetIsDestroyed() {
      this.CreateMappin();
    };
    this.RegisterInputListener();
    FastTravelSystem.AddFastTravelLock(n"InVehicle", gameInstance);
    this.m_mounted = true;
    this.m_ignoreAutoDoorClose = true;
    this.SetupListeners();
    this.DisableTargetingComponents();
    if EntityID.IsDefined(evt.request.mountData.mountEventOptions.entityID) {
      this.m_enterTime = vehicleDataPackage.Stealing() + vehicleDataPackage.SlideDuration();
    } else {
      if this.m_mountedPlayer.IsInCombat() && Equals(vehicleRecord.Type().Type(), gamedataVehicleType.Car) && isDriverSlot {
        this.m_enterTime = vehicleDataPackage.CombatEntering() + vehicleDataPackage.SlideDuration();
        if Equals(vehicleDataPackage.DriverCombat().Type(), gamedataDriverCombatType.Doors) && (IsDefined(GameInstance.GetTransactionSystem(this.m_mountedPlayer.GetGame()).GetItemInSlot(this.m_mountedPlayer, t"AttachmentSlots.WeaponLeft") as WeaponObject) || IsDefined(GameInstance.GetTransactionSystem(this.m_mountedPlayer.GetGame()).GetItemInSlot(this.m_mountedPlayer, t"AttachmentSlots.WeaponRight") as WeaponObject)) {
          shouldAutoClose = false;
        } else {
          shouldAutoClose = true;
        };
      } else {
        this.m_enterTime = vehicleDataPackage.Entering() + vehicleDataPackage.SlideDuration();
      };
    };
    this.DrivingStimuli(true);
    if Equals(evt.request.lowLevelMountingInfo.slotId.id, n"seat_front_left") {
      if IsDefined(this.GetVehicle() as TankObject) {
        this.TogglePlayerHitShapesForPanzer(this.m_mountedPlayer, false);
        this.ToggleTargetingSystemForPanzer(this.m_mountedPlayer, true);
      };
      this.SetSteeringLimitAnimFeature(1);
    };
    GameInstance.GetStatPoolsSystem(GetGameInstance()).RequestSettingStatPoolValueCustomLimit(Cast<StatsObjectID>(this.GetVehicle().GetEntityID()), gamedataStatPoolType.Health, this.m_healthDecayThreshold, this.GetVehicle());
  };
  if !mountChild.IsPlayer() {
    if evt.request.mountData.isInstant {
      mountChild.QueueEvent(CreateDisableRagdollEvent(n"VehicleComponentOnMountingEvent"));
    };
    VehicleComponent.PushVehicleNPCData(gameInstance, mountChild);
    if mountChild.IsPuppet() && !this.GetVehicle().IsPlayerVehicle() && (IsHostileTowardsPlayer(mountChild) || (mountChild as ScriptedPuppet).IsAggressive()) {
      this.EnableTargetingComponents();
    };
  };
  if !evt.request.mountData.isInstant {
    PSvehicleDooropenRequest = new VehicleDoorOpen();

    ///////////////////////////
    // Handle windows when entering into the vehicle
    //
    if this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow {
      let vehicle: ref<VehicleObject> = this.GetVehicle();
      let gi: GameInstance = vehicle.GetGame();

      if this.GetPS().m_hgyi56_EVS_isSingleFrontDoor {
        if Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_front_left), EVehicleWindowState.Open) {
          VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.GetDriverSlotID(), false, n"Custom");
        }
        if Equals(this.GetPS().GetWindowState(EVehicleDoor.seat_front_right), EVehicleWindowState.Open) {
          VehicleComponent.ToggleVehicleWindow(gi, vehicle, VehicleComponent.GetFrontPassengerSlotID(), false, n"Custom");
        }
      }
      else {
        let doorEnum: EVehicleDoor = IntEnum<EVehicleDoor>(EnumValueFromName(n"EVehicleDoor", evt.request.lowLevelMountingInfo.slotId.id));

        let windowState = this.GetPS().GetWindowState(doorEnum);
        let doorState = this.GetPS().GetDoorState(doorEnum);

        if Equals(windowState, EVehicleWindowState.Open) && Equals(doorState, VehicleDoorState.Open) {
          VehicleComponent.ToggleVehicleWindow(gi, vehicle, evt.request.lowLevelMountingInfo.slotId, false, n"Custom");
        }
      }

      PSvehicleDooropenRequest.m_hgyi56_EVS_shouldOpenWindow = true;
    }
    ///////////////////////////

    PSvehicleDooropenRequest.slotID = this.GetVehicle().GetBoneNameFromSlot(evt.request.lowLevelMountingInfo.slotId.id);
    if EntityID.IsDefined(evt.request.mountData.mountEventOptions.entityID) {
      PSvehicleDooropenRequest.autoCloseTime = vehicleDataPackage.Stealing_open();
    } else {
      PSvehicleDooropenRequest.autoCloseTime = vehicleDataPackage.Normal_open();
    };
    if !this.GetPS().GetIsDestroyed() && shouldAutoClose {
      PSvehicleDooropenRequest.shouldAutoClose = true;
    };
    GameInstance.GetPersistencySystem(gameInstance).QueuePSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), PSvehicleDooropenRequest);
  };
  this.ManageAdditionalAnimFeatures(mountChild, true);
  if mountChild.IsPrevention() {
    this.m_preventionPassengers += 1;
    this.RegisterWantedLevelListener();
    GameInstance.GetPreventionSpawnSystem(gameInstance).RegisterEntityDeathCallback(this, "OnPreventionPassengerDeath", mountChild.GetEntityID());
    this.CreateMappin();
    this.GetVehicle().GetPreventionSystem().UpdateVehiclePassengerCount(this.GetVehicle().GetEntityID(), this.m_preventionPassengers);
    
    ////////////////////////////////////
    // Police NPC vehicles also needs this
    isDriverSlot = VehicleComponent.IsDriverSlot(evt.request.lowLevelMountingInfo.slotId.id);
    if isDriverSlot {
      this.GetPS().m_hgyi56_EVS_isPoliceVehicle = true;
    }
    ////////////////////////////////////
  };





  
  if this.hgyi56_EVS_IsUnsupportedVehicleType() {
    return false;
  }

  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = vehicle.GetGame();
  let mountChild: ref<GameObject> = GameInstance.FindEntityByID(gi, evt.request.lowLevelMountingInfo.childId) as GameObject;

  if mountChild.IsPlayer() {
    this.hgyi56_EVS_TogglePlayerMounted(true);
    
    // Only the first time V enters into this vehicle in any seat
    if !this.m_hgyi56_EVS_vehicleUsedByV {

      let occupiedSeatSlots: Int32 = 0;
      let reservedSeatSlots: Int32 = 0;
      VehicleComponent.GetSeatsStatus(gi, vehicle, this.GetPS().m_hgyi56_EVS_totalSeatSlots, occupiedSeatSlots, reservedSeatSlots);
      
      VehicleComponent.GetVehicleDataPackage(gi, vehicle, this.m_hgyi56_EVS_vehicleDataPackage);

      this.GetPS().m_hgyi56_EVS_hasWindows = this.m_hgyi56_EVS_vehicleDataPackage.WindowsRollDown();

      if Equals(this.m_hgyi56_EVS_vehicleDataPackage.DriverCombat().Type(), gamedataDriverCombatType.Doors) {
        this.GetPS().m_hgyi56_EVS_isDriverCombatType_Doors = true;
      }

      VehicleComponent.GetVehicleRecord(vehicle, this.m_hgyi56_EVS_vehicleRecord);
      
      if Equals(this.m_hgyi56_EVS_vehicleRecord.Affiliation().Type(), gamedataAffiliation.NCPD)
      || Equals(this.m_hgyi56_EVS_vehicleRecord.GetID(), t"Vehicle.v_sportbike3_brennan_apollo_police") {
        this.GetPS().m_hgyi56_EVS_isPoliceVehicle = true;
      }

      this.GetPS().m_hgyi56_EVS_hasCrystalDome = this.m_hgyi56_EVS_vehicleRecord.IsArmoredVehicle();
      
      this.GetPS().m_hgyi56_EVS_vehicleLongModel = StringToName(VehicleData.Get(gi).RemoveBlankSpecialCharacters(s"\(this.m_hgyi56_EVS_vehicleRecord.Manufacturer().EnumName()) \(GetLocalizedTextByKey(this.m_hgyi56_EVS_vehicleRecord.DisplayName()))"));
      this.GetPS().m_hgyi56_EVS_vehicleModel = StringToName(VehicleData.Get(gi).ShortModelName(ToString(this.GetPS().m_hgyi56_EVS_vehicleLongModel)));
      // FTLog(s"Short model -> \(this.GetPS().m_hgyi56_EVS_vehicleModel)");
      // FTLog(s"Long model -> \(this.GetPS().m_hgyi56_EVS_vehicleLongModel)");
      // FTLog(s"Record -> \(TDBID.ToStringDEBUG(this.m_hgyi56_EVS_vehicleRecord.GetID()))");
      // FTLog(s"Record appearance -> \(this.m_hgyi56_EVS_vehicleRecord.AppearanceName())");
      // FTLog(s"Appearance -> \(vehicle.GetCurrentAppearanceName())");
      
      /////////////////////////////
      // Adapt vehicles
      //
      // - First step: look for custom data for the vehicle model (ex.: Mizutani Shion)
      // 
      // - Second step: look for custom data for the specific vehicle model (ex.: Mizutani Shion "Coyote")
      //
      if VehicleData.Get(gi).incorrectDoorNumber_VehicleMap.KeyExist(ToString(this.GetPS().m_hgyi56_EVS_vehicleModel)) {
        this.GetPS().m_hgyi56_EVS_totalSeatSlots = Cast<Int32>(VehicleData.Get(gi).incorrectDoorNumber_VehicleMap.Get(ToString(this.GetPS().m_hgyi56_EVS_vehicleModel)));
      }
      if VehicleData.Get(gi).incorrectDoorNumber_VehicleMap.KeyExist(ToString(this.GetPS().m_hgyi56_EVS_vehicleLongModel)) {
        this.GetPS().m_hgyi56_EVS_totalSeatSlots = Cast<Int32>(VehicleData.Get(gi).incorrectDoorNumber_VehicleMap.Get(ToString(this.GetPS().m_hgyi56_EVS_vehicleLongModel)));
      }

      if VehicleData.Get(gi).hasIncompatibleSlidingDoorsWindow_VehicleMap.KeyExist(ToString(this.GetPS().m_hgyi56_EVS_vehicleModel)) {
        this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow = true;
      }
      if VehicleData.Get(gi).hasIncompatibleSlidingDoorsWindow_VehicleMap.KeyExist(ToString(this.GetPS().m_hgyi56_EVS_vehicleLongModel)) {
        this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow = true;
      }

      if VehicleData.Get(gi).isSlidingDoors_VehicleMap.KeyExist(ToString(this.GetPS().m_hgyi56_EVS_vehicleModel)) {
        this.GetPS().m_hgyi56_EVS_isSlidingDoors = true;
      }
      if VehicleData.Get(gi).isSlidingDoors_VehicleMap.KeyExist(ToString(this.GetPS().m_hgyi56_EVS_vehicleLongModel)) {
        this.GetPS().m_hgyi56_EVS_isSlidingDoors = true;
      }

      if VehicleData.Get(gi).isSingleFrontDoor_VehicleMap.KeyExist(ToString(this.GetPS().m_hgyi56_EVS_vehicleModel)) {
        this.GetPS().m_hgyi56_EVS_isSingleFrontDoor = true;
      }
      if VehicleData.Get(gi).isSingleFrontDoor_VehicleMap.KeyExist(ToString(this.GetPS().m_hgyi56_EVS_vehicleLongModel)) {
        this.GetPS().m_hgyi56_EVS_isSingleFrontDoor = true;
      }

      if VehicleData.Get(gi).hasWindows_VehicleMap.KeyExist(ToString(this.GetPS().m_hgyi56_EVS_vehicleModel)) {
        this.GetPS().m_hgyi56_EVS_hasWindows = true;
      }
      if VehicleData.Get(gi).hasWindows_VehicleMap.KeyExist(ToString(this.GetPS().m_hgyi56_EVS_vehicleLongModel)) {
        this.GetPS().m_hgyi56_EVS_hasWindows = true;
      }

      let hashId: Uint64 = TDBID.ToNumber(TDBID.Create(ToString(this.GetPS().m_hgyi56_EVS_vehicleModel)));
      let longHashId: Uint64 = TDBID.ToNumber(TDBID.Create(ToString(this.GetPS().m_hgyi56_EVS_vehicleLongModel)));

      if VehicleData.Get(gi).crystalDomeMeshTimings_VehicleMap.KeyExist(hashId) {
        this.GetPS().m_hgyi56_EVS_crystalDomeMeshTimings = VehicleData.Get(gi).crystalDomeMeshTimings_VehicleMap.Get(hashId) as CrystalDomeTimingsArray;
      }
      if VehicleData.Get(gi).crystalDomeMeshTimings_VehicleMap.KeyExist(longHashId) {
        this.GetPS().m_hgyi56_EVS_crystalDomeMeshTimings = VehicleData.Get(gi).crystalDomeMeshTimings_VehicleMap.Get(longHashId) as CrystalDomeTimingsArray;
      }

      if VehicleData.Get(gi).windowTimings_VehicleMap.KeyExist(hashId) {
        this.GetPS().m_hgyi56_EVS_windowTimings = VehicleData.Get(gi).windowTimings_VehicleMap.Get(hashId) as WindowTimingsArray;
      }
      if VehicleData.Get(gi).windowTimings_VehicleMap.KeyExist(longHashId) {
        this.GetPS().m_hgyi56_EVS_windowTimings = VehicleData.Get(gi).windowTimings_VehicleMap.Get(longHashId) as WindowTimingsArray;
      }
      /////////////////////////////

      this.m_hgyi56_EVS_vehicleUsedByV = true;
    }
  }

  if mountChild.IsPlayer() && vehicle.IsPlayerDriver() {
    let player: ref<PlayerPuppet> = mountChild as PlayerPuppet;
    let vehComp: wref<VehicleComponent> = this;

    let entityHashId = TDBID.ToNumber(TDBID.Create(ToString(vehicle.GetEntityID())));

    // Register this vehicle until it is unloaded
    if !ArrayContains(player.GetPS().m_hgyi56_EVS_drivenVehiclesID, vehicle.GetEntityID()) {
      player.m_hgyi56_EVS_drivenVehicles.Insert(entityHashId, vehComp);
      ArrayPush(player.GetPS().m_hgyi56_EVS_drivenVehiclesID, vehicle.GetEntityID());
    }
    
    this.GetPS().m_hgyi56_EVS_poweredOnAtLeastOnceSinceLastEnter = this.GetPS().m_hgyi56_EVS_powerState;
    // FTLog(s"Powered on at least once -> \(this.GetPS().m_hgyi56_EVS_poweredOnAtLeastOnceSinceLastEnter)");

    if !this.GetPS().m_hgyi56_EVS_vehicleDrivenByV {
      // FTLog(s"m_hgyi56_EVS_vehicleDrivenByV -> true");

      this.GetPS().m_hgyi56_EVS_currentHeadlightsState = IntEnum<vehicleELightMode>(EnumInt(MyModSettings.Get(GetGameInstance()).defaultHeadlightsMode()));

      switch MyModSettings.Get(GetGameInstance()).defaultUtilityLightsMode() {
        case EUtilityLightsMode.MotorcyclesActive:
          if vehicle == (vehicle as BikeObject) {
            this.GetPS().m_hgyi56_EVS_auxiliaryState = true;
            // FTLog(s"Set utility lights -> \(this.GetPS().m_hgyi56_EVS_auxiliaryState)");
          }
          break;
          
        case EUtilityLightsMode.AllVehiclesActive:
          if this.m_useAuxiliary {
            this.GetPS().m_hgyi56_EVS_auxiliaryState = true;
            // FTLog(s"Set utility lights -> \(this.GetPS().m_hgyi56_EVS_auxiliaryState)");
          }
          break;
      }

      this.GetPS().m_hgyi56_EVS_vehicleDrivenByV = true;
    }

    // In case V gets in a vehicle that is not parked: summoning a vehicle, carjacking
    if vehicle.IsVehicleTurnedOn() && !this.GetPS().m_hgyi56_EVS_powerState {

      // If the UI is active then it means that we must toggle the power state
      // Otherwise if we turn the power off, save the game in the car and reload, the power will be enabled while it should not
      if vehicle.GetBlackboard().GetBool(GetAllBlackboardDefs().Vehicle.IsUIActive)
      || vehicle.IsEngineTurnedOn() {
        this.hgyi56_EVS_TogglePowerState(true);
      }

      // Use this trick so the custom lights won't be toggled automatically on first mount if the player has disabled them
      player.m_hgyi56_EVS_customLightsAreBeingToggled = true;
      this.hgyi56_EVS_OnModSettingsChange();
      player.m_hgyi56_EVS_customLightsAreBeingToggled = false;
    }
  }
  if mountChild.IsPlayer() && ArraySize(this.m_hgyi56_EVS_mountedSeats) == 0 { // It means this is the first seat the player is mounting since the last entry (not switching seats)
    if Equals(evt.request.lowLevelMountingInfo.slotId.id, n"seat_front_right") {
      this.GetPS().m_hgyi56_EVS_playerIsMountedFromPassengerSeat = true;
      this.hgyi56_EVS_OnPassengerEnter_CrystalDomeMesh();
    }
    else if Equals(evt.request.lowLevelMountingInfo.slotId.id, n"seat_front_left") && !this.GetPS().m_hgyi56_EVS_playerIsMountedFromPassengerSeat {
      this.hgyi56_EVS_OnEnter_CrystalDomeMesh();
    }
  }
}

@wrapMethod(VehicleComponent)
protected cb func OnSummonStartedEvent(evt: ref<SummonStartedEvent>) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  if !IsDefined(vehicle) {
    return wrappedMethod(evt);
  }

  let record: ref<Vehicle_Record>;
  VehicleComponent.GetVehicleRecord(vehicle, record);

  // We must toggle the power otherwise the UI won't be started before entering the vehicle
  this.hgyi56_EVS_TogglePowerState(true);
  this.hgyi56_EVS_ToggleEngineState(true);
  
  /////////////////////////////
  // When summoning a vehicle with CrystalDome and external mesh we must pre-activate the CrystalDome and display external mesh when the vehicle is being summoned
  // this.ToggleCrystalDome(true, true, true); // This wont work if the vehicle is summoned too far, so we need to check if it is close enough (see below)

  // If the crystal dome is ON, then start a looping event to restore the crystal dome state when the player will get close again to the vehicle
  if record.IsArmoredVehicle() {
    this.GetPS().SetCrystalDomeState(false); // When summoned the CrystalDome is off until mounting
    let event: ref<PlayerIsAwayFromVehicleEvent> = new PlayerIsAwayFromVehicleEvent();
    event.isVehicleSummoning = true;
    event.hasBeenOutOfVehicleRange = true; // In case the vehicle is summoned close to the player
    vehicle.QueueEvent(event);
  }
  /////////////////////////////

  return wrappedMethod(evt);
}

@wrapMethod(VehicleComponent)
protected cb func OnVehicleStartedMountingEvent(evt: ref<VehicleStartedMountingEvent>) -> Bool {
  wrappedMethod(evt);
  
  if this.hgyi56_EVS_IsUnsupportedVehicleType() {
    return false;
  }

  let vehicle: ref<VehicleObject> = this.GetVehicle();

  let mountingSlotId: MountingSlotId;
  mountingSlotId.id = evt.slotID;

  // If any of the player or a police NPC driver is unmounting
  if this.GetPS().m_hgyi56_EVS_isPoliceVehicle && !evt.isMounting && Equals(mountingSlotId, VehicleComponent.GetDriverSlotID()) {
    // Police lights
    let callback: ref<UpdateLightsCallback> = new UpdateLightsCallback();
    callback.lightType = vehicleELightType.Utility;
    callback.vehComp = this;
    GameInstance.GetDelaySystem(GetGameInstance()).DelayCallback(callback, 0.1, true);
  }

  if evt.character.IsPlayer() && this.GetPS().m_hgyi56_EVS_vehicleDrivenByV {
    if !evt.isMounting {

      // Keep headlights identical whether the player is driving or not
      this.GetVehicleController().overrideHeadlightsSettingsForPlayer = false;

      let previousMountingSlotId: MountingSlotId;
      if ArraySize(this.m_hgyi56_EVS_mountedSeats) >= 2 {
        Utils.SecondToLast(this.m_hgyi56_EVS_mountedSeats, previousMountingSlotId);
      }

      if Equals(mountingSlotId, VehicleComponent.GetDriverSlotID()) || (Equals(mountingSlotId, VehicleComponent.GetFrontPassengerSlotID()) && ArraySize(this.m_hgyi56_EVS_mountedSeats) >= 2 && Equals(previousMountingSlotId, VehicleComponent.GetDriverSlotID())) {
        // Dismounting from driver seat or from passenger seat with previous driver seat
        
        this.hgyi56_EVS_TogglePlayerMounted(false);
      
        this.m_hgyi56_EVS_playerIsDismounting = true;
        
        // Prevents the vehicle from shutting down because of the game
        this.hgyi56_EVS_Ensure_VehicleState(vehicleEState.Default);

        switch MyModSettings.Get(GetGameInstance()).exitBehavior() {
          case EExitBehavior.PowerOff:
            this.hgyi56_EVS_TogglePowerState(false);
            this.hgyi56_EVS_ToggleEngineState(false);
            break;

          case EExitBehavior.StopEngine:
            this.hgyi56_EVS_ToggleEngineState(false);
            break;

          case EExitBehavior.KeepCurrentState:
            // Do nothing
            break;

          default:
            // Do nothing
            break;
        }

        // Ambient lights
        if !this.GetPS().m_hgyi56_EVS_powerState
        && Equals(MyModSettings.Get(GetGameInstance()).interiorlightsAutomaticTurnOff(), EInteriorLightsToggleOff.OnExit) {
          this.hgyi56_EVS_ToggleInteriorLights(false);
        }

        // Roof light
        // Prevent the roof light from staying enabled forever if the player gets out with power off and all doors are closed
        if !this.GetPS().m_hgyi56_EVS_powerState
        && Equals(MyModSettings.Get(GetGameInstance()).interiorlightsRoofLightOperatingMode(), ERoofLightOperatingMode.Fixed)
        && Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_left), VehicleDoorState.Closed)
        && Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_right), VehicleDoorState.Closed)
        && Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_back_left), VehicleDoorState.Closed)
        && Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_back_right), VehicleDoorState.Closed) {
          
          let callback: ref<RoofLightRearmCallback> = new RoofLightRearmCallback();
          callback.vehComp = this;
          callback.identifier = this.m_hgyi56_EVS_roofLight_CycleIdentifier;
          callback.isExitingWithPermanentLight = true;
          
          GameInstance.GetDelaySystem(GetGameInstance()).DelayCallback(callback, 5.0, true);
        }

        if this.GetPS().GetCrystalDomeState()
        && MyModSettings.Get(GetGameInstance()).crystalDomeSynchronizedWithPowerState()
        && MyModSettings.Get(GetGameInstance()).crystalDomeKeepOnUntilExit()
        && !this.GetPS().m_hgyi56_EVS_powerState
        && this.GetPS().m_hgyi56_EVS_poweredOnAtLeastOnceSinceLastEnter {
          this.hgyi56_EVS_MyToggleCrystalDome(false);
        }

        // Restore external mesh for crystal dome vehicles
        this.hgyi56_EVS_OnExit_CrystalDomeMesh();
      }
    }
    else if evt.isMounting {
      if ArraySize(this.m_hgyi56_EVS_mountedSeats) == 0 { // It means this is the first seat the player is mounting since the last entry (not switching seats)
        
        // Ambient lights
        if !this.GetPS().m_hgyi56_EVS_powerState
        && Equals(MyModSettings.Get(GetGameInstance()).interiorlightsAutomaticTurnOn(), EInteriorLightsToggleOn.OnEnter) {
          this.hgyi56_EVS_ToggleInteriorLights(true);
        }
      }

      ArrayPush(this.m_hgyi56_EVS_mountedSeats, mountingSlotId);
    }
  }
}

@replaceMethod(VehicleComponent)
protected cb func OnUnmountingEvent(evt: ref<UnmountingEvent>) -> Bool {
  
  // Get siren state
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = GetGameInstance();

  let activePassengers: Int32;
  let gi: GameInstance = GetGameInstance();
  let mountChild: ref<GameObject> = GameInstance.FindEntityByID(gi, evt.request.lowLevelMountingInfo.childId) as GameObject;
  let mountChildIsPrevention: Bool = IsDefined(mountChild) && mountChild.IsPrevention();
  VehicleComponent.SetAnimsetOverrideForPassenger(mountChild, evt.request.lowLevelMountingInfo.parentId, evt.request.lowLevelMountingInfo.slotId.id, 0.00);

  let previousMountingSlotId: MountingSlotId;
  if ArraySize(this.m_hgyi56_EVS_mountedSeats) >= 2 {
    Utils.SecondToLast(this.m_hgyi56_EVS_mountedSeats, previousMountingSlotId);
  }

  // // // // // // //
  // When any of V or a police driver (not passenger) NPC get out of the vehicle
  if (this.GetPS().m_hgyi56_EVS_isPoliceVehicle || vehicle.IsPrevention()) && IsDefined(mountChild) && !this.hgyi56_EVS_IsUnsupportedVehicleType()
  && (VehicleComponent.IsDriverSlot(evt.request.lowLevelMountingInfo.slotId.id) || (mountChild.IsPlayer() && ArraySize(this.m_hgyi56_EVS_mountedSeats) >= 2 && Equals(previousMountingSlotId, VehicleComponent.GetDriverSlotID()))) {
    
    // Turn the siren OFF if necessary
    if (mountChild.IsPlayer() && !MyModSettings.Get(gi).keepSirenOnWhileOutsidePlayerEnabled())
    || (!mountChild.IsPlayer() && !MyModSettings.Get(gi).keepSirenOnWhileOutsideNPCsEnabled()) {
      this.GetVehicle().ToggleSiren(false);
      this.GetPS().SetSirenSoundsState(false);
    }

    // Police bike needs a custom siren
    if vehicle == (vehicle as BikeObject)
    && MyModSettings.Get(gi).policeBikeSirenEnabled() {
      
      if this.GetPS().m_hgyi56_EVS_threeStatesSiren == 2 {

        if mountChild.IsPlayer() && !MyModSettings.Get(gi).keepSirenOnWhileOutsidePlayerEnabled() {
          GameInstance.GetAudioSystem(gi).Stop(n"v_car_villefort_cortes_police_siren_start", vehicle.GetEntityID(), n"vehicle_engine_emitter");
        }
        else if !mountChild.IsPlayer() {
          // Stop the driver puppet siren
          GameObject.StopSound(mountChild, n"v_car_villefort_cortes_police_siren_start");
          
          if MyModSettings.Get(gi).keepSirenOnWhileOutsideNPCsEnabled() {
            // Start the bike static siren
            GameObject.PlaySound(vehicle, n"v_car_villefort_cortes_police_siren_start");
          }
        }
      }
    }
  }

  if IsDefined(mountChild) && mountChild.IsPlayer() {
    PreventionSystem.SetPlayerMounted(gi, false);
    PlayerPuppet.ReevaluateAllBreathingEffects(mountChild as PlayerPuppet);
    this.ToggleScanningComponent(true);
    if this.GetVehicle().ShouldRegisterToHUD() {
      this.RegisterToHUDManager(true);
    };
    this.UnregisterInputListener();
    FastTravelSystem.RemoveFastTravelLock(n"InVehicle", gi);
    this.m_mounted = false;
    this.UnregisterListeners();
    // this.ToggleSiren(false, false);
    if this.m_broadcasting {
      this.DrivingStimuli(false);
    };
    if Equals(evt.request.lowLevelMountingInfo.slotId.id, n"seat_front_left") {
      PreventionSystemHackerLoop.UpdatePlayerVehicle(gi, null);

      if !this.GetPS().m_hgyi56_EVS_vehicleDrivenByV || this.hgyi56_EVS_IsUnsupportedVehicleType() {
        this.ToggleCrystalDome(false, true, false, 0.00, 0.00, true);
      }
      
      this.SetSteeringLimitAnimFeature(0);
      this.m_ignoreAutoDoorClose = false;
    };
    this.DoPanzerCleanup();
    this.m_mountedPlayer = null;
    this.CleanUpRace();
    GameInstance.GetStatPoolsSystem(gi).RequestSettingStatPoolValueCustomLimit(Cast<StatsObjectID>(this.GetVehicle().GetEntityID()), gamedataStatPoolType.Health, 0.00, this.GetVehicle());
    GameInstance.GetAudioSystem(gi).RemoveTriggerEffect(n"te_vehicle_car_disabled");
  };
  if IsDefined(mountChild) {
    if mountChildIsPrevention {
      GameInstance.GetPreventionSpawnSystem(gi).UnregisterEntityDeathCallback(this, "OnPreventionPassengerDeath", mountChild.GetEntityID());
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




  if this.hgyi56_EVS_IsUnsupportedVehicleType() {
    return false;
  }

  if IsDefined(mountChild) && mountChild.IsPlayer() && this.GetPS().m_hgyi56_EVS_vehicleDrivenByV
  && (Equals(evt.request.lowLevelMountingInfo.slotId, VehicleComponent.GetDriverSlotID()) || Equals(evt.request.lowLevelMountingInfo.slotId, VehicleComponent.GetFrontPassengerSlotID()))
  && !VehicleComponent.IsMountedToProvidedVehicle(gi, mountChild.GetEntityID(), vehicle) {

    // Restore headlights
    this.hgyi56_EVS_ApplyHeadlightsModeWithShutOff();
    
    // Restore utility lights
    this.hgyi56_EVS_ApplyUtilityLightsWithShutOff();

    ArrayClear(this.m_hgyi56_EVS_mountedSeats);
  }
}

@wrapMethod(VehicleComponent)
protected cb func OnVehicleFinishedMountingEvent(evt: ref<VehicleFinishedMountingEvent>) -> Bool {
  wrappedMethod(evt);

  if this.hgyi56_EVS_IsUnsupportedVehicleType() {
    return false;
  }

  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = vehicle.GetGame();
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gi).GetLocalPlayerMainGameObject() as PlayerPuppet;

  if vehicle.IsPlayerDriver() {
    if evt.isMounting {

      if player.IsInCombat() {

        if MyModSettings.Get(GetGameInstance()).autoStartEngineDuringCombat() {
          this.hgyi56_EVS_TogglePowerState(true);
          this.hgyi56_EVS_ToggleEngineState(true);
        }

        if MyModSettings.Get(GetGameInstance()).autoEnableCrystalDomeDuringCombat() {
          this.hgyi56_EVS_MyToggleCrystalDome(true);
        }
      }
      
      switch MyModSettings.Get(GetGameInstance()).enterBehavior() {
        case EEnterBehavior.StartEngine:
          this.hgyi56_EVS_TogglePowerState(true);
          this.hgyi56_EVS_ToggleEngineState(true);
          break;

        case EEnterBehavior.PowerOn:
          this.hgyi56_EVS_TogglePowerState(true);
          break;

        case EEnterBehavior.KeepCurrentState:
          // Do nothing
          break;

        default:
          // Do nothing
          break;
      }
      
      // If the power state is off, activate the headlights shutoff
      if this.GetPS().m_hgyi56_EVS_powerState {
        this.hgyi56_EVS_ToggleHeadlightsShutoff(false);
      }
      else {
        this.hgyi56_EVS_ToggleHeadlightsShutoff(true);
      }
      
      this.hgyi56_EVS_ApplyHeadlightsModeWithShutOff();
      this.hgyi56_EVS_ApplyUtilityLightsWithShutOff();
    }
  }
  else if this.GetPS().m_hgyi56_EVS_vehicleDrivenByV && evt.character.IsPlayer() && !evt.isMounting { // Unmounted player
  
    this.hgyi56_EVS_RecallVehicleDoorsState();

    this.m_hgyi56_EVS_playerIsDismounting = false;

    // If the crystal dome is ON, then start a looping event to restore the crystal dome state when the player will get close again to the vehicle
    if this.GetPS().GetCrystalDomeState() && this.GetPS().m_hgyi56_EVS_hasCrystalDome {
      let event: ref<PlayerIsAwayFromVehicleEvent> = new PlayerIsAwayFromVehicleEvent();
      vehicle.QueueEvent(event);
    }
  }

  let driver: ref<ScriptedPuppet> = VehicleComponent.GetDriver(gi, vehicle, vehicle.GetEntityID()) as ScriptedPuppet;

  // When any of V or police officer NPCs get in the vehicle and the siren state is ON
  if evt.isMounting && this.GetPS().m_hgyi56_EVS_threeStatesSiren == 2 {
    // Then turn the siren back ON
    this.GetVehicle().ToggleSiren(true);
    this.GetPS().SetSirenSoundsState(true);

    if vehicle == (vehicle as BikeObject)
    && MyModSettings.Get(gi).policeBikeSirenEnabled()
    && IsDefined(driver) {

      if driver.IsPlayer() && !MyModSettings.Get(gi).keepSirenOnWhileOutsidePlayerEnabled() {
        GameInstance.GetAudioSystem(gi).PlayOnEmitter(n"v_car_villefort_cortes_police_siren_start", vehicle.GetEntityID(), n"vehicle_engine_emitter");
      }
      else if !driver.IsPlayer() {
        // Stop the vehicle static siren
        GameObject.StopSound(vehicle, n"v_car_villefort_cortes_police_siren_start");
        // Start the driver puppet siren
        GameObject.PlaySound(driver, n"v_car_villefort_cortes_police_siren_start");
      }
    }
  }
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_AllowCloseDoorsWithSpeed(speed: Float) -> Bool {
  let absSpeed: Float = AbsF(speed); // Game speed unit  
  let speedWindow: Float = this.hgyi56_EVS_ToGameSpeed(5.0); // Kmh or Mph -> Game speed unit
  
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  if !IsDefined(vehicle) {
    return false;
  }

  // Concerning "OnStartMoving" mode
  // Check "SpeedToClose() + speedWindow" so we give a speed window for the game to close doors
  // Only close the doors if the vehicle is accelerating (from parking to driving)
  // Otherwise when the vehicle would decelerate and park then the doors would close too (from driving to parking)
  if absSpeed < this.m_hgyi56_EVS_vehicleDataPackage.SpeedToClose() + speedWindow
  && Equals(this.m_hgyi56_EVS_vehicleMomentumType, EMomentumType.Accelerate) {
    this.m_hgyi56_EVS_AutoCloseDoors_OnStartMoving_State = true;
  }
  else {
    this.m_hgyi56_EVS_AutoCloseDoors_OnStartMoving_State = false;
  }
  
  // Close doors when moving if necessary
  if Equals(MyModSettings.Get(GetGameInstance()).doorsDriveClosing(), EDoorsDriveClosing.CustomSpeed)
  || (Equals(MyModSettings.Get(GetGameInstance()).doorsDriveClosing(), EDoorsDriveClosing.OnStartMoving) && this.m_hgyi56_EVS_AutoCloseDoors_OnStartMoving_State) {
    return true;
  }

  return false;
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_IsUnsupportedVehicleType() -> Bool {
  return this.hgyi56_EVS_IsNCARTMetro() || this.hgyi56_EVS_IsPanzer();
}

// Only deploy/retract the spoiler when the vehicle speed is getting just higher/lower than deploy/retract speed
// Outside of a short speed window the spoiler state shall not change
@addMethod(VehicleComponent)
protected final func hgyi56_EVS_AllowSpoilerToggleWithSpeed(speed: Float, deploy: Bool) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  if !IsDefined(vehicle) {
    return false;
  }

  let absSpeed: Float = AbsF(speed); // Game speed unit
  let speedWindow: Float = this.hgyi56_EVS_ToGameSpeed(5.0); // Kmh or Mph -> Game speed unit

  let targetSpeed: Float = this.hgyi56_EVS_ToGameSpeed(deploy ? MyModSettings.Get(GetGameInstance()).spoilerDeploySpeed() : MyModSettings.Get(GetGameInstance()).spoilerRetractSpeed()); // Kmh or Mph -> Game speed unit
  
  if deploy {
    if absSpeed >= targetSpeed && absSpeed < targetSpeed + speedWindow && Equals(this.m_hgyi56_EVS_vehicleMomentumType, EMomentumType.Accelerate) {
      return true;
    }
  }
  else { // Retract
    // In the case of a brutal deceleration (crash again an object or a wall) the speed gets down too fast for this spoiler retract window
    // If we record a brutal deceleration below the spoiler retract speed then retract the spoiler
    if (this.m_hgyi56_EVS_brutalDeceleration || absSpeed > targetSpeed - speedWindow) && absSpeed <= targetSpeed && Equals(this.m_hgyi56_EVS_vehicleMomentumType, EMomentumType.Decelerate) {
      return true;
    }
  }

  return false;
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_IsPanzer() -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  if !IsDefined(vehicle) {
    return false;
  }

  let tank: ref<TankObject> = vehicle as TankObject;
  return IsDefined(tank);
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_IsNCARTMetro() -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  if !IsDefined(vehicle) {
    return false;
  }
  
  let ncartMetro: ref<ncartMetroObject> = vehicle as ncartMetroObject;
  return IsDefined(ncartMetro);
}

@addMethod(VehicleComponent)
protected final func hgyi56_EVS_IsDelamainTaxi() -> Bool {
  if !IsDefined(this.m_hgyi56_EVS_vehicleRecord) {
    return false;
  }

  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = GetGameInstance();
  let key: Uint64 = TDBID.ToNumber(this.m_hgyi56_EVS_vehicleRecord.DrivingParamsGeneric().GetID());

  if !IsDefined(vehicle) {
    return false;
  }

  if VehicleData.Get(gi).drivingParamsGeneric_VehicleMap.KeyExist(key) {
    let driveParams: ref<StringWrapper> = VehicleData.Get(gi).drivingParamsGeneric_VehicleMap.Get(key) as StringWrapper;
    
    if Equals(driveParams.name, "Driving.Default_Delamain") {
      return true;
    }
  }

  return false;
}

@replaceMethod(VehicleComponent)
protected final func OnVehicleCameraChange(state: Bool) -> Void { // false = FPP, true = TPP
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = vehicle.GetGame();
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gi).GetLocalPlayerMainGameObject() as PlayerPuppet;
  
  if !IsDefined(vehicle) {
    return;
  }

  let animFeature: ref<AnimFeature_VehicleState>;
  if this.GetPS().GetCrystalDomeState() && (!this.m_hgyi56_EVS_playerIsDismounting || !player.IsInCombat()) {
    animFeature = new AnimFeature_VehicleState();
    animFeature.tppEnabled = !state; // tppEnabled should be named fppEnabled
    AnimationControllerComponent.ApplyFeatureToReplicate(this.GetVehicle(), n"VehicleState", animFeature);
    this.TogglePanzerShadowMeshes(state);
  };
}

@wrapMethod(VehicleComponent)
protected final func OnVehicleSpeedChange(speed: Float) -> Void {
  let doors: array<CName>;
  let vehDataPackage: wref<VehicleDataPackage_Record>;
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = vehicle.GetGame();
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gi).GetLocalPlayerMainGameObject() as PlayerPuppet;

  if !IsDefined(vehicle) {
    return;
  }

  // Keep default behavior for NPCs
  if this.hgyi56_EVS_IsUnsupportedVehicleType()
  || !VehicleComponent.IsMountedToProvidedVehicle(gi, player.GetEntityID(), vehicle) {
    wrappedMethod(speed);
    return;
  }

  if this.hgyi56_EVS_ShouldApplyReverseLights() {
    this.hgyi56_EVS_ApplyReverseLightsSettingsChange();
  }
  if speed >= -3.00 && this.m_hgyi56_EVS_reverseLightsUpdatedSinceLastReverse && Equals(this.m_hgyi56_EVS_vehicleMomentumType, EMomentumType.Decelerate) {
    this.m_hgyi56_EVS_reverseLightsUpdatedSinceLastReverse = false;
    
    this.hgyi56_EVS_UpdateActiveEffectIdentifier(vehicleELightType.Reverse);
    this.GetVehicleController().ToggleLights(false, vehicleELightType.Reverse);
  }
  
  // Update vehicle momentum type
  this.hgyi56_EVS_UpdateMomentumType(speed);

  //////////////////
  // Do not check door speed closing for motorbikes
  let allowDriveClosingDoors: Bool = false;
  
  if vehicle != (vehicle as BikeObject) {
    allowDriveClosingDoors = this.hgyi56_EVS_AllowCloseDoorsWithSpeed(speed);
  }
  //////////////////

  if this.m_hasSpoiler {
    // Only deploy spoiler with speed if user settings allow it
    if !this.m_spoilerDeployed && MyModSettings.Get(GetGameInstance()).spoilerDeploySpeedEnabled() && this.hgyi56_EVS_AllowSpoilerToggleWithSpeed(speed, true) {

      this.hgyi56_EVS_ToggleSpoiler(!this.m_spoilerDeployed);
    }
    // Only retract spoiler with speed if user settings allow it
    else if this.m_spoilerDeployed && MyModSettings.Get(GetGameInstance()).spoilerRetractSpeedEnabled() && this.hgyi56_EVS_AllowSpoilerToggleWithSpeed(speed, false) {

      this.hgyi56_EVS_ToggleSpoiler(!this.m_spoilerDeployed);
    };
  };
  if this.GetPS().GetHasAnyDoorOpen() {
    if this.m_ignoreAutoDoorClose {
      return;
    };
    VehicleComponent.GetVehicleDataPackage(GetGameInstance(), this.GetVehicle(), vehDataPackage);

    ////////////////////
    // Get default closing speed for this vehicle, and if necessary use the user settings
    let doorsDriveClosingSpeed: Float = vehDataPackage.SpeedToClose();

    if Equals(MyModSettings.Get(GetGameInstance()).doorsDriveClosing(), EDoorsDriveClosing.CustomSpeed) {
      doorsDriveClosingSpeed = this.hgyi56_EVS_ToGameSpeed(MyModSettings.Get(GetGameInstance()).doorsDriveClosingSpeed());
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
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(vehicleObj.GetGame()).GetLocalPlayerMainGameObject() as PlayerPuppet;

  if !IsDefined(vehicleObj) {
    return;
  }

  if vehicleObj.IsVehicleOnStateLocked() {
    if Equals(lockState, VehicleQuestEngineLockState.DontToggleIfLocked) {
      return;
    };
    vehicleObj.LockVehicleOnState(false);
  };
  // During staged scene when the player does not have complete control, the vehicle must be able to start normally (ex.: mission Firestarter)
  if !this.GetPS().m_hgyi56_EVS_vehicleDrivenByV || this.hgyi56_EVS_IsUnsupportedVehicleType() || !player.hgyi56_EVS_IsFullGameplay() {
    if vehicle {
      vehicleObj.TurnVehicleOn(toggle);
      vehicleObj.SetInteriorUIEnabled(toggle); // Allows mission vehicles to have dashboards enabled properly

      if toggle && vehicleObj.IsPlayerDriver() && !player.hgyi56_EVS_IsFullGameplay() {
        this.hgyi56_EVS_TogglePowerState(toggle);
      }
    };
    if engine {
      vehicleObj.TurnEngineOn(toggle);
      this.GetPS().m_hgyi56_EVS_engineState = toggle;

      vehicleObj.SetInteriorUIEnabled(toggle); // Allows mission vehicles to have dashboards enabled properly

      if toggle && vehicleObj.IsPlayerDriver() && !player.hgyi56_EVS_IsFullGameplay() {
        this.hgyi56_EVS_TogglePowerState(toggle);
      }
    };
  }
  if Equals(lockState, VehicleQuestEngineLockState.Lock) {
    vehicleObj.LockVehicleOnState(true);
  };
}

@replaceMethod(VehicleComponent)
protected final func EvaluateWindowReaction(doorID: CName, speed: CName) -> Void {
  let door: EVehicleDoor;
  let windowState: EVehicleWindowState;
  let animFeature: ref<AnimFeature_PartData> = new AnimFeature_PartData();
  let animFeatureName: CName = StringToName(NameToString(doorID) + "_window");
  if !this.GetVehicleDoorEnum(door, doorID) {
    return;
  };
  windowState = this.GetPS().GetWindowState(door);
  if Equals(speed, n"Fast") {
    animFeature.duration = 0.20;
  }
  else if Equals(speed, n"Custom") && IsDefined(this.GetPS().m_hgyi56_EVS_windowTimings) {
    animFeature.duration = Equals(windowState, EVehicleWindowState.Open) ? this.GetPS().m_hgyi56_EVS_windowTimings.openTiming : this.GetPS().m_hgyi56_EVS_windowTimings.closeTiming;
  }
  else {
    animFeature.duration = -1.00;
  };
  if Equals(windowState, EVehicleWindowState.Open) {
    animFeature.state = 1;
    AnimationControllerComponent.ApplyFeatureToReplicate(this.GetVehicle(), animFeatureName, animFeature);
  };
  if Equals(windowState, EVehicleWindowState.Closed) {
    animFeature.state = 3;
    AnimationControllerComponent.ApplyFeatureToReplicate(this.GetVehicle(), animFeatureName, animFeature);
  };
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_GetMemoryWindowState(doorEnum: EVehicleDoor) -> EVehicleWindowState {
  let windowState: EVehicleWindowState;

  switch doorEnum {
    case EVehicleDoor.seat_front_left:
      windowState = this.GetPS().m_hgyi56_EVS_FL_windowState;
      break;
      
    case EVehicleDoor.seat_front_right:
      windowState = this.GetPS().m_hgyi56_EVS_FR_windowState;
      break;
      
    case EVehicleDoor.seat_back_left:
      windowState = this.GetPS().m_hgyi56_EVS_BL_windowState;
      break;
      
    case EVehicleDoor.seat_back_right:
      windowState = this.GetPS().m_hgyi56_EVS_BR_windowState;
      break;
  }

  return windowState;
}

@addMethod(VehicleComponent)
public func hgyi56_EVS_SetMemoryDoorState(doorEnum: EVehicleDoor, doorState: VehicleDoorState) {

  switch doorEnum {
    case EVehicleDoor.seat_front_left:
      this.GetPS().m_hgyi56_EVS_FL_doorState = doorState;
      break;
      
    case EVehicleDoor.seat_front_right:
      this.GetPS().m_hgyi56_EVS_FR_doorState = doorState;
      break;
      
    case EVehicleDoor.seat_back_left:
      this.GetPS().m_hgyi56_EVS_BL_doorState = doorState;
      break;
      
    case EVehicleDoor.seat_back_right:
      this.GetPS().m_hgyi56_EVS_BR_doorState = doorState;
      break;
  }
}

@wrapMethod(VehicleComponentPS)
public final func OnVehicleDoorOpen(evt: ref<VehicleDoorOpen>) -> EntityNotificationType {
  let gi: GameInstance = GetGameInstance();
  let doorEnum: EVehicleDoor = IntEnum<EVehicleDoor>(Cast<Int32>(EnumValueFromName(n"EVehicleDoor", evt.slotID)));
  let vehicle: ref<VehicleObject> = this.GetOwnerEntity();
  let vehComp: ref<VehicleComponent> = vehicle.GetVehicleComponent();
  let player: ref<PlayerPuppet> = GetPlayer(gi);
  
  if !IsDefined(vehicle) || !IsDefined(player) {
    return EntityNotificationType.DoNotNotifyEntity;
  }

  // Handle any door (driver and passenger)
  let playerIsMounted = VehicleComponent.IsMountedToProvidedVehicle(gi, player.GetEntityID(), vehicle);

  // Roof light
  if MyModSettings.Get(gi).interiorlightsRoofLightTurnOnWithDoors()
  && (Equals(doorEnum, EVehicleDoor.seat_front_left) || Equals(doorEnum, EVehicleDoor.seat_front_right) || Equals(doorEnum, EVehicleDoor.seat_back_left) || Equals(doorEnum, EVehicleDoor.seat_back_right))
  && Equals(this.GetDoorState(doorEnum), VehicleDoorState.Closed)
  && playerIsMounted {
    vehComp.hgyi56_EVS_ToggleRoofLight(true, true);
  }

  return wrappedMethod(evt);
}

@replaceMethod(VehicleComponent)
protected cb func OnVehicleDoorOpen(evt: ref<VehicleDoorOpen>) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = vehicle.GetGame();

  if !IsDefined(vehicle) {
    return false;
  }

  let m_hgyi56_EVS_shouldOpenWindow: Bool = evt.m_hgyi56_EVS_shouldOpenWindow;

  let mountingSlotId: MountingSlotId;
  mountingSlotId.id = evt.slotID;

  // If the vehicle has incompatible sliding door windows and the window is open, then close the window while the door is opening
  let doorEnum: EVehicleDoor = IntEnum<EVehicleDoor>(EnumValueFromName(n"EVehicleDoor", evt.slotID));
  if this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow && Equals(this.GetPS().GetWindowState(doorEnum), EVehicleWindowState.Open) {
    VehicleComponent.ToggleVehicleWindow(gi, vehicle, mountingSlotId, false);
    m_hgyi56_EVS_shouldOpenWindow = true;
  }

  if this.GetPS().m_hgyi56_EVS_isSingleFrontDoor && (Equals(evt.slotID, VehicleComponent.GetFrontPassengerSlotName()) || Equals(evt.slotID, VehicleComponent.GetDriverSlotName())) {
    this.GetPS().SetDoorState(EVehicleDoor.seat_front_right, VehicleDoorState.Open, evt.forceScene);
    this.GetPS().SetDoorState(EVehicleDoor.seat_front_left, VehicleDoorState.Open, evt.forceScene);
    evt.slotID = VehicleComponent.GetDriverSlotName();
  }

  let PSVehicleDoorCloseRequest: ref<VehicleDoorClose>;
  let autoCloseDelay: Float;
  this.EvaluateDoorReaction(evt.slotID, evt.forceScene, VehicleDoorState.Open);

  if evt.shouldAutoClose {
    PSVehicleDoorCloseRequest = new VehicleDoorClose();
    PSVehicleDoorCloseRequest.slotID = evt.slotID;
    PSVehicleDoorCloseRequest.m_hgyi56_EVS_shouldOpenWindow = m_hgyi56_EVS_shouldOpenWindow;
    autoCloseDelay = evt.autoCloseTime;
    if autoCloseDelay == 0.00 {
      autoCloseDelay = 1.50;
    };

    let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gi).GetLocalPlayerMainGameObject() as PlayerPuppet;
    
    // Define doors state when V gets in or out
    if !this.hgyi56_EVS_IsUnsupportedVehicleType() && VehicleComponent.IsMountedToProvidedVehicle(gi, player.GetEntityID(), vehicle) {
      this.hgyi56_EVS_RecallVehicleDoorsState(autoCloseDelay, m_hgyi56_EVS_shouldOpenWindow);
    }
    else { // NPCs behavior
      GameInstance.GetDelaySystem(GetGameInstance()).DelayPSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), PSVehicleDoorCloseRequest, autoCloseDelay, true);
    }
  };
  this.GetPS().SetHasAnyDoorOpen(true);
}

@wrapMethod(VehicleComponent)
protected cb func OnVehicleDoorClose(evt: ref<VehicleDoorClose>) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = vehicle.GetGame();

  if !IsDefined(vehicle) {
    return false;
  }

  let returnValue: Bool = wrappedMethod(evt);

  if this.GetPS().m_hgyi56_EVS_isSingleFrontDoor && (Equals(evt.slotID, VehicleComponent.GetFrontPassengerSlotName()) || Equals(evt.slotID, VehicleComponent.GetDriverSlotName())) {
    this.GetPS().SetDoorState(EVehicleDoor.seat_front_right, VehicleDoorState.Closed, evt.forceScene);
    this.GetPS().SetDoorState(EVehicleDoor.seat_front_left, VehicleDoorState.Closed, evt.forceScene);
  }
  
  if evt.m_hgyi56_EVS_shouldOpenWindow {
    let doorEnum: EVehicleDoor = IntEnum<EVehicleDoor>(EnumValueFromName(n"EVehicleDoor", evt.slotID));

    if NotEquals(this.hgyi56_EVS_GetMemoryWindowState(doorEnum), this.GetPS().GetWindowState(doorEnum)) {
      let event: ref<VehicleWindowOpen> = new VehicleWindowOpen();
      event.slotID = evt.slotID;    
      GameInstance.GetPersistencySystem(gi).QueuePSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), event);
    }

    if this.GetPS().m_hgyi56_EVS_isSingleFrontDoor {
      if NotEquals(this.GetPS().m_hgyi56_EVS_FR_windowState, this.GetPS().GetWindowState(EVehicleDoor.seat_front_right)) {
        let event: ref<VehicleWindowOpen> = new VehicleWindowOpen();
        event.slotID = VehicleComponent.GetFrontPassengerSlotName();    
        GameInstance.GetPersistencySystem(gi).QueuePSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), event);
      }
    }
  }

  return returnValue;
}

@replaceMethod(VehicleComponent)
private final func CloseSelectedDoors(const doors: script_ref<array<CName>>) -> Void {
  let PSVehicleDoorCloseRequest: ref<VehicleDoorClose>;
  let size: Int32 = ArraySize(Deref(doors));
  let i: Int32 = 0;

  while i < size {    
    let m_hgyi56_EVS_shouldOpenWindow: Bool = false;
    let doorEnum: EVehicleDoor = IntEnum<EVehicleDoor>(EnumValueFromName(n"EVehicleDoor", Deref(doors)[i]));

    if this.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow {
      if Equals(doorEnum, EVehicleDoor.seat_front_left)
      && Equals(this.GetPS().GetDoorState(doorEnum), VehicleDoorState.Open)
      && Equals(this.GetPS().m_hgyi56_EVS_FL_windowState, EVehicleWindowState.Open) {
        m_hgyi56_EVS_shouldOpenWindow = true;
      }

      if Equals(doorEnum, EVehicleDoor.seat_front_right)
      && ((!this.GetPS().m_hgyi56_EVS_isSingleFrontDoor && Equals(this.GetPS().GetDoorState(doorEnum), VehicleDoorState.Open)) || (this.GetPS().m_hgyi56_EVS_isSingleFrontDoor && Equals(this.GetPS().GetDoorState(EVehicleDoor.seat_front_left), VehicleDoorState.Open)))
      && Equals(this.GetPS().m_hgyi56_EVS_FR_windowState, EVehicleWindowState.Open) {
        m_hgyi56_EVS_shouldOpenWindow = true;
      }

      if Equals(doorEnum, EVehicleDoor.seat_back_left)
      && Equals(this.GetPS().GetDoorState(doorEnum), VehicleDoorState.Open)
      && Equals(this.GetPS().m_hgyi56_EVS_BL_windowState, EVehicleWindowState.Open) {
        m_hgyi56_EVS_shouldOpenWindow = true;
      }

      if Equals(doorEnum, EVehicleDoor.seat_back_right)
      && Equals(this.GetPS().GetDoorState(doorEnum), VehicleDoorState.Open)
      && Equals(this.GetPS().m_hgyi56_EVS_BR_windowState, EVehicleWindowState.Open) {
        m_hgyi56_EVS_shouldOpenWindow = true;
      }
    }

    PSVehicleDoorCloseRequest = new VehicleDoorClose();
    PSVehicleDoorCloseRequest.slotID = Deref(doors)[i];
    PSVehicleDoorCloseRequest.m_hgyi56_EVS_shouldOpenWindow = m_hgyi56_EVS_shouldOpenWindow;
    GameInstance.GetPersistencySystem(GetGameInstance()).QueuePSEvent(this.GetPS().GetID(), this.GetPS().GetClassName(), PSVehicleDoorCloseRequest);

    this.hgyi56_EVS_SetMemoryDoorState(doorEnum, VehicleDoorState.Closed);

    i += 1;
  };
  this.GetPS().SetHasAnyDoorOpen(false);
}

@replaceMethod(VehicleComponent)
protected cb func OnCurrentWantedLevelChanged(value: Int32) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = vehicle.GetGame();

  if !IsDefined(vehicle) {
    return false;
  }

  // // // // // // //
  // When the wanted level gets down to zero, the game turns all the police vehicles to siren state OFF
  // This code prevents V driving a police vehicle to be affected by this behavior
  if value == 0 && (!vehicle.IsPlayerDriver() || this.hgyi56_EVS_IsUnsupportedVehicleType()) {
    this.ToggleSiren(false, false);

    if vehicle == (vehicle as BikeObject)
    && MyModSettings.Get(gi).policeBikeSirenEnabled() {
      let driver: ref<ScriptedPuppet> = VehicleComponent.GetDriver(gi, vehicle, vehicle.GetEntityID()) as ScriptedPuppet;
      if IsDefined(driver) {
        // Stop siren from driver puppet
        GameObject.StopSound(driver, n"v_car_villefort_cortes_police_siren_start");
      }
      // Stop static siren from vehicle object
      GameObject.StopSound(vehicle, n"v_car_villefort_cortes_police_siren_start");
    }

    // Update the siren state accordingly
    this.GetPS().m_hgyi56_EVS_threeStatesSiren = 0;
  }
  // // // // // // //
}

@replaceMethod(VehicleComponent)
protected cb func OnVehicleChaseTargetEvent(evt: ref<VehicleChaseTargetEvent>) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetVehicle();
  let gi: GameInstance = vehicle.GetGame();

  if !IsDefined(vehicle) {
    return false;
  }

  if evt.inProgress {
    
    // Lights + Siren ON (internal game siren state is ON)
    this.GetVehicleController().ToggleLights(true, vehicleELightType.Utility);
    this.StartEffectEvent(vehicle, n"police_sign_combat", true);
    this.GetPS().SetSirenLightsState(true);
    this.GetPS().SetSirenState(true);
    this.GetPS().SetSirenSoundsState(true);

    if vehicle == (vehicle as BikeObject)
    && MyModSettings.Get(gi).policeBikeSirenEnabled() {
      let driver: ref<ScriptedPuppet> = VehicleComponent.GetDriver(gi, vehicle, vehicle.GetEntityID()) as ScriptedPuppet;
      if IsDefined(driver) {
        // Start siren on driver puppet
        GameObject.PlaySound(driver, n"v_car_villefort_cortes_police_siren_start");
      }
    }

    // // // // // // //
    // Police NPCs in chase always drive with lights ON + siren ON so this is state 2
    // Update the siren state accordingly
    this.GetPS().m_hgyi56_EVS_threeStatesSiren = 2;
    // // // // // // //
  }
}

// Only to disable some base game behavior. Do not add anything else in the method
@replaceMethod(VehicleComponent)
protected cb func OnChangeState(evt: ref<vehicleChangeStateEvent>) -> Bool {
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
        if !this.GetPS().m_hgyi56_EVS_vehicleDrivenByV || this.hgyi56_EVS_IsUnsupportedVehicleType() {
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
        if !this.GetPS().m_hgyi56_EVS_vehicleDrivenByV || this.hgyi56_EVS_IsUnsupportedVehicleType() {
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
}

@addMethod(VehicleObject)
protected cb func hgyi56_EVS_OnChangeHeadLightModeEvent(evt: ref<vehicleChangeHeadLightModeEvent>) {
  let vehComp: ref<VehicleComponent> = this.GetVehicleComponent();
  if !IsDefined(vehComp) {
    return;
  }

  if vehComp.m_hgyi56_EVS_isHeadlightsCallStarted {
    vehComp.m_hgyi56_EVS_isHeadlightsCallStarted = false;
    return;
  }

  if vehComp.m_hgyi56_EVS_isHeadlightsCallEnded {
    vehComp.m_hgyi56_EVS_isHeadlightsCallEnded = false;

    for lightComp in this.m_hgyi56_EVS_headlightsComponents {
      if IsDefined(lightComp) {
        let params: ref<LightComponentParameters> = this.m_hgyi56_EVS_lightComponentsParameters.Get(TDBID.ToNumber(TDBID.Create(ToString(lightComp.name)))) as LightComponentParameters;

        lightComp.turnOnTime = params.turnOnTime;
        lightComp.turnOffTime = params.turnOffTime;
        lightComp.turnOnCurve = params.turnOnCurve;
        lightComp.turnOffCurve = params.turnOffCurve;
      }
    }
  }

  if this.IsPlayerDriver() && !vehComp.GetPS().m_hgyi56_EVS_temporaryHeadlightsShutOff && !vehComp.hgyi56_EVS_IsUnsupportedVehicleType() {
    vehComp.hgyi56_EVS_ApplyHeadlightsMode();
  }
}

@replaceMethod(VehicleObject)
protected cb func OnMountingEvent(evt: ref<MountingEvent>) -> Bool {
  
  let mountChild: ref<GameObject> = GameInstance.FindEntityByID(this.GetGame(), evt.request.lowLevelMountingInfo.childId) as GameObject;
  if mountChild == null {
    return false;
  };
  if mountChild.IsPlayer() {
    let vehicleComp: ref<VehicleComponent> = this.GetVehicleComponent();

    if IsDefined(vehicleComp) {

      this.SyncVehicleVisualCustomizationDefinition();
      // this.GetVehicleComponent().EnableCustomizableAppearance(false);

      if vehicleComp.hgyi56_EVS_IsUnsupportedVehicleType() || (vehicleComp.hgyi56_EVS_IsDelamainTaxi() && !this.IsPlayerDriver()) {
        this.SetInteriorUIEnabled(true);
      }
    }

    if this.ReevaluateStealing(mountChild, evt.request.lowLevelMountingInfo.slotId.id, evt.request.mountData.mountEventOptions.occupiedByNonFriendly) {
      this.StealVehicle(mountChild);
    };
  }
  else if VehicleComponent.IsDriver(this.GetGame(), mountChild) {
    // If a NPC is mounting as the driver, then enable UI
    // This behavior is useful when V enters in a story driven vehicle as a passenger
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

    if mountChild.IsPlayer() {
      if IsDefined(vehicleComp) && !vehicleComp.GetPS().m_hgyi56_EVS_vehicleDrivenByV {
        if !isSilentUnmount && vehicleComp.hgyi56_EVS_IsUnsupportedVehicleType() {
          this.SetInteriorUIEnabled(false);
        }

        // If the player gets out and has not driven the vehicle, then he is the passenger of a story vehicle. In this case, close his window
        // Because the player may have open its own window
        vehicleComp.hgyi56_EVS_CloseWindow(evt.request.lowLevelMountingInfo.slotId);
      }

      GameInstance.GetDelaySystem(this.GetGame()).DelayEvent(this, new CheckVehicleVisialCustomizationDistanceTermination(), 1.00);
    }

    // Only disable UI if the driver NPC gets out
    if !mountChild.IsPlayer() && Equals(evt.request.lowLevelMountingInfo.slotId, VehicleComponent.GetDriverSlotID()) && !this.IsStolen() {
      this.SetInteriorUIEnabled(false); // Only if the vehicle is not being stolen
    }
  }
}

@replaceMethod(vehicleUIGameController)
private final func CheckIfVehicleShouldTurnOn() -> Void {
  if this.m_vehiclePS.GetIsUiQuestModified() {
    if this.m_vehiclePS.GetUiQuestState() {
      this.TurnOn();
    };
    return;
  };
  if this.m_vehicle.GetVehiclePS().m_hgyi56_EVS_powerState {
    this.TurnOn();
  }
  
  // For Delamain escaping the Konpeki Plaza hotel during "The Heist" mission. (other missions may need this too)
  //
  // Also for regular NPCs
  else if !this.m_vehicle.IsPlayerDriver() && this.m_vehicleBlackboard.GetInt(GetAllBlackboardDefs().Vehicle.VehicleState) == EnumInt(vehicleEState.On) {
    this.TurnOn();
  }
}

@replaceMethod(vehicleUIGameController)
protected cb func OnVehicleStateChanged(state: Int32) -> Bool {
  let vehicleState: vehicleEState = IntEnum<vehicleEState>(state);

  if this.m_vehiclePS.GetIsUiQuestModified() {
    return false;
  }

  switch (vehicleState) {
    case vehicleEState.Default:
      if !this.m_vehiclePS.m_hgyi56_EVS_vehicleDrivenByV {
        this.m_vehicle.GetVehicleComponent().hgyi56_EVS_TogglePowerState(false); // When summoning a vehicle but not mounting, the vehicle turns off after a delay
        this.TurnOff();
      }
      break;
      
    case vehicleEState.On:
      if !this.m_vehiclePS.m_hgyi56_EVS_vehicleDrivenByV {
        this.TurnOn();
      }
      break;
      
    case vehicleEState.Disabled:
    case vehicleEState.Destroyed:
      this.TurnOff();
      break;
  }
}

@addField(VehicleUIactivateEvent)
public let entityID: EntityID;

@replaceMethod(vehicleUIGameController)
protected cb func OnActivateUI(activate: Bool) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetOwnerEntity() as VehicleObject;
  if !IsDefined(vehicle) {
    return false;
  }
  
  let evt: ref<VehicleUIactivateEvent> = new VehicleUIactivateEvent();
  evt.m_activate = activate;
  evt.entityID = vehicle.GetEntityID();
  this.QueueEvent(evt);
}

@replaceMethod(vehicleUIGameController)
protected cb func OnActivateUIEvent(evt: ref<VehicleUIactivateEvent>) -> Bool {
  let vehicle: ref<VehicleObject> = this.GetOwnerEntity() as VehicleObject;
  if !IsDefined(vehicle) {
    return false;
  }

  if NotEquals(vehicle.GetEntityID(), evt.entityID) {
    return false;
  }
  
  if evt.m_activate {
    this.ActivateUI();
  } else {
    this.DeactivateUI();
  };
}

@replaceMethod(vehicleUIGameController)
private final func DeactivateUI() -> Void {
  this.UnregisterBlackBoardCallbacks();
  this.TurnOff();
}

@replaceMethod(vehicleUIGameController)
protected cb func OnEndAnimFinished(anim: ref<inkAnimProxy>) -> Bool {
  let gi: GameInstance = GetGameInstance();
  let player = GetPlayer(gi);

  this.m_rootWidget.SetState(n"inactive");

  // For Takemura's car at Red Peaks landfill site (after "The Heist" mission, other missions may need this too)
  if player.hgyi56_EVS_IsFullGameplay() {
    this.m_rootWidget.SetVisible(false);
  }

  // Make sure it won't turn on by other mean
  // For Takemura's car at Red Peaks landfill site (after "The Heist" mission, other missions may need this too)
  if IsDefined(this.m_vehicle) && player.hgyi56_EVS_IsFullGameplay() {
    this.m_vehicle.SetInteriorUIEnabled(false);
  }
}

@replaceMethod(vehicleUIGameController)
private final func TurnOn() -> Void {
  this.KillBootupProxy();
  if this.m_UIEnabled {
    this.PlayIdleLoop();
  } else {
    this.m_UIEnabled = true;
    this.m_startAnimProxy = this.PlayLibraryAnimation(n"start");
    
    // In case some vehicles don't have the start animation defined
    if !this.m_startAnimProxy.IsLoadingFailed() {
      this.m_startAnimProxy.RegisterToCallback(inkanimEventType.OnFinish, this, n"OnStartAnimFinished");
    }
    else {
      this.OnStartAnimFinished(null);
    }

    this.EvaluateWidgetStyle(GameInstance.GetTimeSystem(this.m_vehicle.GetGame()).GetGameTime());
  };
}

@replaceMethod(vehicleUIGameController)
private final func TurnOff() -> Void {
  this.m_UIEnabled = false;
  this.KillBootupProxy();
  if IsDefined(this.m_startAnimProxy) {
    this.m_startAnimProxy.Stop();
  };
  if IsDefined(this.m_loopAnimProxy) {
    this.m_loopAnimProxy.Stop();
  };
  this.m_endAnimProxy = this.PlayLibraryAnimation(n"end");

  // Some vehicles don't have the end animation defined
  if !this.m_endAnimProxy.IsLoadingFailed() {
    this.m_endAnimProxy.RegisterToCallback(inkanimEventType.OnFinish, this, n"OnEndAnimFinished");
  }
  else {
    this.OnEndAnimFinished(null);
  }
}

// Prevents dashboard from disappearing when using multiple vehicles next to each other
@wrapMethod(vehicleUIGameController)
private final func IsUIactive() -> Bool {
  let gi: GameInstance = GetGameInstance();
  let vehicle: ref<VehicleObject> = this.GetOwnerEntity() as VehicleObject;
  let vehicleComp: ref<VehicleComponent> = vehicle.GetVehicleComponent();
  let driver: ref<ScriptedPuppet> = VehicleComponent.GetDriver(gi, vehicle, vehicle.GetEntityID()) as ScriptedPuppet;

  if IsDefined(vehicleComp) && IsDefined(vehicle)
  && !vehicleComp.hgyi56_EVS_IsUnsupportedVehicleType()
  && vehicleComp.GetPS().m_hgyi56_EVS_vehicleDrivenByV {

    return vehicleComp.GetPS().m_hgyi56_EVS_powerState;
  }
  else if IsDefined(driver) { // If there is a driver then UI is enabled
    return true;
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
      if IsDefined(vehicleComp) && !vehicleComp.GetPS().m_hgyi56_EVS_playerIsMounted && !vehicleComp.hgyi56_EVS_IsUnsupportedVehicleType() {
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
  let player: ref<PlayerPuppet> = scriptInterface.executionOwner as PlayerPuppet;
  let vehicle: ref<VehicleObject> = player.m_mountedVehicle;
  let gi: GameInstance = vehicle.GetGame();
  let vehicleComp: ref<VehicleComponent> = player.m_mountedVehicle.GetVehicleComponent();
  
  if IsDefined(vehicleComp) && VehicleComponent.IsMountedToProvidedVehicle(gi, player.GetEntityID(), vehicle) && vehicleComp.GetPS().m_hgyi56_EVS_playerIsMounted
  && !vehicleComp.hgyi56_EVS_IsUnsupportedVehicleType() {
    let FL_doorState: VehicleDoorState = vehicleComp.GetPS().GetDoorState(EVehicleDoor.seat_front_left);
    let FR_doorState: VehicleDoorState = vehicleComp.GetPS().GetDoorState(EVehicleDoor.seat_front_right);

    vehicleComp.hgyi56_EVS_ForceFrontWindowsDuringCombat(FL_doorState, FR_doorState);
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

  let player: ref<PlayerPuppet> = scriptInterface.executionOwner as PlayerPuppet;
  let vehicle: ref<VehicleObject> = player.m_mountedVehicle;
  let gi: GameInstance = vehicle.GetGame();
  let vehicleComp: ref<VehicleComponent> = player.m_mountedVehicle.GetVehicleComponent();

  // Close front windows only if their previous state was closed
  if IsDefined(vehicleComp) && VehicleComponent.IsMountedToProvidedVehicle(gi, player.GetEntityID(), vehicle) && vehicleComp.GetPS().m_hgyi56_EVS_playerIsMounted
  && !vehicleComp.hgyi56_EVS_IsUnsupportedVehicleType() {
    if vehicleComp.GetPS().m_hgyi56_EVS_hasWindows {
      vehicleComp.hgyi56_EVS_Recall_FL_WindowsState();
      vehicleComp.hgyi56_EVS_Recall_FR_WindowsState();
    }
  }
  else {
    this.RollDownWindowsForCombat(scriptInterface, false);
  }

  this.SendEquipmentSystemWeaponManipulationRequest(scriptInterface, EquipmentManipulationAction.UnequipAll);
  StatusEffectHelper.RemoveStatusEffect(scriptInterface.executionOwner, t"BaseStatusEffect.PhotoModeForceFPPCamera");
}

@addMethod(PlayerPuppet)
protected cb func hgyi56_EVS_IsFullGameplay() -> Bool {
  return Equals(this.m_sceneTier, GameplayTier.Tier1_FullGameplay);
}

@replaceMethod(PlayerPuppet)
protected cb func OnVehicleStateChange(newState: Int32) -> Bool {
  let isExitingCombat: Bool = false;
  let vehicle: ref<VehicleObject> = this.m_mountedVehicle;

  if !IsDefined(vehicle) {
    return false;
  }

  let vehicleComp: ref<VehicleComponent> = this.m_mountedVehicle.GetVehicleComponent();

  // Player is exiting DriverCombat mode to another mode
  if Equals(this.m_vehicleState, gamePSMVehicle.DriverCombat) {
    isExitingCombat = true;
  }
  
  // Player is entering DriverCombat mode
  if IsDefined(vehicleComp) && Equals(IntEnum<gamePSMVehicle>(newState), gamePSMVehicle.DriverCombat) {
    vehicleComp.GetPS().m_hgyi56_EVS_isDriverCombat = true;

    // Remember current front doors state so when the player has finished combat we can restore the doors state
    vehicleComp.GetPS().m_hgyi56_EVS_FL_doorState = vehicleComp.GetPS().GetDoorState(EVehicleDoor.seat_front_left);
    vehicleComp.GetPS().m_hgyi56_EVS_FR_doorState = vehicleComp.GetPS().m_hgyi56_EVS_isSingleFrontDoor ? vehicleComp.GetPS().m_hgyi56_EVS_FL_doorState : vehicleComp.GetPS().GetDoorState(EVehicleDoor.seat_front_right);

    // Remember current front windows state so when the player has finished combat we can restore the windows state
    if vehicleComp.GetPS().m_hgyi56_EVS_hasWindows {

      if !vehicleComp.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow || Equals(vehicleComp.GetPS().m_hgyi56_EVS_FL_doorState, VehicleDoorState.Closed) {
        vehicleComp.GetPS().m_hgyi56_EVS_FL_windowState = vehicleComp.GetPS().GetWindowState(EVehicleDoor.seat_front_left);
      }

      if !vehicleComp.GetPS().m_hgyi56_EVS_hasIncompatibleSlidingDoorsWindow || Equals(vehicleComp.GetPS().m_hgyi56_EVS_FR_doorState, VehicleDoorState.Closed) {
        vehicleComp.GetPS().m_hgyi56_EVS_FR_windowState = vehicleComp.GetPS().GetWindowState(EVehicleDoor.seat_front_right);
      }
    }
  }
  else if IsDefined(vehicleComp) {    
    vehicleComp.GetPS().m_hgyi56_EVS_isDriverCombat = false;
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
          if IsDefined(vehicleComp) && isExitingCombat && !vehicleComp.hgyi56_EVS_IsUnsupportedVehicleType() {
            vehicleComp.hgyi56_EVS_RecallVehicleDoorsState();
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
  if IsDefined(vehicleComp) && vehicleComp.GetPS().m_hgyi56_EVS_isDriverCombat && this.m_inMountedWeaponVehicle {
    vehicleComp.GetPS().m_hgyi56_EVS_isDriverCombat = false;
  }
}

@replaceMethod(PlayerPuppet)
private final func HandleDoorsForCombat(vehicle: wref<VehicleObject>) -> Void {
  let ignoreAutoDoorCloseEvt: ref<SetIgnoreAutoDoorCloseEvent> = new SetIgnoreAutoDoorCloseEvent();
  let gi: GameInstance = vehicle.GetGame();
  
  let vehicleComp: ref<VehicleComponent> = vehicle.GetVehicleComponent();

  if Equals(this.m_vehicleState, gamePSMVehicle.DriverCombat) {
    ignoreAutoDoorCloseEvt.set = true;
    vehicle.QueueEvent(ignoreAutoDoorCloseEvt);
    VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetDriverSlotID());

    if !IsDefined(vehicleComp) || !vehicleComp.GetPS().m_hgyi56_EVS_isSingleFrontDoor {
      VehicleComponent.OpenDoor(vehicle, VehicleComponent.GetFrontPassengerSlotID());
    }
  } else {
    if NotEquals(this.m_vehicleState, gamePSMVehicle.Transition) && NotEquals(this.m_vehicleState, gamePSMVehicle.Passenger) {
      ignoreAutoDoorCloseEvt.set = false;
      vehicle.QueueEvent(ignoreAutoDoorCloseEvt);

      let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(gi).GetLocalPlayerMainGameObject() as PlayerPuppet;

      // Define doors state when V gets out
      if IsDefined(vehicleComp) && !vehicleComp.hgyi56_EVS_IsUnsupportedVehicleType()
      && VehicleComponent.IsMountedToProvidedVehicle(gi, player.GetEntityID(), vehicle) {
        if !vehicleComp.GetPS().m_hgyi56_EVS_playerIsMounted {
          vehicleComp.hgyi56_EVS_RecallVehicleDoorsState();
        }
      }
      else { // Default game behavior for NPCs
        VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetDriverSlotID());
        
        if !IsDefined(vehicleComp) || !vehicleComp.GetPS().m_hgyi56_EVS_isSingleFrontDoor {
          VehicleComponent.CloseDoor(vehicle, VehicleComponent.GetFrontPassengerSlotID());
        }
      }
    };
  };
}

@wrapMethod(PlayerPuppet)
protected cb func OnCombatStateChanged(newState: Int32) -> Bool {

  let inCombat: Bool = newState == 1;
  let vehicle: ref<VehicleObject> = this.m_mountedVehicle;

  if !IsDefined(vehicle) {
    return wrappedMethod(newState);
  }
  
  let vehComp: ref<VehicleComponent> = vehicle.GetVehicleComponent();
  
  if !IsDefined(vehComp) {
    return wrappedMethod(newState);
  }

  if vehicle.IsPlayerDriver()
  && !vehComp.hgyi56_EVS_IsUnsupportedVehicleType() {
    if inCombat {

      if MyModSettings.Get(GetGameInstance()).autoStartEngineDuringCombat() && !vehicle.IsEngineTurnedOn() {
        vehComp.hgyi56_EVS_TogglePowerState(true);
        vehComp.hgyi56_EVS_ToggleEngineState(true);
      }

      if MyModSettings.Get(GetGameInstance()).autoEnableCrystalDomeDuringCombat() && !vehComp.GetPS().GetCrystalDomeState() {
        vehComp.hgyi56_EVS_MyToggleCrystalDome(true);
      }
    }
  }

  return wrappedMethod(newState);
}

@wrapMethod(PlayerPuppet)
protected cb func OnGameAttached() -> Bool {
  let returnValue: Bool = wrappedMethod();

  this.m_hgyi56_EVS_drivenVehicles = new inkHashMap();
  
  this.m_hgyi56_EVS_inputListener = new GlobalInputListener();
  this.RegisterInputListener(this.m_hgyi56_EVS_inputListener, n"ToggleCustomLights");

  return returnValue;
}

@wrapMethod(PlayerPuppet)
protected cb func OnDetach() -> Bool {

  this.UnregisterInputListener(this.m_hgyi56_EVS_inputListener);
  this.m_hgyi56_EVS_inputListener = null;
  this.m_hgyi56_EVS_drivenVehicles = null;

  return wrappedMethod();
}

public class GlobalInputListener {
  protected cb func OnAction(action: ListenerAction, consumer: ListenerActionConsumer) -> Bool {
    let gi: GameInstance = GetGameInstance();
    let player: ref<PlayerPuppet> = GetPlayer(gi);

    // // // // // // //
    // Event that toggles custom lights settings
    //
    // Multi-tap: toggle custom lights settings for each light type
    //
    if Equals(ListenerAction.GetName(action), n"ToggleCustomLights") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_RELEASED) {
      if !player.m_hgyi56_EVS_toggleCustomLightsLongInputTriggered {
        // If the last press time is older than "MyModSettings.Get(GetGameInstance()).multiTapTimeWindow()" consider this is a new sequence
        if Utils.GetCurrentTime(gi) - player.m_hgyi56_EVS_toggleCustomLightsLastPressTime > MyModSettings.Get(GetGameInstance()).multiTapTimeWindow() {
          player.m_hgyi56_EVS_toggleCustomLightsStep = 0;
        }

        player.m_hgyi56_EVS_toggleCustomLightsLastPressTime = Utils.GetCurrentTime(gi);
        player.m_hgyi56_EVS_toggleCustomLightsStep += 1;

        let event: ref<MultiTapLightsToggleEvent> = new MultiTapLightsToggleEvent();
        event.tapCount = player.m_hgyi56_EVS_toggleCustomLightsStep;
        GameInstance.GetDelaySystem(gi).DelayEvent(player, event, MyModSettings.Get(GetGameInstance()).multiTapTimeWindow(), false);
      }

      player.m_hgyi56_EVS_toggleCustomLightsLongInputTriggered = false;
    }
    // // // // // // //

    // // // // // // //
    // Hold: toggle custom lights settings for all light types
    //
    if Equals(ListenerAction.GetName(action), n"ToggleCustomLights") && Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) {
      player.m_hgyi56_EVS_toggleCustomLightsLongInputTriggered = true;

      // If any custom lights is activated then activate all of them
      if player.GetPS().m_hgyi56_EVS_customHeadlightsEnabled
      || player.GetPS().m_hgyi56_EVS_customTailLightsEnabled
      || player.GetPS().m_hgyi56_EVS_customUtilityLightsEnabled
      || player.GetPS().m_hgyi56_EVS_customBlinkerLightsEnabled
      || player.GetPS().m_hgyi56_EVS_customReverseLightsEnabled
      || player.GetPS().m_hgyi56_EVS_customInteriorLightsEnabled {

        player.GetPS().m_hgyi56_EVS_customHeadlightsEnabled = false;
        player.GetPS().m_hgyi56_EVS_customTailLightsEnabled = false;
        player.GetPS().m_hgyi56_EVS_customUtilityLightsEnabled = false;
        player.GetPS().m_hgyi56_EVS_customBlinkerLightsEnabled = false;
        player.GetPS().m_hgyi56_EVS_customReverseLightsEnabled = false;
        player.GetPS().m_hgyi56_EVS_customInteriorLightsEnabled = false;
      }
      else {
        player.hgyi56_EVS_SetAllLightsCustomSettingsEnabled(true);
      }
      
      player.m_hgyi56_EVS_customLightsAreBeingToggled = true;

      if !IsDefined(player.m_hgyi56_EVS_drivenVehicles) {
        return false;
      }

      let drivenVehicles: array<wref<IScriptable>>;
      player.m_hgyi56_EVS_drivenVehicles.GetValues(drivenVehicles);

      let i = 0;
      while i < ArraySize(drivenVehicles) {
        let vehComp: ref<VehicleComponent> = drivenVehicles[i] as VehicleComponent;

        if IsDefined(vehComp) {
          let vehicle: ref<VehicleObject> = vehComp.GetVehicle();

          if IsDefined(vehicle) {
            vehComp.hgyi56_EVS_OnModSettingsChange();
          }
        }

        i += 1;
      }
      player.m_hgyi56_EVS_customLightsAreBeingToggled = false;
    }

    return true;
  }
}

@wrapMethod(hudCarController)
protected func SetMeasurementUnits(value: Int32) -> Void {
  wrappedMethod(value);
  
  let vehicle: ref<VehicleObject> = this.m_activeVehicle;

  // Get the current user setting for KMH or MPH unit
  if IsDefined(vehicle) {
    let gi: GameInstance = GetGameInstance();
    let player: ref<PlayerPuppet> = GetPlayer(gi);
    let vehicleComp: ref<VehicleComponent> = vehicle.GetVehicleComponent();

    if IsDefined(vehicleComp) && VehicleComponent.IsMountedToProvidedVehicle(gi, player.GetEntityID(), vehicle) && vehicleComp.GetPS().m_hgyi56_EVS_playerIsMounted {
      vehicleComp.GetPS().m_hgyi56_EVS_isKmH = this.m_kmOn;
    }
  }
}

@addMethod(InputContextTransitionEvents)
protected final const func hgyi56_EVS_ShowVehiclePowerEngineInputHint(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>, source: CName) -> Void {
  let vehicle: wref<VehicleObject>;
  VehicleComponent.GetVehicle(scriptInterface.owner.GetGame(), scriptInterface.executionOwner, vehicle);

  if IsDefined(vehicle) {
    let vehicleComp: ref<VehicleComponent> = vehicle.GetVehicleComponent();

    if IsDefined(vehicleComp) {
      if MyModSettings.Get(GetGameInstance()).displayPowerEngineInputHint() {
        this.ShowInputHint(scriptInterface, n"CycleEngineStep1", source, GetLocalizedTextByKey(n"hgyi56-EVS-settings-input_hints-power_engine-label"), inkInputHintHoldIndicationType.Press, false, 127);
      }
    }
  }
}

@addMethod(InputContextTransitionEvents)
protected final const func hgyi56_EVS_ShowVehicleDoorsInputHint(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>, source: CName) -> Void {
  let vehicle: wref<VehicleObject>;
  VehicleComponent.GetVehicle(scriptInterface.owner.GetGame(), scriptInterface.executionOwner, vehicle);

  if IsDefined(vehicle) && vehicle == (vehicle as BikeObject) {
    this.RemoveInputHint(scriptInterface, n"CycleDoor", source);
  }
  else if IsDefined(vehicle) {
    let vehicleComp: ref<VehicleComponent> = vehicle.GetVehicleComponent();

    if IsDefined(vehicleComp) {
      if MyModSettings.Get(GetGameInstance()).displayDoorsInputHint() {
        this.ShowInputHint(scriptInterface, n"CycleDoor", source, GetLocalizedTextByKey(n"hgyi56-EVS-settings-input_hints-doors-label"), inkInputHintHoldIndicationType.Press, false, 127);
      }
    }
  }
}

@addMethod(InputContextTransitionEvents)
protected final const func hgyi56_EVS_ShowVehicleSpoilerInputHint(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>, source: CName) -> Void {
  let vehicle: wref<VehicleObject>;
  VehicleComponent.GetVehicle(scriptInterface.owner.GetGame(), scriptInterface.executionOwner, vehicle);

  if IsDefined(vehicle) && vehicle == (vehicle as BikeObject) {
    this.RemoveInputHint(scriptInterface, n"CycleSpoiler", source);
  }
  else if IsDefined(vehicle) {
    let vehicleComp: ref<VehicleComponent> = vehicle.GetVehicleComponent();

    if IsDefined(vehicleComp) {
      if MyModSettings.Get(GetGameInstance()).displaySpoilerInputHint() {
        this.ShowInputHint(scriptInterface, n"CycleSpoiler", source, s"\(GetLocalizedTextByKey(n"hgyi56-EVS-settings-input_hints-hood_trunk_spoiler-label_hood_trunk"))\(vehicleComp.m_hasSpoiler ? s"/\(GetLocalizedTextByKey(n"hgyi56-EVS-settings-input_hints-hood_trunk_spoiler-label_spoiler"))" : "")", inkInputHintHoldIndicationType.Press, false, 127);
      }
    }
  }
}

@addMethod(InputContextTransitionEvents)
protected final const func hgyi56_EVS_ShowVehicleWindowsInputHint(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>, source: CName) -> Void {
  let vehicle: wref<VehicleObject>;
  VehicleComponent.GetVehicle(scriptInterface.owner.GetGame(), scriptInterface.executionOwner, vehicle);

  if IsDefined(vehicle) && vehicle == (vehicle as BikeObject) {
    this.RemoveInputHint(scriptInterface, n"CycleWindow", source);
  }
  else if IsDefined(vehicle) {
    let vehicleComp: ref<VehicleComponent> = vehicle.GetVehicleComponent();

    if IsDefined(vehicleComp) {
      if vehicleComp.GetPS().m_hgyi56_EVS_hasWindows && MyModSettings.Get(GetGameInstance()).displayWindowsInputHint() {
        this.ShowInputHint(scriptInterface, n"CycleWindow", source, GetLocalizedTextByKey(n"hgyi56-EVS-settings-input_hints-windows-label"), inkInputHintHoldIndicationType.Press, false, 127);
      }
    }
  }
}

@addMethod(InputContextTransitionEvents)
protected final const func hgyi56_EVS_ShowVehicleCrystalDomeInputHint(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>, source: CName) -> Void {
  let vehicle: wref<VehicleObject>;
  VehicleComponent.GetVehicle(scriptInterface.owner.GetGame(), scriptInterface.executionOwner, vehicle);

  if IsDefined(vehicle) && vehicle == (vehicle as BikeObject) {
    this.RemoveInputHint(scriptInterface, n"CycleDome", source);
  }
  else if IsDefined(vehicle) {
    let vehicleComp: ref<VehicleComponent> = vehicle.GetVehicleComponent();

    if IsDefined(vehicleComp) {
      if MyModSettings.Get(GetGameInstance()).displayCrystalDomeInputHint() {
        this.ShowInputHint(scriptInterface, n"CycleDome", source, s"\(GetLocalizedTextByKey(n"hgyi56-EVS-settings-input_hints-crystal_dome-label_lights"))\(vehicleComp.GetPS().m_hgyi56_EVS_hasCrystalDome ? s"/\(GetLocalizedTextByKey(n"hgyi56-EVS-settings-input_hints-crystal_dome-label_dome"))" : "")", inkInputHintHoldIndicationType.Press, false, 127);
      }
    }
  }
}

@addMethod(InputContextTransitionEvents)
protected final const func hgyi56_EVS_ShowVehicleHeadlightsCallInputHint(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>, source: CName) -> Void {
  let vehicle: wref<VehicleObject>;
  VehicleComponent.GetVehicle(scriptInterface.owner.GetGame(), scriptInterface.executionOwner, vehicle);

  if IsDefined(vehicle) {
    let vehicleComp: ref<VehicleComponent> = vehicle.GetVehicleComponent();

    if IsDefined(vehicleComp) {
      if MyModSettings.Get(GetGameInstance()).displayHeadlightsCallInputHint() {
        this.ShowInputHint(scriptInterface, n"HeadlightsCall", source, GetLocalizedTextByKey(n"hgyi56-EVS-settings-input_hints-headlights_call-label"), inkInputHintHoldIndicationType.Press, false, 127);
      }
    }
  }
}

@addMethod(InputContextTransitionEvents)
protected final const func hgyi56_EVS_ShowVehicleToggleLightsSettingsInputHint(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>, source: CName) -> Void {
  
  if Equals(source, n"VehicleDriver") {
    let vehicle: wref<VehicleObject>;
    VehicleComponent.GetVehicle(scriptInterface.owner.GetGame(), scriptInterface.executionOwner, vehicle);

    if IsDefined(vehicle) {
      let vehicleComp: ref<VehicleComponent> = vehicle.GetVehicleComponent();

      if IsDefined(vehicleComp) {
        if MyModSettings.Get(GetGameInstance()).displayToggleLightSettingsInputHint() {
          this.ShowInputHint(scriptInterface, n"ToggleCustomLights", source, GetLocalizedTextByKey(n"hgyi56-EVS-settings-input_hints-toggle_settings-label"), inkInputHintHoldIndicationType.Press, false, 127);
        }
      }
    }
  }
  else {
    let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(scriptInterface.owner.GetGame()).GetLocalPlayerMainGameObject() as PlayerPuppet;

    if MyModSettings.Get(GetGameInstance()).displayToggleLightSettingsInputHint()
    && player.hgyi56_EVS_ShouldDisplayToggleLightSettingsInputHint() {
      
      this.ShowInputHint(scriptInterface, n"ToggleCustomLights", source, GetLocalizedTextByKey(n"hgyi56-EVS-settings-input_hints-toggle_settings-label"), inkInputHintHoldIndicationType.Press, false, 127);
    }
  }
}

@wrapMethod(InputContextTransitionEvents)
protected final const func ShowVehicleDriverInputHints(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) -> Void {
  let vehicle: wref<VehicleObject>;
  VehicleComponent.GetVehicle(scriptInterface.owner.GetGame(), scriptInterface.executionOwner, vehicle);

  if IsDefined(vehicle) {
    let vehicleComp: ref<VehicleComponent> = vehicle.GetVehicleComponent();

    if IsDefined(vehicleComp) && IsDefined(MyModSettings.Get(GetGameInstance())) {
      this.hgyi56_EVS_ShowVehiclePowerEngineInputHint(stateContext, scriptInterface, n"VehicleDriver");
      this.hgyi56_EVS_ShowVehicleDoorsInputHint(stateContext, scriptInterface, n"VehicleDriver");
      this.hgyi56_EVS_ShowVehicleSpoilerInputHint(stateContext, scriptInterface, n"VehicleDriver");
      this.hgyi56_EVS_ShowVehicleWindowsInputHint(stateContext, scriptInterface, n"VehicleDriver");
      this.hgyi56_EVS_ShowVehicleCrystalDomeInputHint(stateContext, scriptInterface, n"VehicleDriver");
      this.hgyi56_EVS_ShowVehicleHeadlightsCallInputHint(stateContext, scriptInterface, n"VehicleDriver");
      this.hgyi56_EVS_ShowVehicleToggleLightsSettingsInputHint(stateContext, scriptInterface, n"VehicleDriver");
    }
  }

  wrappedMethod(stateContext, scriptInterface);
}

@wrapMethod(InputContextTransitionEvents)
protected final const func ShowVehiclePassengerInputHints(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) -> Void {
  let vehicle: wref<VehicleObject>;
  VehicleComponent.GetVehicle(scriptInterface.owner.GetGame(), scriptInterface.executionOwner, vehicle);

  if IsDefined(vehicle) {
    let vehicleComp: ref<VehicleComponent> = vehicle.GetVehicleComponent();

    if IsDefined(vehicleComp) && IsDefined(MyModSettings.Get(GetGameInstance())) {
      if vehicleComp.GetPS().m_hgyi56_EVS_isSlidingDoors {
        this.hgyi56_EVS_ShowVehicleDoorsInputHint(stateContext, scriptInterface, n"VehicleDriver");
      }

      this.hgyi56_EVS_ShowVehicleWindowsInputHint(stateContext, scriptInterface, n"VehicleDriver");
    }
  }
  
  wrappedMethod(stateContext, scriptInterface);
}

@wrapMethod(InputContextTransitionEvents)
protected final const func ShowGenericExplorationInputHints(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) -> Void {
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(scriptInterface.owner.GetGame()).GetLocalPlayerMainGameObject() as PlayerPuppet;

  if !IsDefined(player.m_hgyi56_EVS_drivenVehicles) {
    return;
  }

  let drivenVehicles: array<wref<IScriptable>>;
  player.m_hgyi56_EVS_drivenVehicles.GetValues(drivenVehicles);

  // Count how many driven vehicles still exist
  let drivenVehicleCount: Int32 = 0;
  let i = 0;
  while i < ArraySize(drivenVehicles) {
    let vehComp: ref<VehicleComponent> = drivenVehicles[i] as VehicleComponent;

    if IsDefined(vehComp) {
      let vehicle: ref<VehicleObject> = vehComp.GetVehicle();

      if IsDefined(vehicle) {
        drivenVehicleCount += 1;
      }
    }

    i += 1;
  }

  if IsDefined(player)
  && drivenVehicleCount > 0 {

    this.hgyi56_EVS_ShowVehicleToggleLightsSettingsInputHint(stateContext, scriptInterface, n"Locomotion");
  }

  wrappedMethod(stateContext, scriptInterface);
}

@replaceMethod(VehicleObject)
protected cb func OnProcessVehicleVisualCustomizationLights(evt: ref<VehicleCustomizationLightsEvent>) -> Bool {
  let vehicleComp: ref<VehicleComponent> = this.GetVehicleComponent();
  let player: ref<PlayerPuppet> = GameInstance.GetPlayerSystem(this.GetGame()).GetLocalPlayerMainGameObject() as PlayerPuppet;

  if IsDefined(vehicleComp) {
    player.m_hgyi56_EVS_customLightsAreBeingToggled = true;
    vehicleComp.hgyi56_EVS_OnModSettingsChange();
    player.m_hgyi56_EVS_customLightsAreBeingToggled = false;
  }
}

// Prevent CrystalCoat widgets from being modified
@replaceMethod(VehicleObject)
private final func SetInteriorUIEnabled(enabled: Bool) -> Void {
  let uiComponents: array<ref<worlduiWidgetComponent>> = this.GetUIComponents();

  if ArraySize(uiComponents) > 0 {

    for widget in uiComponents {
      if IsDefined(widget)
      && NotEquals(widget.IsEnabled(), enabled)
      && !StrBeginsWith(ToString(widget.name), "visual_customization_") {
        widget.Toggle(enabled);
      }
    }

    this.GetBlackboard().SetBool(GetAllBlackboardDefs().Vehicle.IsUIActive, enabled);
    this.GetBlackboard().FireCallbacks();
  }
}

@replaceMethod(VehicleComponent)
protected cb func OnExecuteVehicleVisualCustomizationEvent(evt: ref<ExecuteVehicleVisualCustomizationEvent>) -> Bool {
  // set: is true only if the user has used the widget to customize or reset the vehicle
  // reset: is true if the game or the player has decided to reset the vehicle

  if evt.set && !this.CanApplyTemplateOnVehicle(this.GetPS().GetVehicleVisualCustomizationTemplate(), true) {
    return false;
  };
  this.ExecuteVehicleVisualCustomization(evt.set, evt.reset, evt.instant);

  // Refresh head/tail/blinker lights
  this.hgyi56_EVS_ApplyHeadlightsModeWithShutOff();
  this.hgyi56_EVS_ApplyUtilityLightsWithShutOff();
}

@wrapMethod(VehicleObject)
protected cb func OnDetach() -> Bool {
  let player: ref<PlayerPuppet> = GetPlayer(GetGameInstance());

  if !IsDefined(player) {
    return wrappedMethod();
  }

  // Clean unused driven vehicles references
  if ArrayContains(player.GetPS().m_hgyi56_EVS_drivenVehiclesID, this.GetEntityID()) {
    ArrayRemove(player.GetPS().m_hgyi56_EVS_drivenVehiclesID, this.GetEntityID());
  }

  this.m_hgyi56_EVS_lightComponentsParameters = null;
  
  let vehComp: ref<VehicleComponent> = this.GetVehicleComponent();
  if IsDefined(vehComp) {
    let vehCompPS: ref<VehicleComponentPS> = vehComp.GetPS();

    if IsDefined(vehCompPS) {
      vehCompPS.m_hgyi56_EVS_windowTimings = null;
      vehCompPS.m_hgyi56_EVS_crystalDomeMeshTimings = null;
    }
  }
  
  return wrappedMethod();
}

// Remove auto-light toggle when displaying CrystalCoat popup menu
@replaceMethod(vehicleColorSelectorGameController)
protected cb func OnInitialize() -> Bool {
  let deadzoneConfig: ref<ConfigVarFloat>;
  let initEvent: ref<VehicleColorSelectionInitFinishedEvent>;
  // let lightsEvent: ref<VehicleLightQuestToggleEvent>;
  let uiSystemBB: ref<IBlackboard>;
  this.m_popupData = this.GetRootWidget().GetUserData(n"inkGameNotificationData") as inkGameNotificationData;
  this.m_player = this.GetPlayerControlledObject() as PlayerPuppet;
  this.m_player.RegisterInputListener(this, n"__DEVICE_CHANGED__");
  this.m_gameInstance = this.m_player.GetGame();
  this.m_vehicle = this.m_player.GetMountedVehicle();
  uiSystemBB = this.GetBlackboardSystem().Get(GetAllBlackboardDefs().UI_System);
  this.m_isInMenuCallbackID = uiSystemBB.RegisterDelayedListenerBool(GetAllBlackboardDefs().UI_System.IsInMenu, this, n"OnIsInMenuChanged");
  deadzoneConfig = GameInstance.GetSettingsSystem(this.m_player.GetGame()).GetVar(n"/controls", n"Axis_DeadzoneInner") as ConfigVarFloat;
  this.m_axisInputThreshold = deadzoneConfig.GetValue();
  this.RegisterToGlobalInputCallback(n"OnPostOnRelease", this, n"OnGlobalInputReleased");
  this.RegisterToGlobalInputCallback(n"OnPostOnHold", this, n"OnGlobalInputHold");
  this.RegisterToGlobalInputCallback(n"OnPostOnPress", this, n"OnGlobalPressInput");
  this.RegisterToGlobalInputCallback(n"OnPostOnRelative", this, n"OnMouseInput");
  this.RegisterToGlobalInputCallback(n"OnPostOnAxis", this, n"OnGlobalAxisInput");
  inkWidgetRef.RegisterToCallback(this.m_mouseHitColor1Ref, n"OnHoverOver", this, n"OnHoverOverColorWheel1");
  inkWidgetRef.RegisterToCallback(this.m_mouseHitColor2Ref, n"OnHoverOver", this, n"OnHoverOverColorWheel2");
  inkWidgetRef.RegisterToCallback(this.m_mouseHitLightsRef, n"OnHoverOver", this, n"OnHoverOverColorWheelLights");
  inkWidgetRef.RegisterToCallback(this.m_mouseHitColor1Ref, n"OnHoverOut", this, n"OnHoverOutColorWheel1");
  inkWidgetRef.RegisterToCallback(this.m_mouseHitColor2Ref, n"OnHoverOut", this, n"OnHoverOutColorWheel2");
  inkWidgetRef.RegisterToCallback(this.m_mouseHitLightsRef, n"OnHoverOut", this, n"OnHoverOutColorWheelLights");
  inkWidgetRef.RegisterToCallback(this.m_mouseHitSaturationBar, n"OnHoverOver", this, n"OnHoverOverSaturationBar");
  inkWidgetRef.RegisterToCallback(this.m_mouseHitBrightnessBar, n"OnHoverOver", this, n"OnHoverOverBrightnessBar");
  inkWidgetRef.RegisterToCallback(this.m_mouseHitSaturationBar, n"OnPress", this, n"OnSaturationBarPressed");
  inkWidgetRef.RegisterToCallback(this.m_mouseHitBrightnessBar, n"OnPress", this, n"OnBrightnessBarPressed");
  this.m_currentTemplatePreview = this.SpawnFromExternal(inkWidgetRef.Get(this.m_currentTemplateParentRef), inkWidgetLibraryResource.GetPath(this.m_templatePreviewLibraryRef.widgetLibrary), this.m_templatePreviewLibraryRef.widgetItem).GetController() as ColorTemplatePreviewDisplayController;
  this.m_currentTemplatePreview.SetSelected(false);
  this.m_currentTemplatePreview.SetCanAdd(false);
  this.m_currentTemplatePreview.SetToggleable(false);
  if this.m_player.PlayerLastUsedKBM() {
    inkWidgetRef.SetVisible(this.m_changeTabRightHint, false);
    inkWidgetRef.SetVisible(this.m_changeTabLeftHint, false);
  } else {
    inkWidgetRef.SetVisible(this.m_changeTabRightHint, true);
    inkWidgetRef.SetVisible(this.m_changeTabLeftHint, true);
  };
  inkWidgetRef.SetVisible(this.m_saturationBarHint, false);
  inkWidgetRef.SetVisible(this.m_brightnessBarHint, false);
  this.SetTimeDilatation(true);
  this.UpdateVehiclePreview();
  this.UpdateVehicleManufacturer();
  this.UpdateTwintonePanel();
  this.ProcessPreviousCustomizationState();
  this.ProccessSwapColorHintVisibility();
  this.PlayAnimation(this.m_introAnimation);
  this.m_animProxy.RegisterToCallback(inkanimEventType.OnFinish, this, n"OnIntroFinished");
  GameInstance.GetAudioSystem(this.m_gameInstance).Play(n"ui_menu_open");
  initEvent = new VehicleColorSelectionInitFinishedEvent();
  // lightsEvent = new VehicleLightQuestToggleEvent();
  // lightsEvent.toggle = true;
  // this.m_vehicle.QueueEvent(lightsEvent);
  this.ProcessFakeUpdate(true);
  this.QueueEvent(initEvent);
}

// Modify or disable CrystalCoat deactivation by distance
@replaceMethod(VehicleObject)
protected cb func OnCheckVehicleVisialCustomizationDistanceTermination(evt: ref<CheckVehicleVisialCustomizationDistanceTermination>) -> Bool {
  let distanceCheckEvent: ref<CheckVehicleVisialCustomizationDistanceTermination>;
  let switchVisualCustomizationEvent: ref<SwitchVehicleVisualCustomizationStateEvent>;
  let playerDistance: Float = Vector4.DistanceSquared(this.GetWorldPosition(), GetPlayerObject(this.GetGame()).GetWorldPosition());
  if playerDistance < PowF(MyModSettings.Get(GetGameInstance()).crystalCoatDeactivationDistance(), 2) {
    if this.IsPlayerMounted() || !VehicleVisualCustomizationTemplate.IsValid(this.GetVehiclePS().GetVehicleVisualCustomizationTemplate()) || !this.GetVehiclePS().GetIsVehicleVisualCustomizationActive() {
      return false;
    };
    this.GetVehiclePS().SetVehicleApperanceCustomizationInDistanceTermination(true);
    distanceCheckEvent = new CheckVehicleVisialCustomizationDistanceTermination();
    GameInstance.GetDelaySystem(this.GetGame()).DelayEvent(this, distanceCheckEvent, 0.50);
  } else {
    this.GetVehiclePS().SetVehicleApperanceCustomizationInDistanceTermination(false);
    switchVisualCustomizationEvent = new SwitchVehicleVisualCustomizationStateEvent();
    switchVisualCustomizationEvent.on = false;
    this.QueueEvent(switchVisualCustomizationEvent);
  };
}