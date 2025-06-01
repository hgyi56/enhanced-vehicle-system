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

local lights_Category = {
  autoResetLightColorEnabled = true,
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

  headlights_CrystalCoatInclude = true,
  headlights_CrystalCoatColorType = "Lights",
  headlights_ColorSequence = "Solid",
  headlights_SequenceLatency = 0.8,
  headlights_ImpactedVehicles = "AllVehicles",
  headlights_LightIntensityEnabled = false,
  headlights_LightIntensity = 25,
  headlights_LightColorEnabled = false,
  headlights_LightColorRed = 0,
  headlights_LightColorGreen = 127,
  headlights_LightColorBlue = 255,
  headlights_CycleColorRed = 0,
  headlights_CycleColorGreen = 255,
  headlights_CycleColorBlue = 255
}

local taillights_Category = {
  taillights_CrystalCoatInclude = false,
  taillights_CrystalCoatColorType = "Primary",
  taillights_ColorSequence = "Solid",
  taillights_SequenceLatency = 0.8,
  taillights_ImpactedVehicles = "AllVehicles",
  taillights_LightIntensityEnabled = false,
  taillights_LightIntensity = 100,
  taillights_LightColorEnabled = false,
  taillights_LightColorRed = 0,
  taillights_LightColorGreen = 127,
  taillights_LightColorBlue = 255,
  taillights_CycleColorRed = 0,
  taillights_CycleColorGreen = 255,
  taillights_CycleColorBlue = 255
}

local utilitylights_Category = {
  utilityLightsSynchronizedWithHeadlightsShutoff = true,
  defaultUtilityLightsMode = "MotorcyclesActive",

  utilitylights_CrystalCoatInclude = true,
  utilitylights_CrystalCoatColorType = "Primary",
  utilitylights_ColorSequence = "Solid",
  utilitylights_SequenceLatency = 0.8,
  utilitylights_ImpactedVehicles = "Motorcycles",
  utilitylights_LightIntensityEnabled = false,
  utilitylights_LightIntensity = 25,
  utilitylights_LightColorEnabled = false,
  utilitylights_LightColorRed = 0,
  utilitylights_LightColorGreen = 127,
  utilitylights_LightColorBlue = 255,
  utilitylights_CycleColorRed = 0,
  utilitylights_CycleColorGreen = 255,
  utilitylights_CycleColorBlue = 255
}

local blinkerlights_Category = {
  blinkerlights_CrystalCoatInclude = false,
  blinkerlights_CrystalCoatColorType = "Primary",
  blinkerlights_ColorSequence = "Solid",
  blinkerlights_SequenceLatency = 0.8,
  blinkerlights_ImpactedVehicles = "AllVehicles",
  blinkerlights_LightIntensityEnabled = false,
  blinkerlights_LightIntensity = 100,
  blinkerlights_LightColorEnabled = false,
  blinkerlights_LightColorRed = 0,
  blinkerlights_LightColorGreen = 127,
  blinkerlights_LightColorBlue = 255,
  blinkerlights_CycleColorRed = 0,
  blinkerlights_CycleColorGreen = 255,
  blinkerlights_CycleColorBlue = 255
}

local reverselights_Category = {
  reverselights_CrystalCoatInclude = false,
  reverselights_CrystalCoatColorType = "Primary",
  reverselights_ColorSequence = "Solid",
  reverselights_SequenceLatency = 0.8,
  reverselights_ImpactedVehicles = "AllVehicles",
  reverselights_LightIntensityEnabled = false,
  reverselights_LightIntensity = 100,
  reverselights_LightColorEnabled = false,
  reverselights_LightColorRed = 0,
  reverselights_LightColorGreen = 127,
  reverselights_LightColorBlue = 255,
  reverselights_CycleColorRed = 0,
  reverselights_CycleColorGreen = 255,
  reverselights_CycleColorBlue = 255
}

local rooflight_Category = {
  interiorlightsRoofLightOperatingMode = "Temporary",
  interiorlightsRoofLightTurnOnWithPowerState = false,
  interiorlightsRoofLightTurnOnWithDoors = true,
}

local interiorlights_Category = {
  interiorlightsAutomaticTurnOn = "OnPowerOn",
  interiorlightsAutomaticTurnOff = "OnPowerOff",

  interiorlights_CrystalCoatInclude = true,
  interiorlights_CrystalCoatColorType = "Lights",
  interiorlights_ColorSequence = "Solid",
  interiorlights_SequenceLatency = 0.8,
  interiorlights_ImpactedVehicles = "AllVehicles",
  interiorlights_LightIntensityEnabled = false,
  interiorlights_LightIntensity = 100,
  interiorlights_LightColorEnabled = false,
  interiorlights_LightColorRed = 0,
  interiorlights_LightColorGreen = 127,
  interiorlights_LightColorBlue = 255,
  interiorlights_CycleColorRed = 0,
  interiorlights_CycleColorGreen = 255,
  interiorlights_CycleColorBlue = 255
}

local crystalcoat_Category = {
  crystalCoatDeactivationDistance = 5.65
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
  lights = lights_Category,
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