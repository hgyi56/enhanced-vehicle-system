local power_state_Category = {
  enterBehavior = "KeepCurrentState",
  exitBehavior = "KeepCurrentState",
  preventPowerOffDuringCombat = true,
  autoStartEngineDuringCombat = true
}

local npc_headlights_Category = {
  npcHeadlightsOverride = false,
  npcHeadlightsRadiusMultiplier = 1,
  npcHeadlightsIntensityMultiplier = 1,
  npcHeadlightsAttenuation = "InverseSquare"
}

local headlights_Category = {
  headlightsSynchronizedWithTimeEnabled = false,
  defaultHeadlightsMode = "LowBeam",
  headlightsSynchronizedWithTimeMode = "LowBeam",
  utilityLightsSynchronizedWithTimeVehicleType = "Motorcycles",
  headlightsTurnOnHour = 20,
  headlightsTurnOnMinute = 0,
  headlightsTurnOffHour = 5,
  headlightsTurnOffMinute = 0,

  headlights_AutoResetLightColorEnabled = true,
  headlights_CrystalCoatInclude = true,
  headlights_CrystalCoatColorType = "Lights",
  headlights_ColorSequence = "Solid",
  headlights_SequenceLatency = 0.8,
  headlights_ImpactedVehicles = "AllVehicles",
  headlights_LightColorEnabled = false,
  headlights_LightColorHue = 0,
  headlights_LightColorSaturation = 20,
  headlights_LightColorBrightness = 50,
  headlights_CycleColorHue = 0,
  headlights_CycleColorSaturation = 20,
  headlights_CycleColorBrightness = 50,
}

local taillights_Category = {
  taillights_AutoResetLightColorEnabled = true,
  taillights_CrystalCoatInclude = false,
  taillights_CrystalCoatColorType = "Primary",
  taillights_ColorSequence = "Solid",
  taillights_SequenceLatency = 0.8,
  taillights_ImpactedVehicles = "AllVehicles",
  taillights_LightColorEnabled = false,
  taillights_LightColorHue = 0,
  taillights_LightColorSaturation = 100,
  taillights_LightColorBrightness = 50,
  taillights_CycleColorHue = 0,
  taillights_CycleColorSaturation = 100,
  taillights_CycleColorBrightness = 50
}

local utilitylights_Category = {
  utilityLightsSynchronizedWithHeadlightsShutoff = true,
  defaultUtilityLightsMode = "MotorcyclesActive",

  utilitylights_AutoResetLightColorEnabled = true,
  utilitylights_CrystalCoatInclude = true,
  utilitylights_CrystalCoatColorType = "Primary",
  utilitylights_ColorSequence = "Solid",
  utilitylights_SequenceLatency = 0.8,
  utilitylights_ImpactedVehicles = "Motorcycles",
  utilitylights_LightColorEnabled = false,
  utilitylights_LightColorHue = 0,
  utilitylights_LightColorSaturation = 100,
  utilitylights_LightColorBrightness = 50,
  utilitylights_CycleColorHue = 0,
  utilitylights_CycleColorSaturation = 100,
  utilitylights_CycleColorBrightness = 50
}

local blinkerlights_Category = {
  blinkerlights_AutoResetLightColorEnabled = true,
  blinkerlights_CrystalCoatInclude = false,
  blinkerlights_CrystalCoatColorType = "Primary",
  blinkerlights_ColorSequence = "Solid",
  blinkerlights_SequenceLatency = 0.8,
  blinkerlights_ImpactedVehicles = "AllVehicles",
  blinkerlights_LightColorEnabled = false,
  blinkerlights_LightColorHue = 0,
  blinkerlights_LightColorSaturation = 100,
  blinkerlights_LightColorBrightness = 50,
  blinkerlights_CycleColorHue = 0,
  blinkerlights_CycleColorSaturation = 100,
  blinkerlights_CycleColorBrightness = 50
}

local reverselights_Category = {
  reverselights_AutoResetLightColorEnabled = true,
  reverselights_CrystalCoatInclude = false,
  reverselights_CrystalCoatColorType = "Primary",
  reverselights_ColorSequence = "Solid",
  reverselights_SequenceLatency = 0.8,
  reverselights_ImpactedVehicles = "AllVehicles",
  reverselights_LightColorEnabled = false,
  reverselights_LightColorHue = 0,
  reverselights_LightColorSaturation = 100,
  reverselights_LightColorBrightness = 50,
  reverselights_CycleColorHue = 0,
  reverselights_CycleColorSaturation = 100,
  reverselights_CycleColorBrightness = 50
}

local rooflight_Category = {
  interiorlightsRoofLightOperatingMode = "Temporary",
  interiorlightsRoofLightTurnOnWithPowerState = false,
  interiorlightsRoofLightTurnOnWithDoors = true,
}

local interiorlights_Category = {
  interiorlightsAutomaticTurnOn = "OnPowerOn",
  interiorlightsAutomaticTurnOff = "OnPowerOff",

  interiorlights_AutoResetLightColorEnabled = true,
  interiorlights_CrystalCoatInclude = true,
  interiorlights_CrystalCoatColorType = "Lights",
  interiorlights_ColorSequence = "Solid",
  interiorlights_SequenceLatency = 0.8,
  interiorlights_ImpactedVehicles = "AllVehicles",
  interiorlights_LightColorEnabled = false,
  interiorlights_LightColorHue = 0,
  interiorlights_LightColorSaturation = 100,
  interiorlights_LightColorBrightness = 50,
  interiorlights_CycleColorHue = 0,
  interiorlights_CycleColorSaturation = 100,
  interiorlights_CycleColorBrightness = 50
}

local crystalcoat_Category = {
  crystalCoatDeactivationDistance = 5.65,
  crystalCoatAutoEnable = true,
  cosmeticTrollEnabled = true
}

local crystaldome_Category = {
  crystalDomeSynchronizedWithPowerState = true,
  crystalDomeKeepOnUntilExit = true,
  preventCrystalDomeOffDuringCombat = true,
  autoEnableCrystalDomeDuringCombat = true
}

local doors_Category = {
  doorsDriveClosing = "CustomSpeed",
  doorsDriveClosingSpeed = 5.0
}

local spoiler_Category = {
  spoilerSynchronizedWithPowerState = false,
  spoilerDeploySpeedEnabled = true,
  spoilerDeploySpeed = 57.0,
  spoilerRetractSpeedEnabled = true,
  spoilerRetractSpeed = 41.0
}

local police_lights_Category = {
  keepSirenOnWhileOutsidePlayerEnabled = false,
  keepSirenOnWhileOutsideNPCsEnabled = true,
  policeBikeSirenEnabled = false,
  policeDispatchRadioEnabled = true
}

local hints_Category = {
  displayPowerEngineInputHint = true,
  displayDoorsInputHint = true,
  displaySpoilerInputHint = true,
  displayWindowsInputHint = true,
  displayCrystalDomeInputHint = true,
  displayHeadlightsCallInputHint = true,
  displayToggleLightSettingsInputHint = true
}

local other_Category = {
  multiTapTimeWindow = 0.25,
  cycleUtilityLightsHoldTime = 0.05
}

local settings = {
  power_state = power_state_Category,
  npc_headlights = npc_headlights_Category,
  headlights = headlights_Category,
  taillights = taillights_Category,
  utilitylights = utilitylights_Category,
  blinkerlights = blinkerlights_Category,
  reverselights = reverselights_Category,
  rooflight = rooflight_Category,
  interiorlights = interiorlights_Category,
  crystalcoat = crystalcoat_Category,
  crystaldome = crystaldome_Category,
  doors = doors_Category,
  spoiler = spoiler_Category,
  police_lights = police_lights_Category,
  hints = hints_Category,
  other = other_Category
}

return settings