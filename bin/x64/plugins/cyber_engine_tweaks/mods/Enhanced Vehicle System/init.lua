local settings = require('settings')
local GameUI = require('GameUI')

local profiles = {}
local currentProfile = nil

local defaults = {}
local currentScrollPos = 0
local settingsModified = false

local modName = "hgyi56_EVS"
local leadingControlsName = "leading_controls"
local trailingControlsName = "trailing_controls"

local modDisplayName = "EVS"
local settingsFileName = "settings.json"
local profilesFileName = "profiles.json"

local navStack = {"general"}
local menuIndex = {
  general = {
    "#power_state",
    "#lights",
    "#crystalcoat",
    "#crystaldome",
    "#doors",
    "#spoiler",
    "#police_lights",
    "#hints",
    "#other"
  },
  power_state = {
    "power_state"
  },
  lights = {
    "#headlights",
    "#taillights",
    "#utilitylights",
    "#blinkerlights",
    "#reverselights",
    "#interiorlights"
  },
  headlights = {
    "npc_headlights",
    "headlights"
  },
  taillights = {
    "taillights"
  },
  utilitylights = {
    "utilitylights"
  },
  blinkerlights = {
    "blinkerlights"
  },
  reverselights = {
    "reverselights"
  },
  interiorlights = {
    "rooflight",
    "interiorlights"
  },
  crystalcoat = {
    "crystalcoat"
  },
  crystaldome = {
    "crystaldome"
  },
  doors = {
    "doors"
  },
  spoiler = {
    "spoiler"
  },
  police_lights = {
    "police_lights"
  },
  hints = {
    "hints"
  },
  other = {
    "other"
  }
}

local subcategories = {}
local fieldForcedTypes = {}

local nativeSettings = {}
local GameSession = require('GameSession')

function table_invert(t)
  local s = {}

  for k, v in pairs(t) do
    s[v] = k
  end

  return s
end

function table_copy(t)
  local t2 = {}
  for k, v in pairs(t) do
    t2[k] = v
  end
  return t2
end

---- ENUM CONVERSION ----

function ToNumber_EHeadlightsMode(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = EHeadlightsMode_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type EHeadlightsMode"):format(value))
    end
    return newValue
  end
end

function ToEnum_EHeadlightsMode(value)
  if type(value) == "number" then
    newValue = EHeadlightsMode_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type EHeadlightsMode"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function ToNumber_EHeadlightsSynchronizedWithTimeMode(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = EHeadlightsSynchronizedWithTimeMode_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type EHeadlightsSynchronizedWithTimeMode"):format(value))
    end
    return newValue
  end
end

function ToEnum_EHeadlightsSynchronizedWithTimeMode(value)
  if type(value) == "number" then
    newValue = EHeadlightsSynchronizedWithTimeMode_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type EHeadlightsSynchronizedWithTimeMode"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function ToNumber_EUtilityLightsSynchronizedWithTimeVehicleType(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = EUtilityLightsSynchronizedWithTimeVehicleType_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type EUtilityLightsSynchronizedWithTimeVehicleType"):format(value))
    end
    return newValue
  end
end

function ToEnum_EUtilityLightsSynchronizedWithTimeVehicleType(value)
  if type(value) == "number" then
    newValue = EUtilityLightsSynchronizedWithTimeVehicleType_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type EUtilityLightsSynchronizedWithTimeVehicleType"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function ToNumber_EUtilityLightsMode(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = EUtilityLightsMode_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type EUtilityLightsMode"):format(value))
    end
    return newValue
  end
end

function ToEnum_EUtilityLightsMode(value)
  if type(value) == "number" then
    newValue = EUtilityLightsMode_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type EUtilityLightsMode"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function ToNumber_ELightsColorVehicleType(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = ELightsColorVehicleType_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type ELightsColorVehicleType"):format(value))
    end
    return newValue
  end
end

function ToEnum_ELightsColorVehicleType(value)
  if type(value) == "number" then
    newValue = ELightsColorVehicleType_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type ELightsColorVehicleType"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function ToNumber_ELightsColorCycleType(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = ELightsColorCycleType_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type ELightsColorCycleType"):format(value))
    end
    return newValue
  end
end

function ToEnum_ELightsColorCycleType(value)
  if type(value) == "number" then
    newValue = ELightsColorCycleType_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type ELightsColorCycleType"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function ToNumber_ECrystalCoatColorType(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = ECrystalCoatColorType_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type ECrystalCoatColorType"):format(value))
    end
    return newValue
  end
end

function ToEnum_ECrystalCoatColorType(value)
  if type(value) == "number" then
    newValue = ECrystalCoatColorType_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type ECrystalCoatColorType"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function ToNumber_EEnterBehavior(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = EEnterBehavior_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type EEnterBehavior"):format(value))
    end
    return newValue
  end
end

function ToEnum_EEnterBehavior(value)
  if type(value) == "number" then
    newValue = EEnterBehavior_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type EEnterBehavior"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function ToNumber_EExitBehavior(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = EExitBehavior_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type EExitBehavior"):format(value))
    end
    return newValue
  end
end

function ToEnum_EExitBehavior(value)
  if type(value) == "number" then
    newValue = EExitBehavior_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type EExitBehavior"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function ToNumber_EDoorsDriveClosing(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = EDoorsDriveClosing_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type EDoorsDriveClosing"):format(value))
    end
    return newValue
  end
end

function ToEnum_EDoorsDriveClosing(value)
  if type(value) == "number" then
    newValue = EDoorsDriveClosing_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type EDoorsDriveClosing"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function ToNumber_ERoofLightOperatingMode(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = ERoofLightOperatingMode_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type ERoofLightOperatingMode"):format(value))
    end
    return newValue
  end
end

function ToEnum_ERoofLightOperatingMode(value)
  if type(value) == "number" then
    newValue = ERoofLightOperatingMode_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type ERoofLightOperatingMode"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function ToNumber_EInteriorLightsToggleOff(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = EInteriorLightsToggleOff_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type EInteriorLightsToggleOff"):format(value))
    end
    return newValue
  end
end

function ToEnum_EInteriorLightsToggleOff(value)
  if type(value) == "number" then
    newValue = EInteriorLightsToggleOff_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type EInteriorLightsToggleOff"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function ToNumber_EInteriorLightsToggleOn(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = EInteriorLightsToggleOn_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type EInteriorLightsToggleOn"):format(value))
    end
    return newValue
  end
end

function ToEnum_EInteriorLightsToggleOn(value)
  if type(value) == "number" then
    newValue = EInteriorLightsToggleOn_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type EInteriorLightsToggleOn"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function ToNumber_ELightAttenuation(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = ELightAttenuation_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type ELightAttenuation"):format(value))
    end
    return newValue
  end
end

function ToEnum_ELightAttenuation(value)
  if type(value) == "number" then
    newValue = ELightAttenuation_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type ELightAttenuation"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

-------------------------

registerForEvent("onInit", function()
  nativeSettings = GetMod("nativeSettings")

  modPath = "/" .. modName  
  leadingControlsPath = modPath .. "/" .. leadingControlsName
  trailingControlsPath = modPath .. "/" .. trailingControlsName

  subcategories = {
    power_state = {name = "power_state", path = modPath.."/power_state", label = "hgyi56-EVS-settings-power_state-cat"},
    npc_headlights = {name = "npc_headlights", path = modPath.."/npc_headlights", label = "hgyi56-EVS-settings-npc_headlights-cat"},
    headlights = {name = "headlights", path = modPath.."/headlights", label = "hgyi56-EVS-settings-headlights-cat"},
    taillights = {name = "taillights", path = modPath.."/taillights", label = "hgyi56-EVS-settings-taillights-cat"},
    utilitylights = {name = "utilitylights", path = modPath.."/utilitylights", label = "hgyi56-EVS-settings-utilitylights-cat"},
    blinkerlights = {name = "blinkerlights", path = modPath.."/blinkerlights", label = "hgyi56-EVS-settings-blinkerlights-cat"},
    reverselights = {name = "reverselights", path = modPath.."/reverselights", label = "hgyi56-EVS-settings-reverselights-cat"},
    rooflight = {name = "rooflight", path = modPath.."/rooflight", label = "hgyi56-EVS-settings-rooflight-cat"},
    interiorlights = {name = "interiorlights", path = modPath.."/interiorlights", label = "hgyi56-EVS-settings-interiorlights-cat"},
    crystalcoat = {name = "crystalcoat", path = modPath.."/crystalcoat", label = "hgyi56-EVS-settings-crystalcoat-cat"},
    crystaldome = {name = "crystaldome", path = modPath.."/crystaldome", label = "hgyi56-EVS-settings-crystaldome-cat"},
    doors = {name = "doors", path = modPath.."/doors", label = "hgyi56-EVS-settings-doors-cat"},
    spoiler = {name = "spoiler", path = modPath.."/spoiler", label = "hgyi56-EVS-settings-spoiler-cat"},
    police_lights = {name = "police_lights", path = modPath.."/police_lights", label = "hgyi56-EVS-settings-police_lights-cat"},
    hints = {name = "hints", path = modPath.."/hints", label = "hgyi56-EVS-settings-input_hints-cat"},
    other = {name = "other", path = modPath.."/other", label = "hgyi56-EVS-settings-other_settings-cat"}
  }

  fieldForcedTypes = {
    ["^npc_headlights%.npcHeadlightsRadiusMultiplier$"] = "Float",
    ["^npc_headlights%.npcHeadlightsIntensityMultiplier$"] = "Float",
    ["^crystalcoat%.crystalCoatDeactivationDistance$"] = "Float",
    ["^doors%.doorsDriveClosingSpeed$"] = "Float",
    ["^spoiler%.spoilerDeploySpeed$"] = "Float",
    ["^spoiler%.spoilerRetractSpeed$"] = "Float",
    ["^other%.multiTapTimeWindow$"] = "Float",
    ["^other%.cycleUtilityLightsHoldTime$"] = "Float",
    ["^.+_SequenceLatency$"] = "Float",
    
    ["^headlights%.headlightsTurnOnHour$"] = "Int32",
    ["^headlights%.headlightsTurnOnMinute$"] = "Int32",
    ["^headlights%.headlightsTurnOffHour$"] = "Int32",
    ["^headlights%.headlightsTurnOffMinute$"] = "Int32",
    ["^.+_LightColorHue$"] = "Int32",
    ["^.+_LightColorSaturation$"] = "Int32",
    ["^.+_LightColorBrightness$"] = "Int32",
    ["^.+_CycleColorHue$"] = "Int32",
    ["^.+_CycleColorSaturation$"] = "Int32",
    ["^.+_CycleColorBrightness$"] = "Int32"
  }

  defaults = Deepcopy(settings)

  EHeadlightsMode_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-off"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-low_beam"),
    [3] = GetLocalizedTextByKey("hgyi56-EVS-enum-high_beam")
  }
  EHeadlightsMode_enum = {
    [1] = "Off",
    [2] = "LowBeam",
    [3] = "HighBeam"
  }
  EHeadlightsMode_enum_reversed = table_invert(EHeadlightsMode_enum)
  
  EHeadlightsSynchronizedWithTimeMode_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-low_beam"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-high_beam")
  }
  EHeadlightsSynchronizedWithTimeMode_enum = {
    [1] = "LowBeam",
    [2] = "HighBeam"
  }
  EHeadlightsSynchronizedWithTimeMode_enum_reversed = table_invert(EHeadlightsSynchronizedWithTimeMode_enum)

  EUtilityLightsSynchronizedWithTimeVehicleType_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-no"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-motorcycles"),
    [3] = GetLocalizedTextByKey("hgyi56-EVS-enum-all_vehicles")
  }
  EUtilityLightsSynchronizedWithTimeVehicleType_enum = {
    [1] = "No",
    [2] = "Motorcycles",
    [3] = "AllVehicles"
  }
  EUtilityLightsSynchronizedWithTimeVehicleType_enum_reversed = table_invert(EUtilityLightsSynchronizedWithTimeVehicleType_enum)

  EUtilityLightsMode_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-off"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-active_for_motorcycles"),
    [3] = GetLocalizedTextByKey("hgyi56-EVS-enum-active_for_all_vehicles")
  }
  EUtilityLightsMode_enum = {
    [1] = "Off",
    [2] = "MotorcyclesActive",
    [3] = "AllVehiclesActive"
  }
  EUtilityLightsMode_enum_reversed = table_invert(EUtilityLightsMode_enum)
  
  ELightsColorVehicleType_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-motorcycles"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-all_vehicles")
  }
  ELightsColorVehicleType_enum = {
    [1] = "Motorcycles",
    [2] = "AllVehicles"
  }
  ELightsColorVehicleType_enum_reversed = table_invert(ELightsColorVehicleType_enum)
  
  ELightsColorCycleType_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-solid"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-blinker"),
    [3] = GetLocalizedTextByKey("hgyi56-EVS-enum-beacon"),
    [4] = GetLocalizedTextByKey("hgyi56-EVS-enum-pulse"),
    [5] = GetLocalizedTextByKey("hgyi56-EVS-enum-two_colors_cycle"),
    [6] = GetLocalizedTextByKey("hgyi56-EVS-enum-rainbow")
  }
  ELightsColorCycleType_enum = {
    [1] = "Solid",
    [2] = "Blinker",
    [3] = "Beacon",
    [4] = "Pulse",
    [5] = "TwoColorsCycle",
    [6] = "Rainbow"
  }
  ELightsColorCycleType_enum_reversed = table_invert(ELightsColorCycleType_enum)

  ECrystalCoatColorType_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-primary"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-secondary"),
    [3] = GetLocalizedTextByKey("hgyi56-EVS-enum-lights")
  }
  ECrystalCoatColorType_enum = {
    [1] = "Primary",
    [2] = "Secondary",
    [3] = "Lights"
  }
  ECrystalCoatColorType_enum_reversed = table_invert(ECrystalCoatColorType_enum)
  
  EEnterBehavior_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-keep_current_state"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-power_on"),
    [3] = GetLocalizedTextByKey("hgyi56-EVS-enum-start_engine")
  }
  EEnterBehavior_enum = {
    [1] = "KeepCurrentState",
    [2] = "PowerOn",
    [3] = "StartEngine"
  }
  EEnterBehavior_enum_reversed = table_invert(EEnterBehavior_enum)
  
  EExitBehavior_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-keep_current_state"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-stop_engine"),
    [3] = GetLocalizedTextByKey("hgyi56-EVS-enum-power_off")
  }
  EExitBehavior_enum = {
    [1] = "KeepCurrentState",
    [2] = "StopEngine",
    [3] = "PowerOff"
  }
  EExitBehavior_enum_reversed = table_invert(EExitBehavior_enum)
  
  EDoorsDriveClosing_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-no"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-on_start_moving"),
    [3] = GetLocalizedTextByKey("hgyi56-EVS-enum-custom_speed")
  }
  EDoorsDriveClosing_enum = {
    [1] = "No",
    [2] = "OnStartMoving",
    [3] = "CustomSpeed"
  }
  EDoorsDriveClosing_enum_reversed = table_invert(EDoorsDriveClosing_enum)
  
  ERoofLightOperatingMode_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-temporary"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-fixed")
  }
  ERoofLightOperatingMode_enum = {
    [1] = "Temporary",
    [2] = "Fixed"
  }
  ERoofLightOperatingMode_enum_reversed = table_invert(ERoofLightOperatingMode_enum)
  
  EInteriorLightsToggleOff_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-on_power_off"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-on_exit")
  }
  EInteriorLightsToggleOff_enum = {
    [1] = "OnPowerOff",
    [2] = "OnExit"
  }
  EInteriorLightsToggleOff_enum_reversed = table_invert(EInteriorLightsToggleOff_enum)
  
  EInteriorLightsToggleOn_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-manual"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-on_enter"),
    [3] = GetLocalizedTextByKey("hgyi56-EVS-enum-on_power_on")
  }
  EInteriorLightsToggleOn_enum = {
    [1] = "Manual",
    [2] = "OnEnter",
    [3] = "OnPowerOn"
  }
  EInteriorLightsToggleOn_enum_reversed = table_invert(EInteriorLightsToggleOn_enum)
  
  ELightAttenuation_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-linear"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-inverse_square")
  }
  ELightAttenuation_enum = {
    [1] = "Linear",
    [2] = "InverseSquare"
  }
  ELightAttenuation_enum_reversed = table_invert(ELightAttenuation_enum)

  GameSession.OnLoad(function()
    LoadProfilesFromFile()

    -- If no settings file exist, then load the default settings table into the redscript map
    if not LoadSettingsFromFile() then
      LoadSettingsFromTable(settings)
      SaveTableToFile(settings, settingsFileName)
    end
  
    notifyScriptOnSettingChange()
  end)

  LoadProfilesFromFile()
  
  if not LoadSettingsFromFile() then
    LoadSettingsFromTable(settings)
  end

  SetupMenuListener()
  SetupMenu()

  -- On menu open
  if nativeSettings ~= nil then
    ObserveBefore("SettingsMainGameController", "PopulateCategorySettingsOptions", function (self, idx)
      if nativeSettings.fromMods and nativeSettings.tabSizeCache then
        SaveScrollPos()
      end
    end)
    ObserveAfter("SettingsMainGameController", "PopulateCategorySettingsOptions", function (self, idx)
      if nativeSettings.fromMods and nativeSettings.tabSizeCache then
        RestoreScrollPos()
      end
    end)

    -- On menu close
    ObserveAfter("SettingsMainGameController", "RequestClose", function (self)
      if settingsModified then
        notifyScriptOnSettingChange()
      end

      settingsModified = false
    end)
  end
end)

function setup_power_state_CategorySetters(categoryData)
  SetupCategory(categoryData)

  local useProfile = false
  local enterBehavior_Value = settings[categoryData.name].enterBehavior
  local exitBehavior_Value = settings[categoryData.name].exitBehavior
  local preventPowerOffDuringCombat_Value = settings[categoryData.name].preventPowerOffDuringCombat
  local autoStartEngineDuringCombat_Value = settings[categoryData.name].autoStartEngineDuringCombat

  if profiles[currentProfile] ~= nil and profiles[currentProfile][categoryData.name].customProfileEnabled then
    useProfile = true

    if profiles[currentProfile][categoryData.name].enterBehavior == nil then
      profiles[currentProfile][categoryData.name].enterBehavior = settings[categoryData.name].enterBehavior
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.enterBehavior"):format(currentProfile, categoryData.name), ToNumber_EEnterBehavior(profiles[currentProfile][categoryData.name].enterBehavior) - 1)
    enterBehavior_Value = profiles[currentProfile][categoryData.name].enterBehavior

    if profiles[currentProfile][categoryData.name].exitBehavior == nil then
      profiles[currentProfile][categoryData.name].exitBehavior = settings[categoryData.name].exitBehavior
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.exitBehavior"):format(currentProfile, categoryData.name), ToNumber_EExitBehavior(profiles[currentProfile][categoryData.name].exitBehavior) - 1)
    exitBehavior_Value = profiles[currentProfile][categoryData.name].exitBehavior

    if profiles[currentProfile][categoryData.name].preventPowerOffDuringCombat == nil then
      profiles[currentProfile][categoryData.name].preventPowerOffDuringCombat = settings[categoryData.name].preventPowerOffDuringCombat
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.preventPowerOffDuringCombat"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].preventPowerOffDuringCombat)
    preventPowerOffDuringCombat_Value = profiles[currentProfile][categoryData.name].preventPowerOffDuringCombat

    if profiles[currentProfile][categoryData.name].autoStartEngineDuringCombat == nil then
      profiles[currentProfile][categoryData.name].autoStartEngineDuringCombat = settings[categoryData.name].autoStartEngineDuringCombat
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.autoStartEngineDuringCombat"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].autoStartEngineDuringCombat)
    autoStartEngineDuringCombat_Value = profiles[currentProfile][categoryData.name].autoStartEngineDuringCombat
  end

  nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-power_state-on_enter"), GetLocalizedTextByKey("hgyi56-EVS-settings-power_state-on_enter-desc"), EEnterBehavior_values, ToNumber_EEnterBehavior(enterBehavior_Value), ToNumber_EEnterBehavior(defaults[categoryData.name].enterBehavior), function(value)
    if useProfile then
      profiles[currentProfile][categoryData.name].enterBehavior = ToEnum_EEnterBehavior(value)
    else
      settings[categoryData.name].enterBehavior = ToEnum_EEnterBehavior(value)
    end

    settingsModified = true
    local intValue = ToNumber_EEnterBehavior(value) - 1
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s.enterBehavior"):format(currentProfile, categoryData.name), intValue)
    else
      Populate_Variant_IntoSettingsMap(("%s.enterBehavior"):format(categoryData.name), intValue)
    end
  end)

  nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-power_state-on_exit"), GetLocalizedTextByKey("hgyi56-EVS-settings-power_state-on_exit-desc"), EExitBehavior_values, ToNumber_EExitBehavior(exitBehavior_Value), ToNumber_EExitBehavior(defaults[categoryData.name].exitBehavior), function(value)
    if useProfile then
      profiles[currentProfile][categoryData.name].exitBehavior = ToEnum_EExitBehavior(value)
    else
      settings[categoryData.name].exitBehavior = ToEnum_EExitBehavior(value)
    end

    settingsModified = true
    local intValue = ToNumber_EExitBehavior(value) - 1
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s.exitBehavior"):format(currentProfile, categoryData.name), intValue)
    else
      Populate_Variant_IntoSettingsMap(("%s.exitBehavior"):format(categoryData.name), intValue)
    end
  end)
  
  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-power_state-prevent_shutdown"), GetLocalizedTextByKey("hgyi56-EVS-settings-power_state-prevent_shutdown-desc"), preventPowerOffDuringCombat_Value, defaults[categoryData.name].preventPowerOffDuringCombat, function(state)
    if useProfile then
      profiles[currentProfile][categoryData.name].preventPowerOffDuringCombat = state
    else
      settings[categoryData.name].preventPowerOffDuringCombat = state
    end

    settingsModified = true
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s.preventPowerOffDuringCombat"):format(currentProfile, categoryData.name), state)
    else
      Populate_Variant_IntoSettingsMap(("%s.preventPowerOffDuringCombat"):format(categoryData.name), state)
    end
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-power_state-autostart_combat"), GetLocalizedTextByKey("hgyi56-EVS-settings-power_state-autostart_combat-desc"), autoStartEngineDuringCombat_Value, defaults[categoryData.name].autoStartEngineDuringCombat, function(state)
    if useProfile then
      profiles[currentProfile][categoryData.name].autoStartEngineDuringCombat = state
    else
      settings[categoryData.name].autoStartEngineDuringCombat = state
    end

    settingsModified = true
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s.autoStartEngineDuringCombat"):format(currentProfile, categoryData.name), state)
    else
      Populate_Variant_IntoSettingsMap(("%s.autoStartEngineDuringCombat"):format(categoryData.name), state)
    end
  end)
end

function setup_npc_headlights_CategorySetters(categoryData)
  SetupCategory(categoryData)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-npc_headlights-override"), "", settings[categoryData.name].npcHeadlightsOverride, defaults[categoryData.name].npcHeadlightsOverride, function(state)
    settings[categoryData.name].npcHeadlightsOverride = state
    
    setup_CategorySetters(categoryData, "npc_headlights")

    settingsModified = true
    Populate_Variant_IntoSettingsMap(("%s.npcHeadlightsOverride"):format(categoryData.name), state)
  end)

  if settings[categoryData.name].npcHeadlightsOverride then
    nativeSettings.addRangeFloat(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-npc_headlights-radius_multiplier"), GetLocalizedTextByKey("hgyi56-EVS-settings-delayed_effect-desc"), 0.0, 10.0, 0.1, "%.1f", settings[categoryData.name].npcHeadlightsRadiusMultiplier, defaults[categoryData.name].npcHeadlightsRadiusMultiplier, function(value)
      settings[categoryData.name].npcHeadlightsRadiusMultiplier = value

      settingsModified = true
      Populate_Variant_IntoSettingsMap(("%s.npcHeadlightsRadiusMultiplier"):format(categoryData.name), value)
    end)
    
    nativeSettings.addRangeFloat(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-npc_headlights-intensity_multiplier"), GetLocalizedTextByKey("hgyi56-EVS-settings-delayed_effect-desc"), 0.0, 10.0, 0.1, "%.1f", settings[categoryData.name].npcHeadlightsIntensityMultiplier, defaults[categoryData.name].npcHeadlightsIntensityMultiplier, function(value)
      settings[categoryData.name].npcHeadlightsIntensityMultiplier = value

      settingsModified = true
      Populate_Variant_IntoSettingsMap(("%s.npcHeadlightsIntensityMultiplier"):format(categoryData.name), value)
    end)

    nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-npc_headlights-attenuation"), GetLocalizedTextByKey("hgyi56-EVS-settings-delayed_effect-desc"), ELightAttenuation_values, ToNumber_ELightAttenuation(settings[categoryData.name].npcHeadlightsAttenuation), ToNumber_ELightAttenuation(defaults[categoryData.name].npcHeadlightsAttenuation), function(value)
      settings[categoryData.name].npcHeadlightsAttenuation = ToEnum_ELightAttenuation(value)

      settingsModified = true
      local intValue = ToNumber_ELightAttenuation(value) - 1
      Populate_Variant_IntoSettingsMap(("%s.npcHeadlightsAttenuation"):format(categoryData.name), intValue)
    end)
  end
end

function setup_headlights_CategorySetters(categoryData)
  SetupCategory(categoryData)

  local useProfile = false
  local headlightsSynchronizedWithTimeEnabled_Value = settings[categoryData.name].headlightsSynchronizedWithTimeEnabled
  local headlightsSynchronizedWithTimeMode_Value = settings[categoryData.name].headlightsSynchronizedWithTimeMode
  local utilityLightsSynchronizedWithTimeVehicleType_Value = settings[categoryData.name].utilityLightsSynchronizedWithTimeVehicleType
  local headlightsTurnOnHour_Value = settings[categoryData.name].headlightsTurnOnHour
  local headlightsTurnOnMinute_Value = settings[categoryData.name].headlightsTurnOnMinute
  local headlightsTurnOffHour_Value = settings[categoryData.name].headlightsTurnOffHour
  local headlightsTurnOffMinute_Value = settings[categoryData.name].headlightsTurnOffMinute
  local defaultHeadlightsMode_Value = settings[categoryData.name].defaultHeadlightsMode

  if profiles[currentProfile] ~= nil and profiles[currentProfile][categoryData.name].customProfileEnabled then
    useProfile = true

    if profiles[currentProfile][categoryData.name].headlightsSynchronizedWithTimeEnabled == nil then
      profiles[currentProfile][categoryData.name].headlightsSynchronizedWithTimeEnabled = settings[categoryData.name].headlightsSynchronizedWithTimeEnabled
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.headlightsSynchronizedWithTimeEnabled"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].headlightsSynchronizedWithTimeEnabled)
    headlightsSynchronizedWithTimeEnabled_Value = profiles[currentProfile][categoryData.name].headlightsSynchronizedWithTimeEnabled

    if profiles[currentProfile][categoryData.name].headlightsSynchronizedWithTimeMode == nil then
      profiles[currentProfile][categoryData.name].headlightsSynchronizedWithTimeMode = settings[categoryData.name].headlightsSynchronizedWithTimeMode
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.headlightsSynchronizedWithTimeMode"):format(currentProfile, categoryData.name), ToNumber_EHeadlightsSynchronizedWithTimeMode(profiles[currentProfile][categoryData.name].headlightsSynchronizedWithTimeMode) - 1)
    headlightsSynchronizedWithTimeMode_Value = profiles[currentProfile][categoryData.name].headlightsSynchronizedWithTimeMode

    if profiles[currentProfile][categoryData.name].utilityLightsSynchronizedWithTimeVehicleType == nil then
      profiles[currentProfile][categoryData.name].utilityLightsSynchronizedWithTimeVehicleType = settings[categoryData.name].utilityLightsSynchronizedWithTimeVehicleType
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.utilityLightsSynchronizedWithTimeVehicleType"):format(currentProfile, categoryData.name), ToNumber_EUtilityLightsSynchronizedWithTimeVehicleType(profiles[currentProfile][categoryData.name].utilityLightsSynchronizedWithTimeVehicleType) - 1)
    utilityLightsSynchronizedWithTimeVehicleType_Value = profiles[currentProfile][categoryData.name].utilityLightsSynchronizedWithTimeVehicleType

    if profiles[currentProfile][categoryData.name].headlightsTurnOnHour == nil then
      profiles[currentProfile][categoryData.name].headlightsTurnOnHour = settings[categoryData.name].headlightsTurnOnHour
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.headlightsTurnOnHour"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].headlightsTurnOnHour)
    headlightsTurnOnHour_Value = profiles[currentProfile][categoryData.name].headlightsTurnOnHour

    if profiles[currentProfile][categoryData.name].headlightsTurnOnMinute == nil then
      profiles[currentProfile][categoryData.name].headlightsTurnOnMinute = settings[categoryData.name].headlightsTurnOnMinute
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.headlightsTurnOnMinute"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].headlightsTurnOnMinute)
    headlightsTurnOnMinute_Value = profiles[currentProfile][categoryData.name].headlightsTurnOnMinute

    if profiles[currentProfile][categoryData.name].headlightsTurnOffHour == nil then
      profiles[currentProfile][categoryData.name].headlightsTurnOffHour = settings[categoryData.name].headlightsTurnOffHour
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.headlightsTurnOffHour"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].headlightsTurnOffHour)
    headlightsTurnOffHour_Value = profiles[currentProfile][categoryData.name].headlightsTurnOffHour

    if profiles[currentProfile][categoryData.name].headlightsTurnOffMinute == nil then
      profiles[currentProfile][categoryData.name].headlightsTurnOffMinute = settings[categoryData.name].headlightsTurnOffMinute
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.headlightsTurnOffMinute"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].headlightsTurnOffMinute)
    headlightsTurnOffMinute_Value = profiles[currentProfile][categoryData.name].headlightsTurnOffMinute

    if profiles[currentProfile][categoryData.name].defaultHeadlightsMode == nil then
      profiles[currentProfile][categoryData.name].defaultHeadlightsMode = settings[categoryData.name].defaultHeadlightsMode
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.defaultHeadlightsMode"):format(currentProfile, categoryData.name), ToNumber_EHeadlightsMode(profiles[currentProfile][categoryData.name].defaultHeadlightsMode) - 1)
    defaultHeadlightsMode_Value = profiles[currentProfile][categoryData.name].defaultHeadlightsMode
  end
  
  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-headlights-sync"), GetLocalizedTextByKey("hgyi56-EVS-settings-headlights-sync-desc"), headlightsSynchronizedWithTimeEnabled_Value, defaults[categoryData.name].headlightsSynchronizedWithTimeEnabled, function(state)
    if useProfile then
      profiles[currentProfile][categoryData.name].headlightsSynchronizedWithTimeEnabled = state
    else
      settings[categoryData.name].headlightsSynchronizedWithTimeEnabled = state
    end
    
    setup_CategorySetters(categoryData, "headlights")

    settingsModified = true
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s.headlightsSynchronizedWithTimeEnabled"):format(currentProfile, categoryData.name), state)
    else
      Populate_Variant_IntoSettingsMap(("%s.headlightsSynchronizedWithTimeEnabled"):format(categoryData.name), state)
    end
  end)

  if headlightsSynchronizedWithTimeEnabled_Value then

    nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-headlights-night_mode"), GetLocalizedTextByKey("hgyi56-EVS-settings-headlights-night_mode-desc"), EHeadlightsSynchronizedWithTimeMode_values, ToNumber_EHeadlightsSynchronizedWithTimeMode(headlightsSynchronizedWithTimeMode_Value), ToNumber_EHeadlightsSynchronizedWithTimeMode(defaults[categoryData.name].headlightsSynchronizedWithTimeMode), function(value)
      if useProfile then
        profiles[currentProfile][categoryData.name].headlightsSynchronizedWithTimeMode = ToEnum_EHeadlightsSynchronizedWithTimeMode(value)
      else
        settings[categoryData.name].headlightsSynchronizedWithTimeMode = ToEnum_EHeadlightsSynchronizedWithTimeMode(value)
      end

      settingsModified = true
      local intValue = ToNumber_EHeadlightsSynchronizedWithTimeMode(value) - 1
      
      if useProfile then
        Populate_Variant_IntoSettingsMap(("%s.%s.headlightsSynchronizedWithTimeMode"):format(currentProfile, categoryData.name), intValue)
      else
        Populate_Variant_IntoSettingsMap(("%s.headlightsSynchronizedWithTimeMode"):format(categoryData.name), intValue)
      end
    end)

    nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-headlights-include_utility_lights"), GetLocalizedTextByKey("hgyi56-EVS-settings-headlights-include_utility_lights-desc"), EUtilityLightsSynchronizedWithTimeVehicleType_values, ToNumber_EUtilityLightsSynchronizedWithTimeVehicleType(utilityLightsSynchronizedWithTimeVehicleType_Value), ToNumber_EUtilityLightsSynchronizedWithTimeVehicleType(defaults[categoryData.name].utilityLightsSynchronizedWithTimeVehicleType), function(value)
      if useProfile then
        profiles[currentProfile][categoryData.name].utilityLightsSynchronizedWithTimeVehicleType = ToEnum_EUtilityLightsSynchronizedWithTimeVehicleType(value)
      else
        settings[categoryData.name].utilityLightsSynchronizedWithTimeVehicleType = ToEnum_EUtilityLightsSynchronizedWithTimeVehicleType(value)
      end

      settingsModified = true
      local intValue = ToNumber_EUtilityLightsSynchronizedWithTimeVehicleType(value) - 1
      
      if useProfile then
        Populate_Variant_IntoSettingsMap(("%s.%s.utilityLightsSynchronizedWithTimeVehicleType"):format(currentProfile, categoryData.name), intValue)
      else
        Populate_Variant_IntoSettingsMap(("%s.utilityLightsSynchronizedWithTimeVehicleType"):format(categoryData.name), intValue)
      end
    end)

    nativeSettings.addRangeInt(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-headlights-turn_on_hour"), "", 0, 23, 1, headlightsTurnOnHour_Value, defaults[categoryData.name].headlightsTurnOnHour, function(value)
      if useProfile then
        profiles[currentProfile][categoryData.name].headlightsTurnOnHour = value
      else
        settings[categoryData.name].headlightsTurnOnHour = value
      end

      settingsModified = true
      
      if useProfile then
        Populate_Variant_IntoSettingsMap(("%s.%s.headlightsTurnOnHour"):format(currentProfile, categoryData.name), value)
      else
        Populate_Variant_IntoSettingsMap(("%s.headlightsTurnOnHour"):format(categoryData.name), value)
      end
    end)

    nativeSettings.addRangeInt(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-headlights-turn_on_minute"), "", 0, 59, 1, headlightsTurnOnMinute_Value, defaults[categoryData.name].headlightsTurnOnMinute, function(value)
      if useProfile then
        profiles[currentProfile][categoryData.name].headlightsTurnOnMinute = value
      else
        settings[categoryData.name].headlightsTurnOnMinute = value
      end

      settingsModified = true
      
      if useProfile then
        Populate_Variant_IntoSettingsMap(("%s.%s.headlightsTurnOnMinute"):format(currentProfile, categoryData.name), value)
      else
        Populate_Variant_IntoSettingsMap(("%s.headlightsTurnOnMinute"):format(categoryData.name), value)
      end
    end)

    nativeSettings.addRangeInt(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-headlights-turn_off_hour"), "", 0, 23, 1, headlightsTurnOffHour_Value, defaults[categoryData.name].headlightsTurnOffHour, function(value)
      if useProfile then
        profiles[currentProfile][categoryData.name].headlightsTurnOffHour = value
      else
        settings[categoryData.name].headlightsTurnOffHour = value
      end

      settingsModified = true
      if useProfile then
        Populate_Variant_IntoSettingsMap(("%s.%s.headlightsTurnOffHour"):format(currentProfile, categoryData.name), value)
      else
        Populate_Variant_IntoSettingsMap(("%s.headlightsTurnOffHour"):format(categoryData.name), value)
      end
    end)

    nativeSettings.addRangeInt(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-headlights-turn_off_minute"), "", 0, 59, 1, headlightsTurnOffMinute_Value, defaults[categoryData.name].headlightsTurnOffMinute, function(value)
      if useProfile then
        profiles[currentProfile][categoryData.name].headlightsTurnOffMinute = value
      else
        settings[categoryData.name].headlightsTurnOffMinute = value
      end

      settingsModified = true
      if useProfile then
        Populate_Variant_IntoSettingsMap(("%s.%s.headlightsTurnOffMinute"):format(currentProfile, categoryData.name), value)
      else
        Populate_Variant_IntoSettingsMap(("%s.headlightsTurnOffMinute"):format(categoryData.name), value)
      end
    end)

  else
    nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-default_mode"), GetLocalizedTextByKey("hgyi56-EVS-settings-headlights-default_mode-desc"), EHeadlightsMode_values, ToNumber_EHeadlightsMode(defaultHeadlightsMode_Value), ToNumber_EHeadlightsMode(defaults[categoryData.name].defaultHeadlightsMode), function(value)
      if useProfile then
        profiles[currentProfile][categoryData.name].defaultHeadlightsMode = ToEnum_EHeadlightsMode(value)
      else
        settings[categoryData.name].defaultHeadlightsMode = ToEnum_EHeadlightsMode(value)
      end

      settingsModified = true
      local intValue = ToNumber_EHeadlightsMode(value) - 1
      
      if useProfile then
        Populate_Variant_IntoSettingsMap(("%s.%s.defaultHeadlightsMode"):format(currentProfile, categoryData.name), intValue)
      else
        Populate_Variant_IntoSettingsMap(("%s.defaultHeadlightsMode"):format(categoryData.name), intValue)
      end
    end)
  end

  setup_light_CategorySetters(categoryData, "headlights")
end

function setup_utilitylights_CategorySetters(categoryData)
  SetupCategory(categoryData)

  local useProfile = false
  local utilityLightsSynchronizedWithHeadlightsShutoff_Value = settings[categoryData.name].utilityLightsSynchronizedWithHeadlightsShutoff
  local defaultUtilityLightsMode_Value = settings[categoryData.name].defaultUtilityLightsMode

  if profiles[currentProfile] ~= nil and profiles[currentProfile][categoryData.name].customProfileEnabled then
    useProfile = true

    if profiles[currentProfile][categoryData.name].utilityLightsSynchronizedWithHeadlightsShutoff == nil then
      profiles[currentProfile][categoryData.name].utilityLightsSynchronizedWithHeadlightsShutoff = settings[categoryData.name].utilityLightsSynchronizedWithHeadlightsShutoff
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.utilityLightsSynchronizedWithHeadlightsShutoff"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].utilityLightsSynchronizedWithHeadlightsShutoff)
    utilityLightsSynchronizedWithHeadlightsShutoff_Value = profiles[currentProfile][categoryData.name].utilityLightsSynchronizedWithHeadlightsShutoff

    if profiles[currentProfile][categoryData.name].defaultUtilityLightsMode == nil then
      profiles[currentProfile][categoryData.name].defaultUtilityLightsMode = settings[categoryData.name].defaultUtilityLightsMode
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.defaultUtilityLightsMode"):format(currentProfile, categoryData.name), ToNumber_EUtilityLightsMode(profiles[currentProfile][categoryData.name].defaultUtilityLightsMode) - 1)
    defaultUtilityLightsMode_Value = profiles[currentProfile][categoryData.name].defaultUtilityLightsMode
  end
  
  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-utilitylights-sync_with_shutoff"), GetLocalizedTextByKey("hgyi56-EVS-settings-utilitylights-sync_with_shutoff-desc"), utilityLightsSynchronizedWithHeadlightsShutoff_Value, defaults[categoryData.name].utilityLightsSynchronizedWithHeadlightsShutoff, function(state)
    if useProfile then
      profiles[currentProfile][categoryData.name].utilityLightsSynchronizedWithHeadlightsShutoff = state
    else
      settings[categoryData.name].utilityLightsSynchronizedWithHeadlightsShutoff = state
    end

    settingsModified = true
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s.utilityLightsSynchronizedWithHeadlightsShutoff"):format(currentProfile, categoryData.name), state)
    else
      Populate_Variant_IntoSettingsMap(("%s.utilityLightsSynchronizedWithHeadlightsShutoff"):format(categoryData.name), state)
    end
  end)

  nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-default_mode"), GetLocalizedTextByKey("hgyi56-EVS-settings-utilitylights-default_mode-desc"), EUtilityLightsMode_values, ToNumber_EUtilityLightsMode(defaultUtilityLightsMode_Value), ToNumber_EUtilityLightsMode(defaults[categoryData.name].defaultUtilityLightsMode), function(value)
    if useProfile then
      profiles[currentProfile][categoryData.name].defaultUtilityLightsMode = ToEnum_EUtilityLightsMode(value)
    else
      settings[categoryData.name].defaultUtilityLightsMode = ToEnum_EUtilityLightsMode(value)
    end

    settingsModified = true
    local intValue = ToNumber_EUtilityLightsMode(value) - 1
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s.defaultUtilityLightsMode"):format(currentProfile, categoryData.name), intValue)
    else
      Populate_Variant_IntoSettingsMap(("%s.defaultUtilityLightsMode"):format(categoryData.name), intValue)
    end
  end)

  setup_light_CategorySetters(categoryData, "utilitylights")
end

function setup_rooflight_CategorySetters(categoryData)
  SetupCategory(categoryData)

  local useProfile = false
  local interiorlightsRoofLightOperatingMode_Value = settings[categoryData.name].interiorlightsRoofLightOperatingMode
  local interiorlightsRoofLightTurnOnWithPowerState_Value = settings[categoryData.name].interiorlightsRoofLightTurnOnWithPowerState
  local interiorlightsRoofLightTurnOnWithDoors_Value = settings[categoryData.name].interiorlightsRoofLightTurnOnWithDoors

  if profiles[currentProfile] ~= nil and profiles[currentProfile][categoryData.name].customProfileEnabled then
    useProfile = true

    if profiles[currentProfile][categoryData.name].interiorlightsRoofLightOperatingMode == nil then
      profiles[currentProfile][categoryData.name].interiorlightsRoofLightOperatingMode = settings[categoryData.name].interiorlightsRoofLightOperatingMode
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.interiorlightsRoofLightOperatingMode"):format(currentProfile, categoryData.name), ToNumber_ERoofLightOperatingMode(profiles[currentProfile][categoryData.name].interiorlightsRoofLightOperatingMode) - 1)
    interiorlightsRoofLightOperatingMode_Value = profiles[currentProfile][categoryData.name].interiorlightsRoofLightOperatingMode

    if profiles[currentProfile][categoryData.name].interiorlightsRoofLightTurnOnWithPowerState == nil then
      profiles[currentProfile][categoryData.name].interiorlightsRoofLightTurnOnWithPowerState = settings[categoryData.name].interiorlightsRoofLightTurnOnWithPowerState
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.interiorlightsRoofLightTurnOnWithPowerState"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].interiorlightsRoofLightTurnOnWithPowerState)
    interiorlightsRoofLightTurnOnWithPowerState_Value = profiles[currentProfile][categoryData.name].interiorlightsRoofLightTurnOnWithPowerState

    if profiles[currentProfile][categoryData.name].interiorlightsRoofLightTurnOnWithDoors == nil then
      profiles[currentProfile][categoryData.name].interiorlightsRoofLightTurnOnWithDoors = settings[categoryData.name].interiorlightsRoofLightTurnOnWithDoors
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.interiorlightsRoofLightTurnOnWithDoors"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].interiorlightsRoofLightTurnOnWithDoors)
    interiorlightsRoofLightTurnOnWithDoors_Value = profiles[currentProfile][categoryData.name].interiorlightsRoofLightTurnOnWithDoors
  end

  nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-interiorlights-roof_light_op_mode"), GetLocalizedTextByKey("hgyi56-EVS-settings-interiorlights-roof_light_op_mode-desc"), ERoofLightOperatingMode_values, ToNumber_ERoofLightOperatingMode(interiorlightsRoofLightOperatingMode_Value), ToNumber_ERoofLightOperatingMode(defaults[categoryData.name].interiorlightsRoofLightOperatingMode), function(value)
    if useProfile then
      profiles[currentProfile][categoryData.name].interiorlightsRoofLightOperatingMode = ToEnum_ERoofLightOperatingMode(value)
    else
      settings[categoryData.name].interiorlightsRoofLightOperatingMode = ToEnum_ERoofLightOperatingMode(value)
    end

    settingsModified = true
    local intValue = ToNumber_ERoofLightOperatingMode(value) - 1
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s.interiorlightsRoofLightOperatingMode"):format(currentProfile, categoryData.name), intValue)
    else
      Populate_Variant_IntoSettingsMap(("%s.interiorlightsRoofLightOperatingMode"):format(categoryData.name), intValue)
    end
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-interiorlights-enable_on_power_on"), "", interiorlightsRoofLightTurnOnWithPowerState_Value, defaults[categoryData.name].interiorlightsRoofLightTurnOnWithPowerState, function(state)
    if useProfile then
      profiles[currentProfile][categoryData.name].interiorlightsRoofLightTurnOnWithPowerState = state
    else
      settings[categoryData.name].interiorlightsRoofLightTurnOnWithPowerState = state
    end

    settingsModified = true
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s.interiorlightsRoofLightTurnOnWithPowerState"):format(currentProfile, categoryData.name), state)
    else
      Populate_Variant_IntoSettingsMap(("%s.interiorlightsRoofLightTurnOnWithPowerState"):format(categoryData.name), state)
    end
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-interiorlights-enable_with_doors"), "", interiorlightsRoofLightTurnOnWithDoors_Value, defaults[categoryData.name].interiorlightsRoofLightTurnOnWithDoors, function(state)
    if useProfile then
      profiles[currentProfile][categoryData.name].interiorlightsRoofLightTurnOnWithDoors = state
    else
      settings[categoryData.name].interiorlightsRoofLightTurnOnWithDoors = state
    end

    settingsModified = true
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s.interiorlightsRoofLightTurnOnWithDoors"):format(currentProfile, categoryData.name), state)
    else
      Populate_Variant_IntoSettingsMap(("%s.interiorlightsRoofLightTurnOnWithDoors"):format(categoryData.name), state)
    end
  end)
end

function setup_interiorlights_CategorySetters(categoryData)
  SetupCategory(categoryData)

  local useProfile = false
  local interiorlightsAutomaticTurnOn_Value = settings[categoryData.name].interiorlightsAutomaticTurnOn
  local interiorlightsAutomaticTurnOff_Value = settings[categoryData.name].interiorlightsAutomaticTurnOff

  if profiles[currentProfile] ~= nil and profiles[currentProfile][categoryData.name].customProfileEnabled then
    useProfile = true

    if profiles[currentProfile][categoryData.name].interiorlightsAutomaticTurnOn == nil then
      profiles[currentProfile][categoryData.name].interiorlightsAutomaticTurnOn = settings[categoryData.name].interiorlightsAutomaticTurnOn
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.interiorlightsAutomaticTurnOn"):format(currentProfile, categoryData.name), ToNumber_EInteriorLightsToggleOn(profiles[currentProfile][categoryData.name].interiorlightsAutomaticTurnOn) - 1)
    interiorlightsAutomaticTurnOn_Value = profiles[currentProfile][categoryData.name].interiorlightsAutomaticTurnOn

    if profiles[currentProfile][categoryData.name].interiorlightsAutomaticTurnOff == nil then
      profiles[currentProfile][categoryData.name].interiorlightsAutomaticTurnOff = settings[categoryData.name].interiorlightsAutomaticTurnOff
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.interiorlightsAutomaticTurnOff"):format(currentProfile, categoryData.name), ToNumber_EInteriorLightsToggleOff(profiles[currentProfile][categoryData.name].interiorlightsAutomaticTurnOff) - 1)
    interiorlightsAutomaticTurnOff_Value = profiles[currentProfile][categoryData.name].interiorlightsAutomaticTurnOff
  end

  nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-interiorlights-automatic_turn_on"), "", EInteriorLightsToggleOn_values, ToNumber_EInteriorLightsToggleOn(interiorlightsAutomaticTurnOn_Value), ToNumber_EInteriorLightsToggleOn(defaults[categoryData.name].interiorlightsAutomaticTurnOn), function(value)
    if useProfile then
      profiles[currentProfile][categoryData.name].interiorlightsAutomaticTurnOn = ToEnum_EInteriorLightsToggleOn(value)
    else
      settings[categoryData.name].interiorlightsAutomaticTurnOn = ToEnum_EInteriorLightsToggleOn(value)
    end

    settingsModified = true
    local intValue = ToNumber_EInteriorLightsToggleOn(value) - 1
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s.interiorlightsAutomaticTurnOn"):format(currentProfile, categoryData.name), intValue)
    else
      Populate_Variant_IntoSettingsMap(("%s.interiorlightsAutomaticTurnOn"):format(categoryData.name), intValue)
    end
  end)

  nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-interiorlights-automatic_turn_off"), "", EInteriorLightsToggleOff_values, ToNumber_EInteriorLightsToggleOff(interiorlightsAutomaticTurnOff_Value), ToNumber_EInteriorLightsToggleOff(defaults[categoryData.name].interiorlightsAutomaticTurnOff), function(value)
    if useProfile then
      profiles[currentProfile][categoryData.name].interiorlightsAutomaticTurnOff = ToEnum_EInteriorLightsToggleOff(value)
    else
      settings[categoryData.name].interiorlightsAutomaticTurnOff = ToEnum_EInteriorLightsToggleOff(value)
    end

    settingsModified = true
    local intValue = ToNumber_EInteriorLightsToggleOff(value) - 1
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s.interiorlightsAutomaticTurnOff"):format(currentProfile, categoryData.name), intValue)
    else
      Populate_Variant_IntoSettingsMap(("%s.interiorlightsAutomaticTurnOff"):format(categoryData.name), intValue)
    end
  end)

  setup_light_CategorySetters(categoryData, "interiorlights")
end

function setup_light_CategorySetters(categoryData, additional)
  additional = additional or ""

  local settings_AutoResetLightColorEnabled = ("%s_AutoResetLightColorEnabled"):format(categoryData.name)
  local settings_CrystalCoatInclude = ("%s_CrystalCoatInclude"):format(categoryData.name)
  local settings_CrystalCoatColorType = ("%s_CrystalCoatColorType"):format(categoryData.name)
  local settings_ColorSequence = ("%s_ColorSequence"):format(categoryData.name)
  local settings_SequenceLatency = ("%s_SequenceLatency"):format(categoryData.name)
  local settings_ImpactedVehicles = ("%s_ImpactedVehicles"):format(categoryData.name)
  local settings_LightColorEnabled = ("%s_LightColorEnabled"):format(categoryData.name)
  local settings_LightColorHue = ("%s_LightColorHue"):format(categoryData.name)
  local settings_LightColorSaturation = ("%s_LightColorSaturation"):format(categoryData.name)
  local settings_LightColorBrightness = ("%s_LightColorBrightness"):format(categoryData.name)
  local settings_CycleColorHue = ("%s_CycleColorHue"):format(categoryData.name)
  local settings_CycleColorSaturation = ("%s_CycleColorSaturation"):format(categoryData.name)
  local settings_CycleColorBrightness = ("%s_CycleColorBrightness"):format(categoryData.name)

  local useProfile = false
  local AutoResetLightColorEnabled_Value = settings[categoryData.name][settings_AutoResetLightColorEnabled]
  local CrystalCoatInclude_Value = settings[categoryData.name][settings_CrystalCoatInclude]
  local CrystalCoatColorType_Value = settings[categoryData.name][settings_CrystalCoatColorType]
  local ColorSequence_Value = settings[categoryData.name][settings_ColorSequence]
  local SequenceLatency_Value = settings[categoryData.name][settings_SequenceLatency]
  local ImpactedVehicles_Value = settings[categoryData.name][settings_ImpactedVehicles]
  local LightColorEnabled_Value = settings[categoryData.name][settings_LightColorEnabled]
  local LightColorHue_Value = settings[categoryData.name][settings_LightColorHue]
  local LightColorSaturation_Value = settings[categoryData.name][settings_LightColorSaturation]
  local LightColorBrightness_Value = settings[categoryData.name][settings_LightColorBrightness]
  local CycleColorHue_Value = settings[categoryData.name][settings_CycleColorHue]
  local CycleColorSaturation_Value = settings[categoryData.name][settings_CycleColorSaturation]
  local CycleColorBrightness_Value = settings[categoryData.name][settings_CycleColorBrightness]

  if profiles[currentProfile] ~= nil and profiles[currentProfile][categoryData.name].customProfileEnabled then
    useProfile = true

    if profiles[currentProfile][categoryData.name][settings_AutoResetLightColorEnabled] == nil then
      profiles[currentProfile][categoryData.name][settings_AutoResetLightColorEnabled] = settings[categoryData.name][settings_AutoResetLightColorEnabled]
    end
    Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_AutoResetLightColorEnabled), profiles[currentProfile][categoryData.name][settings_AutoResetLightColorEnabled])
    AutoResetLightColorEnabled_Value = profiles[currentProfile][categoryData.name][settings_AutoResetLightColorEnabled]

    if profiles[currentProfile][categoryData.name][settings_CrystalCoatInclude] == nil then
      profiles[currentProfile][categoryData.name][settings_CrystalCoatInclude] = settings[categoryData.name][settings_CrystalCoatInclude]
    end
    Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_CrystalCoatInclude), profiles[currentProfile][categoryData.name][settings_CrystalCoatInclude])
    CrystalCoatInclude_Value = profiles[currentProfile][categoryData.name][settings_CrystalCoatInclude]

    if profiles[currentProfile][categoryData.name][settings_CrystalCoatColorType] == nil then
      profiles[currentProfile][categoryData.name][settings_CrystalCoatColorType] = settings[categoryData.name][settings_CrystalCoatColorType]
    end
    Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_CrystalCoatColorType), ToNumber_ECrystalCoatColorType(profiles[currentProfile][categoryData.name][settings_CrystalCoatColorType]) - 1)
    CrystalCoatColorType_Value = profiles[currentProfile][categoryData.name][settings_CrystalCoatColorType]

    if profiles[currentProfile][categoryData.name][settings_ColorSequence] == nil then
      profiles[currentProfile][categoryData.name][settings_ColorSequence] = settings[categoryData.name][settings_ColorSequence]
    end
    Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_ColorSequence), ToNumber_ELightsColorCycleType(profiles[currentProfile][categoryData.name][settings_ColorSequence]) - 1)
    ColorSequence_Value = profiles[currentProfile][categoryData.name][settings_ColorSequence]

    if profiles[currentProfile][categoryData.name][settings_SequenceLatency] == nil then
      profiles[currentProfile][categoryData.name][settings_SequenceLatency] = settings[categoryData.name][settings_SequenceLatency]
    end
    Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_SequenceLatency), profiles[currentProfile][categoryData.name][settings_SequenceLatency])
    SequenceLatency_Value = profiles[currentProfile][categoryData.name][settings_SequenceLatency]

    if profiles[currentProfile][categoryData.name][settings_ImpactedVehicles] == nil then
      profiles[currentProfile][categoryData.name][settings_ImpactedVehicles] = settings[categoryData.name][settings_ImpactedVehicles]
    end
    Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_ImpactedVehicles), ToNumber_ELightsColorVehicleType(profiles[currentProfile][categoryData.name][settings_ImpactedVehicles]) - 1)
    ImpactedVehicles_Value = profiles[currentProfile][categoryData.name][settings_ImpactedVehicles]

    if profiles[currentProfile][categoryData.name][settings_LightColorEnabled] == nil then
      profiles[currentProfile][categoryData.name][settings_LightColorEnabled] = settings[categoryData.name][settings_LightColorEnabled]
    end
    Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_LightColorEnabled), profiles[currentProfile][categoryData.name][settings_LightColorEnabled])
    LightColorEnabled_Value = profiles[currentProfile][categoryData.name][settings_LightColorEnabled]

    if profiles[currentProfile][categoryData.name][settings_LightColorHue] == nil then
      profiles[currentProfile][categoryData.name][settings_LightColorHue] = settings[categoryData.name][settings_LightColorHue]
    end
    Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_LightColorHue), profiles[currentProfile][categoryData.name][settings_LightColorHue])
    LightColorHue_Value = profiles[currentProfile][categoryData.name][settings_LightColorHue]

    if profiles[currentProfile][categoryData.name][settings_LightColorSaturation] == nil then
      profiles[currentProfile][categoryData.name][settings_LightColorSaturation] = settings[categoryData.name][settings_LightColorSaturation]
    end
    Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_LightColorSaturation), profiles[currentProfile][categoryData.name][settings_LightColorSaturation])
    LightColorSaturation_Value = profiles[currentProfile][categoryData.name][settings_LightColorSaturation]

    if profiles[currentProfile][categoryData.name][settings_LightColorBrightness] == nil then
      profiles[currentProfile][categoryData.name][settings_LightColorBrightness] = settings[categoryData.name][settings_LightColorBrightness]
    end
    Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_LightColorBrightness), profiles[currentProfile][categoryData.name][settings_LightColorBrightness])
    LightColorBrightness_Value = profiles[currentProfile][categoryData.name][settings_LightColorBrightness]

    if profiles[currentProfile][categoryData.name][settings_CycleColorHue] == nil then
      profiles[currentProfile][categoryData.name][settings_CycleColorHue] = settings[categoryData.name][settings_CycleColorHue]
    end
    Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_CycleColorHue), profiles[currentProfile][categoryData.name][settings_CycleColorHue])
    CycleColorHue_Value = profiles[currentProfile][categoryData.name][settings_CycleColorHue]

    if profiles[currentProfile][categoryData.name][settings_CycleColorSaturation] == nil then
      profiles[currentProfile][categoryData.name][settings_CycleColorSaturation] = settings[categoryData.name][settings_CycleColorSaturation]
    end
    Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_CycleColorSaturation), profiles[currentProfile][categoryData.name][settings_CycleColorSaturation])
    CycleColorSaturation_Value = profiles[currentProfile][categoryData.name][settings_CycleColorSaturation]

    if profiles[currentProfile][categoryData.name][settings_CycleColorBrightness] == nil then
      profiles[currentProfile][categoryData.name][settings_CycleColorBrightness] = settings[categoryData.name][settings_CycleColorBrightness]
    end
    Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_CycleColorBrightness), profiles[currentProfile][categoryData.name][settings_CycleColorBrightness])
    CycleColorBrightness_Value = profiles[currentProfile][categoryData.name][settings_CycleColorBrightness]
  end
  
  local settingEnumValue_ColorSequence = ToEnum_ELightsColorCycleType(ColorSequence_Value)

  -- Forced values
  if settingEnumValue_ColorSequence == "TwoColorsCycle" then
    if useProfile then
      profiles[currentProfile][categoryData.name][settings_LightColorEnabled] = true
      Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_LightColorEnabled), profiles[currentProfile][categoryData.name][settings_LightColorEnabled])
      LightColorEnabled_Value = profiles[currentProfile][categoryData.name][settings_LightColorEnabled]
    else
      settings[categoryData.name][settings_LightColorEnabled] = true
      Populate_Variant_IntoSettingsMap(settings_LightColorEnabled, settings[categoryData.name][settings_LightColorEnabled])
      LightColorEnabled_Value = settings[categoryData.name][settings_LightColorEnabled]
    end
  elseif settingEnumValue_ColorSequence == "Rainbow" then
    if useProfile then
      profiles[currentProfile][categoryData.name][settings_LightColorEnabled] = false
      Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_LightColorEnabled), profiles[currentProfile][categoryData.name][settings_LightColorEnabled])
      LightColorEnabled_Value = profiles[currentProfile][categoryData.name][settings_LightColorEnabled]
    else
      settings[categoryData.name][settings_LightColorEnabled] = false
      Populate_Variant_IntoSettingsMap(settings_LightColorEnabled, settings[categoryData.name][settings_LightColorEnabled])
      LightColorEnabled_Value = settings[categoryData.name][settings_LightColorEnabled]
    end
  end

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-lights-auto_reset_light_color"), GetLocalizedTextByKey("hgyi56-EVS-settings-lights-auto_reset_light_color-desc"), AutoResetLightColorEnabled_Value, defaults[categoryData.name][settings_AutoResetLightColorEnabled], function(state)
    if useProfile then
      profiles[currentProfile][categoryData.name][settings_AutoResetLightColorEnabled] = state
    else
      settings[categoryData.name][settings_AutoResetLightColorEnabled] = state
    end

    settingsModified = true
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_AutoResetLightColorEnabled), state)
    else
      Populate_Variant_IntoSettingsMap(settings_AutoResetLightColorEnabled, state)
    end
  end)
  
  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-use_cc_color"), GetLocalizedTextByKey("hgyi56-EVS-settings-use_cc_color-desc"), CrystalCoatInclude_Value, defaults[categoryData.name][settings_CrystalCoatInclude], function(state)
    if useProfile then
      profiles[currentProfile][categoryData.name][settings_CrystalCoatInclude] = state
    else
      settings[categoryData.name][settings_CrystalCoatInclude] = state
    end
    
    setup_CategorySetters(categoryData, additional)

    settingsModified = true
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_CrystalCoatInclude), state)
    else
      Populate_Variant_IntoSettingsMap(settings_CrystalCoatInclude, state)
    end
  end)

  if CrystalCoatInclude_Value then
    nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-cc_color_type"), GetLocalizedTextByKey("hgyi56-EVS-settings-cc_color_type-desc"), ECrystalCoatColorType_values, ToNumber_ECrystalCoatColorType(CrystalCoatColorType_Value), ToNumber_ECrystalCoatColorType(defaults[categoryData.name][settings_CrystalCoatColorType]), function(value)
      if useProfile then
        profiles[currentProfile][categoryData.name][settings_CrystalCoatColorType] = ToEnum_ECrystalCoatColorType(value)
      else
        settings[categoryData.name][settings_CrystalCoatColorType] = ToEnum_ECrystalCoatColorType(value)
      end

      settingsModified = true
      local intValue = ToNumber_ECrystalCoatColorType(value) - 1
      
      if useProfile then
        Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_CrystalCoatColorType), intValue)
      else
        Populate_Variant_IntoSettingsMap(settings_CrystalCoatColorType, intValue)
      end
    end)
  end

  nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-color_sequence"), GetLocalizedTextByKey("hgyi56-EVS-settings-color_sequence-desc"), ELightsColorCycleType_values, ToNumber_ELightsColorCycleType(ColorSequence_Value), ToNumber_ELightsColorCycleType(defaults[categoryData.name][settings_ColorSequence]), function(value)
    local value = ToEnum_ELightsColorCycleType(value)
    if useProfile then
      profiles[currentProfile][categoryData.name][settings_ColorSequence] = value
    else
      settings[categoryData.name][settings_ColorSequence] = value
    end

    -- Default values
    if value == "Blinker" then
      if useProfile then
        profiles[currentProfile][categoryData.name][settings_SequenceLatency] = 0.3
        Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_SequenceLatency), profiles[currentProfile][categoryData.name][settings_SequenceLatency])
      else
        settings[categoryData.name][settings_SequenceLatency] = 0.3
        Populate_Variant_IntoSettingsMap(settings_SequenceLatency, settings[categoryData.name][settings_SequenceLatency])
      end
    elseif value == "Beacon" then
      if useProfile then
        profiles[currentProfile][categoryData.name][settings_SequenceLatency] = 0.8
        Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_SequenceLatency), profiles[currentProfile][categoryData.name][settings_SequenceLatency])
      else
        settings[categoryData.name][settings_SequenceLatency] = 0.8
        Populate_Variant_IntoSettingsMap(settings_SequenceLatency, settings[categoryData.name][settings_SequenceLatency])
      end
    elseif value == "Pulse" then
      if useProfile then
        profiles[currentProfile][categoryData.name][settings_SequenceLatency] = 2.0
        Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_SequenceLatency), profiles[currentProfile][categoryData.name][settings_SequenceLatency])
      else
        settings[categoryData.name][settings_SequenceLatency] = 2.0
        Populate_Variant_IntoSettingsMap(settings_SequenceLatency, settings[categoryData.name][settings_SequenceLatency])
      end
    elseif value == "TwoColorsCycle" then
      if useProfile then
        profiles[currentProfile][categoryData.name][settings_SequenceLatency] = 2.0
        Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_SequenceLatency), profiles[currentProfile][categoryData.name][settings_SequenceLatency])
      else
        settings[categoryData.name][settings_SequenceLatency] = 2.0
        Populate_Variant_IntoSettingsMap(settings_SequenceLatency, settings[categoryData.name][settings_SequenceLatency])
      end
    elseif value == "Rainbow" then
      if useProfile then
        profiles[currentProfile][categoryData.name][settings_SequenceLatency] = 1.5
        Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_SequenceLatency), profiles[currentProfile][categoryData.name][settings_SequenceLatency])
      else
        settings[categoryData.name][settings_SequenceLatency] = 1.5
        Populate_Variant_IntoSettingsMap(settings_SequenceLatency, settings[categoryData.name][settings_SequenceLatency])
      end
    end
    
    setup_CategorySetters(categoryData, additional)

    settingsModified = true
    local intValue = ToNumber_ELightsColorCycleType(value) - 1
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_ColorSequence), intValue)
    else
      Populate_Variant_IntoSettingsMap(settings_ColorSequence, intValue)
    end
  end)

  if settingEnumValue_ColorSequence ~= "Solid" then
    nativeSettings.addRangeFloat(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-sequence_latency"), GetLocalizedTextByKey("hgyi56-EVS-settings-sequence_latency-desc"), 0.2, 5.0, 0.1, "%.1f", SequenceLatency_Value, defaults[categoryData.name][settings_SequenceLatency], function(value)
      if useProfile then
        profiles[currentProfile][categoryData.name][settings_SequenceLatency] = value
      else
        settings[categoryData.name][settings_SequenceLatency] = value
      end

      settingsModified = true
      
      if useProfile then
        Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_SequenceLatency), value)
      else
        Populate_Variant_IntoSettingsMap(settings_SequenceLatency, value)
      end
    end)
  end

  if LightColorEnabled_Value
  or settingEnumValue_ColorSequence ~= "Solid" then
    nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-impacted_vehicles"), GetLocalizedTextByKey("hgyi56-EVS-settings-impacted_vehicles-desc"), ELightsColorVehicleType_values, ToNumber_ELightsColorVehicleType(ImpactedVehicles_Value), ToNumber_ELightsColorVehicleType(defaults[categoryData.name][settings_ImpactedVehicles]), function(value)
      if useProfile then
        profiles[currentProfile][categoryData.name][settings_ImpactedVehicles] = ToEnum_ELightsColorVehicleType(value)
      else
        settings[categoryData.name][settings_ImpactedVehicles] = ToEnum_ELightsColorVehicleType(value)
      end

      settingsModified = true
      local intValue = ToNumber_ELightsColorVehicleType(value) - 1
      
      if useProfile then
        Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_ImpactedVehicles), intValue)
      else
        Populate_Variant_IntoSettingsMap(settings_ImpactedVehicles, intValue)
      end
    end)
  end

  if settingEnumValue_ColorSequence ~= "Rainbow"
  and settingEnumValue_ColorSequence ~= "TwoColorsCycle" then
    nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-custom_color"), GetLocalizedTextByKey("hgyi56-EVS-settings-custom_color-desc"), LightColorEnabled_Value, defaults[categoryData.name][settings_LightColorEnabled], function(state)
      if useProfile then
        profiles[currentProfile][categoryData.name][settings_LightColorEnabled] = state
      else
        settings[categoryData.name][settings_LightColorEnabled] = state
      end
        
      setup_CategorySetters(categoryData, additional)

      settingsModified = true
      
      if useProfile then
        Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_LightColorEnabled), state)
      else
        Populate_Variant_IntoSettingsMap(settings_LightColorEnabled, state)
      end
    end)
  end

  if LightColorEnabled_Value
  or settingEnumValue_ColorSequence == "TwoColorsCycle"
  or settingEnumValue_ColorSequence == "Rainbow" then

    if settingEnumValue_ColorSequence ~= "Rainbow" then
      nativeSettings.addRangeInt(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-custom_color-hue"), GetLocalizedTextByKey("hgyi56-EVS-settings-hue-desc"), 0, 359, 1, LightColorHue_Value, defaults[categoryData.name][settings_LightColorHue], function(value)
        if useProfile then
          profiles[currentProfile][categoryData.name][settings_LightColorHue] = value
        else
          settings[categoryData.name][settings_LightColorHue] = value
        end

        settingsModified = true
        
        if useProfile then
          Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_LightColorHue), value)
        else
          Populate_Variant_IntoSettingsMap(settings_LightColorHue, value)
        end
      end)
    end
    
    nativeSettings.addRangeInt(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-custom_color-saturation"), GetLocalizedTextByKey("hgyi56-EVS-settings-saturation-desc"), 0, 100, 1, LightColorSaturation_Value, defaults[categoryData.name][settings_LightColorSaturation], function(value)
      if useProfile then
        profiles[currentProfile][categoryData.name][settings_LightColorSaturation] = value
      else
        settings[categoryData.name][settings_LightColorSaturation] = value
      end

      settingsModified = true
      
      if useProfile then
        Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_LightColorSaturation), value)
      else
        Populate_Variant_IntoSettingsMap(settings_LightColorSaturation, value)
      end
    end)
    
    nativeSettings.addRangeInt(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-custom_color-brightness"), GetLocalizedTextByKey("hgyi56-EVS-settings-brightness-desc"), 0, 100, 1, LightColorBrightness_Value, defaults[categoryData.name][settings_LightColorBrightness], function(value)
      if useProfile then
        profiles[currentProfile][categoryData.name][settings_LightColorBrightness] = value
      else
        settings[categoryData.name][settings_LightColorBrightness] = value
      end

      settingsModified = true
      
      if useProfile then
        Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_LightColorBrightness), value)
      else
        Populate_Variant_IntoSettingsMap(settings_LightColorBrightness, value)
      end
    end)
  end

  if settingEnumValue_ColorSequence == "TwoColorsCycle" then
    nativeSettings.addRangeInt(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-cycle_color-hue"), GetLocalizedTextByKey("hgyi56-EVS-settings-hue-desc"), 0, 359, 1, CycleColorHue_Value, defaults[categoryData.name][settings_CycleColorHue], function(value)
      if useProfile then
        profiles[currentProfile][categoryData.name][settings_CycleColorHue] = value
      else
        settings[categoryData.name][settings_CycleColorHue] = value
      end

      settingsModified = true
      
      if useProfile then
        Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_CycleColorHue), value)
      else
        Populate_Variant_IntoSettingsMap(settings_CycleColorHue, value)
      end
    end)
    
    nativeSettings.addRangeInt(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-cycle_color-saturation"), GetLocalizedTextByKey("hgyi56-EVS-settings-saturation-desc"), 0, 100, 1, CycleColorSaturation_Value, defaults[categoryData.name][settings_CycleColorSaturation], function(value)
      if useProfile then
        profiles[currentProfile][categoryData.name][settings_CycleColorSaturation] = value
      else
        settings[categoryData.name][settings_CycleColorSaturation] = value
      end

      settingsModified = true
      
      if useProfile then
        Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_CycleColorSaturation), value)
      else
        Populate_Variant_IntoSettingsMap(settings_CycleColorSaturation, value)
      end
    end)
    
    nativeSettings.addRangeInt(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-cycle_color-brightness"), GetLocalizedTextByKey("hgyi56-EVS-settings-brightness-desc"), 0, 100, 1, CycleColorBrightness_Value, defaults[categoryData.name][settings_CycleColorBrightness], function(value)
      if useProfile then
        profiles[currentProfile][categoryData.name][settings_CycleColorBrightness] = value
      else
        settings[categoryData.name][settings_CycleColorBrightness] = value
      end

      settingsModified = true
      
      if useProfile then
        Populate_Variant_IntoSettingsMap(("%s.%s"):format(currentProfile, settings_CycleColorBrightness), value)
      else
        Populate_Variant_IntoSettingsMap(settings_CycleColorBrightness, value)
      end
    end)
  end
end

function setup_crystalcoat_CategorySetters(categoryData)
  SetupCategory(categoryData)

  local useProfile = false
  local crystalCoatDeactivationDistance_Value = settings[categoryData.name].crystalCoatDeactivationDistance
  local crystalCoatAutoEnable_Value = settings[categoryData.name].crystalCoatAutoEnable
  local cosmeticTrollEnabled_Value = settings[categoryData.name].cosmeticTrollEnabled

  if profiles[currentProfile] ~= nil and profiles[currentProfile][categoryData.name].customProfileEnabled then
    useProfile = true

    if profiles[currentProfile][categoryData.name].crystalCoatDeactivationDistance == nil then
      profiles[currentProfile][categoryData.name].crystalCoatDeactivationDistance = settings[categoryData.name].crystalCoatDeactivationDistance
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.crystalCoatDeactivationDistance"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].crystalCoatDeactivationDistance)
    crystalCoatDeactivationDistance_Value = profiles[currentProfile][categoryData.name].crystalCoatDeactivationDistance

    if profiles[currentProfile][categoryData.name].crystalCoatAutoEnable == nil then
      profiles[currentProfile][categoryData.name].crystalCoatAutoEnable = settings[categoryData.name].crystalCoatAutoEnable
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.crystalCoatAutoEnable"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].crystalCoatAutoEnable)
    crystalCoatAutoEnable_Value = profiles[currentProfile][categoryData.name].crystalCoatAutoEnable

    if profiles[currentProfile][categoryData.name].cosmeticTrollEnabled == nil then
      profiles[currentProfile][categoryData.name].cosmeticTrollEnabled = settings[categoryData.name].cosmeticTrollEnabled
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.cosmeticTrollEnabled"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].cosmeticTrollEnabled)
    cosmeticTrollEnabled_Value = profiles[currentProfile][categoryData.name].cosmeticTrollEnabled
  end

  nativeSettings.addRangeFloat(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-crystalcoat-deactivation_distance"), GetLocalizedTextByKey("hgyi56-EVS-settings-crystalcoat-deactivation_distance-desc"), 5.65, 200.0, 0.01, "%.2f", crystalCoatDeactivationDistance_Value, defaults[categoryData.name].crystalCoatDeactivationDistance, function(value)
    if useProfile then
      profiles[currentProfile][categoryData.name].crystalCoatDeactivationDistance = value
    else
      settings[categoryData.name].crystalCoatDeactivationDistance = value
    end

    settingsModified = true
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s.crystalCoatDeactivationDistance"):format(currentProfile, categoryData.name), value)
    else
      Populate_Variant_IntoSettingsMap(("%s.crystalCoatDeactivationDistance"):format(categoryData.name), value)
    end
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-crystalcoat-auto_enable"), GetLocalizedTextByKey("hgyi56-EVS-settings-crystalcoat-auto_enable-desc"), crystalCoatAutoEnable_Value, defaults[categoryData.name].crystalCoatAutoEnable, function(state)
    if useProfile then
      profiles[currentProfile][categoryData.name].crystalCoatAutoEnable = state
    else
      settings[categoryData.name].crystalCoatAutoEnable = state
    end

    settingsModified = true
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s.crystalCoatAutoEnable"):format(currentProfile, categoryData.name), state)
    else
      Populate_Variant_IntoSettingsMap(("%s.crystalCoatAutoEnable"):format(categoryData.name), state)
    end
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-crystalcoat-cosmetic_troll_enabled"), GetLocalizedTextByKey("hgyi56-EVS-settings-crystalcoat-cosmetic_troll_enabled-desc"), cosmeticTrollEnabled_Value, defaults[categoryData.name].cosmeticTrollEnabled, function(state)
    if useProfile then
      profiles[currentProfile][categoryData.name].cosmeticTrollEnabled = state
    else
      settings[categoryData.name].cosmeticTrollEnabled = state
    end

    settingsModified = true
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s.cosmeticTrollEnabled"):format(currentProfile, categoryData.name), state)
    else
      Populate_Variant_IntoSettingsMap(("%s.cosmeticTrollEnabled"):format(categoryData.name), state)
    end
  end)
end

function setup_crystaldome_CategorySetters(categoryData)
  SetupCategory(categoryData)

  local useProfile = false
  local crystalDomeSynchronizedWithPowerState_Value = settings[categoryData.name].crystalDomeSynchronizedWithPowerState
  local crystalDomeKeepOnUntilExit_Value = settings[categoryData.name].crystalDomeKeepOnUntilExit
  local preventCrystalDomeOffDuringCombat_Value = settings[categoryData.name].preventCrystalDomeOffDuringCombat
  local autoEnableCrystalDomeDuringCombat_Value = settings[categoryData.name].autoEnableCrystalDomeDuringCombat

  if profiles[currentProfile] ~= nil and profiles[currentProfile][categoryData.name].customProfileEnabled then
    useProfile = true

    if profiles[currentProfile][categoryData.name].crystalDomeSynchronizedWithPowerState == nil then
      profiles[currentProfile][categoryData.name].crystalDomeSynchronizedWithPowerState = settings[categoryData.name].crystalDomeSynchronizedWithPowerState
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.crystalDomeSynchronizedWithPowerState"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].crystalDomeSynchronizedWithPowerState)
    crystalDomeSynchronizedWithPowerState_Value = profiles[currentProfile][categoryData.name].crystalDomeSynchronizedWithPowerState

    if profiles[currentProfile][categoryData.name].crystalDomeKeepOnUntilExit == nil then
      profiles[currentProfile][categoryData.name].crystalDomeKeepOnUntilExit = settings[categoryData.name].crystalDomeKeepOnUntilExit
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.crystalDomeKeepOnUntilExit"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].crystalDomeKeepOnUntilExit)
    crystalDomeKeepOnUntilExit_Value = profiles[currentProfile][categoryData.name].crystalDomeKeepOnUntilExit

    if profiles[currentProfile][categoryData.name].preventCrystalDomeOffDuringCombat == nil then
      profiles[currentProfile][categoryData.name].preventCrystalDomeOffDuringCombat = settings[categoryData.name].preventCrystalDomeOffDuringCombat
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.preventCrystalDomeOffDuringCombat"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].preventCrystalDomeOffDuringCombat)
    preventCrystalDomeOffDuringCombat_Value = profiles[currentProfile][categoryData.name].preventCrystalDomeOffDuringCombat

    if profiles[currentProfile][categoryData.name].autoEnableCrystalDomeDuringCombat == nil then
      profiles[currentProfile][categoryData.name].autoEnableCrystalDomeDuringCombat = settings[categoryData.name].autoEnableCrystalDomeDuringCombat
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.autoEnableCrystalDomeDuringCombat"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].autoEnableCrystalDomeDuringCombat)
    autoEnableCrystalDomeDuringCombat_Value = profiles[currentProfile][categoryData.name].autoEnableCrystalDomeDuringCombat
  end

  -- Forced values
  if not crystalDomeSynchronizedWithPowerState_Value then
    if useProfile then
      profiles[currentProfile][categoryData.name].crystalDomeKeepOnUntilExit = false
      Populate_Variant_IntoSettingsMap(("%s.%s.crystalDomeKeepOnUntilExit"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].crystalDomeKeepOnUntilExit)
      crystalDomeKeepOnUntilExit_Value = profiles[currentProfile][categoryData.name].crystalDomeKeepOnUntilExit
    else
      settings[categoryData.name].crystalDomeKeepOnUntilExit = false;
      Populate_Variant_IntoSettingsMap(("%s.crystalDomeKeepOnUntilExit"):format(categoryData.name), settings[categoryData.name].crystalDomeKeepOnUntilExit)
      crystalDomeKeepOnUntilExit_Value = settings[categoryData.name].crystalDomeKeepOnUntilExit
    end
  end

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-crystaldome-sync_with_power"), GetLocalizedTextByKey("hgyi56-EVS-settings-crystaldome-sync_with_power-desc"), crystalDomeSynchronizedWithPowerState_Value, defaults[categoryData.name].crystalDomeSynchronizedWithPowerState, function(state)
    if useProfile then
      profiles[currentProfile][categoryData.name].crystalDomeSynchronizedWithPowerState = state
    else
      settings[categoryData.name].crystalDomeSynchronizedWithPowerState = state
    end

    SetupCategory(categoryData)
    setup_crystaldome_CategorySetters(categoryData)

    settingsModified = true
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s.crystalDomeSynchronizedWithPowerState"):format(currentProfile, categoryData.name), state)
    else
      Populate_Variant_IntoSettingsMap(("%s.crystalDomeSynchronizedWithPowerState"):format(categoryData.name), state)
    end
  end)

  if crystalDomeSynchronizedWithPowerState_Value then
    nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-crystaldome-keep_on"), GetLocalizedTextByKey("hgyi56-EVS-settings-crystaldome-keep_on-desc"), crystalDomeKeepOnUntilExit_Value, defaults[categoryData.name].crystalDomeKeepOnUntilExit, function(state)
      if useProfile then
        profiles[currentProfile][categoryData.name].crystalDomeKeepOnUntilExit = state
      else
        settings[categoryData.name].crystalDomeKeepOnUntilExit = state
      end

      settingsModified = true
      
      if useProfile then
        Populate_Variant_IntoSettingsMap(("%s.%s.crystalDomeKeepOnUntilExit"):format(currentProfile, categoryData.name), state)
      else
        Populate_Variant_IntoSettingsMap(("%s.crystalDomeKeepOnUntilExit"):format(categoryData.name), state)
      end
    end)
  end

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-crystaldome-prevent_shutdown"), GetLocalizedTextByKey("hgyi56-EVS-settings-crystaldome-prevent_shutdown-desc"), preventCrystalDomeOffDuringCombat_Value, defaults[categoryData.name].preventCrystalDomeOffDuringCombat, function(state)
    if useProfile then
      profiles[currentProfile][categoryData.name].preventCrystalDomeOffDuringCombat = state
    else
      settings[categoryData.name].preventCrystalDomeOffDuringCombat = state
    end

    settingsModified = true
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s.preventCrystalDomeOffDuringCombat"):format(currentProfile, categoryData.name), state)
    else
      Populate_Variant_IntoSettingsMap(("%s.preventCrystalDomeOffDuringCombat"):format(categoryData.name), state)
    end
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-crystaldome-autostart"), GetLocalizedTextByKey("hgyi56-EVS-settings-crystaldome-autostart-desc"), autoEnableCrystalDomeDuringCombat_Value, defaults[categoryData.name].autoEnableCrystalDomeDuringCombat, function(state)
    if useProfile then
      profiles[currentProfile][categoryData.name].autoEnableCrystalDomeDuringCombat = state
    else
      settings[categoryData.name].autoEnableCrystalDomeDuringCombat = state
    end

    settingsModified = true
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s.autoEnableCrystalDomeDuringCombat"):format(currentProfile, categoryData.name), state)
    else
      Populate_Variant_IntoSettingsMap(("%s.autoEnableCrystalDomeDuringCombat"):format(categoryData.name), state)
    end
  end)
end

function setup_doors_CategorySetters(categoryData)
  SetupCategory(categoryData)

  local useProfile = false
  local doorsDriveClosing_Value = settings[categoryData.name].doorsDriveClosing
  local doorsDriveClosingSpeed_Value = settings[categoryData.name].doorsDriveClosingSpeed

  if profiles[currentProfile] ~= nil and profiles[currentProfile][categoryData.name].customProfileEnabled then
    useProfile = true

    if profiles[currentProfile][categoryData.name].doorsDriveClosing == nil then
      profiles[currentProfile][categoryData.name].doorsDriveClosing = settings[categoryData.name].doorsDriveClosing
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.doorsDriveClosing"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].doorsDriveClosing)
    doorsDriveClosing_Value = profiles[currentProfile][categoryData.name].doorsDriveClosing

    if profiles[currentProfile][categoryData.name].doorsDriveClosingSpeed == nil then
      profiles[currentProfile][categoryData.name].doorsDriveClosingSpeed = settings[categoryData.name].doorsDriveClosingSpeed
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.doorsDriveClosingSpeed"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].doorsDriveClosingSpeed)
    doorsDriveClosingSpeed_Value = profiles[currentProfile][categoryData.name].doorsDriveClosingSpeed
  end

  local settingEnumValue_doorsDriveClosing = ToEnum_EDoorsDriveClosing(doorsDriveClosing_Value)

  nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-doors-close_with_speed"), GetLocalizedTextByKey("hgyi56-EVS-settings-doors-close_with_speed-desc"), EDoorsDriveClosing_values, ToNumber_EDoorsDriveClosing(doorsDriveClosing_Value), ToNumber_EDoorsDriveClosing(defaults[categoryData.name].doorsDriveClosing), function(value)
    if useProfile then
      profiles[currentProfile][categoryData.name].doorsDriveClosing = ToEnum_EDoorsDriveClosing(value)
    else
      settings[categoryData.name].doorsDriveClosing = ToEnum_EDoorsDriveClosing(value)
    end

    SetupCategory(categoryData)
    setup_doors_CategorySetters(categoryData)

    settingsModified = true
    local intValue = ToNumber_EDoorsDriveClosing(value) - 1
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s.doorsDriveClosing"):format(currentProfile, categoryData.name), intValue)
    else
      Populate_Variant_IntoSettingsMap(("%s.doorsDriveClosing"):format(categoryData.name), intValue)
    end
  end)

  if settingEnumValue_doorsDriveClosing == "CustomSpeed" then
    nativeSettings.addRangeFloat(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-doors-closing_speed"), GetLocalizedTextByKey("hgyi56-EVS-settings-doors-closing_speed-desc"), 2.0, 250.0, 1.0, "%.0f", doorsDriveClosingSpeed_Value, defaults[categoryData.name].doorsDriveClosingSpeed, function(value)
      if useProfile then
        profiles[currentProfile][categoryData.name].doorsDriveClosingSpeed = value
      else
        settings[categoryData.name].doorsDriveClosingSpeed = value
      end

      settingsModified = true
      
      if useProfile then
        Populate_Variant_IntoSettingsMap(("%s.%s.doorsDriveClosingSpeed"):format(currentProfile, categoryData.name), value)
      else
        Populate_Variant_IntoSettingsMap(("%s.doorsDriveClosingSpeed"):format(categoryData.name), value)
      end
    end)
  end
end

function setup_spoiler_CategorySetters(categoryData)
  SetupCategory(categoryData)

  local useProfile = false
  local spoilerSynchronizedWithPowerState_Value = settings[categoryData.name].spoilerSynchronizedWithPowerState
  local spoilerDeploySpeedEnabled_Value = settings[categoryData.name].spoilerDeploySpeedEnabled
  local spoilerDeploySpeed_Value = settings[categoryData.name].spoilerDeploySpeed
  local spoilerRetractSpeedEnabled_Value = settings[categoryData.name].spoilerRetractSpeedEnabled
  local spoilerRetractSpeed_Value = settings[categoryData.name].spoilerRetractSpeed

  if profiles[currentProfile] ~= nil and profiles[currentProfile][categoryData.name].customProfileEnabled then
    useProfile = true

    if profiles[currentProfile][categoryData.name].spoilerSynchronizedWithPowerState == nil then
      profiles[currentProfile][categoryData.name].spoilerSynchronizedWithPowerState = settings[categoryData.name].spoilerSynchronizedWithPowerState
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.spoilerSynchronizedWithPowerState"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].spoilerSynchronizedWithPowerState)
    spoilerSynchronizedWithPowerState_Value = profiles[currentProfile][categoryData.name].spoilerSynchronizedWithPowerState

    if profiles[currentProfile][categoryData.name].spoilerDeploySpeedEnabled == nil then
      profiles[currentProfile][categoryData.name].spoilerDeploySpeedEnabled = settings[categoryData.name].spoilerDeploySpeedEnabled
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.spoilerDeploySpeedEnabled"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].spoilerDeploySpeedEnabled)
    spoilerDeploySpeedEnabled_Value = profiles[currentProfile][categoryData.name].spoilerDeploySpeedEnabled

    if profiles[currentProfile][categoryData.name].spoilerDeploySpeed == nil then
      profiles[currentProfile][categoryData.name].spoilerDeploySpeed = settings[categoryData.name].spoilerDeploySpeed
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.spoilerDeploySpeed"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].spoilerDeploySpeed)
    spoilerDeploySpeed_Value = profiles[currentProfile][categoryData.name].spoilerDeploySpeed

    if profiles[currentProfile][categoryData.name].spoilerRetractSpeedEnabled == nil then
      profiles[currentProfile][categoryData.name].spoilerRetractSpeedEnabled = settings[categoryData.name].spoilerRetractSpeedEnabled
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.spoilerRetractSpeedEnabled"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].spoilerRetractSpeedEnabled)
    spoilerRetractSpeedEnabled_Value = profiles[currentProfile][categoryData.name].spoilerRetractSpeedEnabled

    if profiles[currentProfile][categoryData.name].spoilerRetractSpeed == nil then
      profiles[currentProfile][categoryData.name].spoilerRetractSpeed = settings[categoryData.name].spoilerRetractSpeed
    end
    Populate_Variant_IntoSettingsMap(("%s.%s.spoilerRetractSpeed"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].spoilerRetractSpeed)
    spoilerRetractSpeed_Value = profiles[currentProfile][categoryData.name].spoilerRetractSpeed
  end

  -- Forced values
  if spoilerSynchronizedWithPowerState_Value then
    if useProfile then
      profiles[currentProfile][categoryData.name].spoilerDeploySpeedEnabled = false
      profiles[currentProfile][categoryData.name].spoilerRetractSpeedEnabled = false
      Populate_Variant_IntoSettingsMap(("%s.%s.spoilerDeploySpeedEnabled"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].spoilerDeploySpeedEnabled)
      Populate_Variant_IntoSettingsMap(("%s.%s.spoilerRetractSpeedEnabled"):format(currentProfile, categoryData.name), profiles[currentProfile][categoryData.name].spoilerRetractSpeedEnabled)
      spoilerDeploySpeedEnabled_Value = profiles[currentProfile][categoryData.name].spoilerDeploySpeedEnabled
      spoilerRetractSpeedEnabled_Value = profiles[currentProfile][categoryData.name].spoilerRetractSpeedEnabled
    else
      settings[categoryData.name].spoilerDeploySpeedEnabled = false
      settings[categoryData.name].spoilerRetractSpeedEnabled = false
      Populate_Variant_IntoSettingsMap(("%s.spoilerDeploySpeedEnabled"):format(categoryData.name), settings[categoryData.name].spoilerDeploySpeedEnabled)
      Populate_Variant_IntoSettingsMap(("%s.spoilerRetractSpeedEnabled"):format(categoryData.name), settings[categoryData.name].spoilerRetractSpeedEnabled)
      spoilerDeploySpeedEnabled_Value = settings[categoryData.name].spoilerDeploySpeedEnabled
      spoilerRetractSpeedEnabled_Value = settings[categoryData.name].spoilerRetractSpeedEnabled
    end
  end

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-spoiler-sync_with_power"), GetLocalizedTextByKey("hgyi56-EVS-settings-spoiler-sync_with_power-desc"), spoilerSynchronizedWithPowerState_Value, defaults[categoryData.name].spoilerSynchronizedWithPowerState, function(state)
    if useProfile then
      profiles[currentProfile][categoryData.name].spoilerSynchronizedWithPowerState = state
    else
      settings[categoryData.name].spoilerSynchronizedWithPowerState = state
    end

    SetupCategory(categoryData)
    setup_spoiler_CategorySetters(categoryData)

    settingsModified = true
    
    if useProfile then
      Populate_Variant_IntoSettingsMap(("%s.%s.spoilerSynchronizedWithPowerState"):format(currentProfile, categoryData.name), state)
    else
      Populate_Variant_IntoSettingsMap(("%s.spoilerSynchronizedWithPowerState"):format(categoryData.name), state)
    end
  end)

  if not spoilerSynchronizedWithPowerState_Value then
    nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-spoiler-deploy_with_speed"), GetLocalizedTextByKey("hgyi56-EVS-settings-spoiler-deploy_with_speed-desc"), spoilerDeploySpeedEnabled_Value, defaults[categoryData.name].spoilerDeploySpeedEnabled, function(state)
      if useProfile then
        profiles[currentProfile][categoryData.name].spoilerDeploySpeedEnabled = state
      else
        settings[categoryData.name].spoilerDeploySpeedEnabled = state
      end

      SetupCategory(categoryData)
      setup_spoiler_CategorySetters(categoryData)

      settingsModified = true
      
      if useProfile then
        Populate_Variant_IntoSettingsMap(("%s.%s.spoilerDeploySpeedEnabled"):format(currentProfile, categoryData.name), state)
      else
        Populate_Variant_IntoSettingsMap(("%s.spoilerDeploySpeedEnabled"):format(categoryData.name), state)
      end
    end)
  end

  if spoilerDeploySpeedEnabled_Value then
    nativeSettings.addRangeFloat(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-spoiler-deploy_speed"), GetLocalizedTextByKey("hgyi56-EVS-settings-spoiler-deploy_speed-desc"), 0.0, 250.0, 1.0, "%.0f", spoilerDeploySpeed_Value, defaults[categoryData.name].spoilerDeploySpeed, function(value)
      if useProfile then
        profiles[currentProfile][categoryData.name].spoilerDeploySpeed = value
      else
        settings[categoryData.name].spoilerDeploySpeed = value
      end

      settingsModified = true
      
      if useProfile then
        Populate_Variant_IntoSettingsMap(("%s.%s.spoilerDeploySpeed"):format(currentProfile, categoryData.name), value)
      else
        Populate_Variant_IntoSettingsMap(("%s.spoilerDeploySpeed"):format(categoryData.name), value)
      end
    end)
  end

  if not spoilerSynchronizedWithPowerState_Value then
    nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-spoiler-retract_with_speed"), GetLocalizedTextByKey("hgyi56-EVS-settings-spoiler-retract_with_speed-desc"), spoilerRetractSpeedEnabled_Value, defaults[categoryData.name].spoilerRetractSpeedEnabled, function(state)
      if useProfile then
        profiles[currentProfile][categoryData.name].spoilerRetractSpeedEnabled = state
      else
        settings[categoryData.name].spoilerRetractSpeedEnabled = state
      end

      SetupCategory(categoryData)
      setup_spoiler_CategorySetters(categoryData)

      settingsModified = true
      
      if useProfile then
        Populate_Variant_IntoSettingsMap(("%s.%s.spoilerRetractSpeedEnabled"):format(currentProfile, categoryData.name), state)
      else
        Populate_Variant_IntoSettingsMap(("%s.spoilerRetractSpeedEnabled"):format(categoryData.name), state)
      end
    end)
  end

  if spoilerRetractSpeedEnabled_Value then
    nativeSettings.addRangeFloat(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-spoiler-retract_speed"), GetLocalizedTextByKey("hgyi56-EVS-settings-spoiler-retract_speed-desc"), 0.0, 250.0, 1.0, "%.0f", spoilerRetractSpeed_Value, defaults[categoryData.name].spoilerRetractSpeed, function(value)
      if useProfile then
        profiles[currentProfile][categoryData.name].spoilerRetractSpeed = value
      else
        settings[categoryData.name].spoilerRetractSpeed = value
      end

      settingsModified = true
      
      if useProfile then
        Populate_Variant_IntoSettingsMap(("%s.%s.spoilerRetractSpeed"):format(currentProfile, categoryData.name), value)
      else
        Populate_Variant_IntoSettingsMap(("%s.spoilerRetractSpeed"):format(categoryData.name), value)
      end
    end)
  end
end

function setup_police_lights_CategorySetters(categoryData)
  SetupCategory(categoryData)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-police_lights-keep_siren_player"), GetLocalizedTextByKey("hgyi56-EVS-settings-police_lights-keep_siren_player-desc"), settings[categoryData.name].keepSirenOnWhileOutsidePlayerEnabled, defaults[categoryData.name].keepSirenOnWhileOutsidePlayerEnabled, function(state)
    settings[categoryData.name].keepSirenOnWhileOutsidePlayerEnabled = state

    settingsModified = true
    Populate_Variant_IntoSettingsMap(("%s.keepSirenOnWhileOutsidePlayerEnabled"):format(categoryData.name), state)
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-police_lights-keep_siren_npc"), GetLocalizedTextByKey("hgyi56-EVS-settings-police_lights-keep_siren_npc-desc"), settings[categoryData.name].keepSirenOnWhileOutsideNPCsEnabled, defaults[categoryData.name].keepSirenOnWhileOutsideNPCsEnabled, function(state)
    settings[categoryData.name].keepSirenOnWhileOutsideNPCsEnabled = state

    settingsModified = true
    Populate_Variant_IntoSettingsMap(("%s.keepSirenOnWhileOutsideNPCsEnabled"):format(categoryData.name), state)
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-police_lights-siren_for_bikes"), GetLocalizedTextByKey("hgyi56-EVS-settings-police_lights-siren_for_bikes-desc"), settings[categoryData.name].policeBikeSirenEnabled, defaults[categoryData.name].policeBikeSirenEnabled, function(state)
    settings[categoryData.name].policeBikeSirenEnabled = state

    settingsModified = true
    Populate_Variant_IntoSettingsMap(("%s.policeBikeSirenEnabled"):format(categoryData.name), state)
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-police_lights-dispatch_radio"), GetLocalizedTextByKey("hgyi56-EVS-settings-police_lights-dispatch_radio-desc"), settings[categoryData.name].policeDispatchRadioEnabled, defaults[categoryData.name].policeDispatchRadioEnabled, function(state)
    settings[categoryData.name].policeDispatchRadioEnabled = state

    settingsModified = true
    Populate_Variant_IntoSettingsMap(("%s.policeDispatchRadioEnabled"):format(categoryData.name), state)
  end)
end

function setup_hints_CategorySetters(categoryData)
  SetupCategory(categoryData)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-input_hints-power_engine"), "", settings[categoryData.name].displayPowerEngineInputHint, defaults[categoryData.name].displayPowerEngineInputHint, function(state)
    settings[categoryData.name].displayPowerEngineInputHint = state

    settingsModified = true
    Populate_Variant_IntoSettingsMap(("%s.displayPowerEngineInputHint"):format(categoryData.name), state)
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-input_hints-doors"), "", settings[categoryData.name].displayDoorsInputHint, defaults[categoryData.name].displayDoorsInputHint, function(state)
    settings[categoryData.name].displayDoorsInputHint = state

    settingsModified = true
    Populate_Variant_IntoSettingsMap(("%s.displayDoorsInputHint"):format(categoryData.name), state)
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-input_hints-hood_trunk_spoiler"), "", settings[categoryData.name].displaySpoilerInputHint, defaults[categoryData.name].displaySpoilerInputHint, function(state)
    settings[categoryData.name].displaySpoilerInputHint = state

    settingsModified = true
    Populate_Variant_IntoSettingsMap(("%s.displaySpoilerInputHint"):format(categoryData.name), state)
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-input_hints-windows"), "", settings[categoryData.name].displayWindowsInputHint, defaults[categoryData.name].displayWindowsInputHint, function(state)
    settings[categoryData.name].displayWindowsInputHint = state

    settingsModified = true
    Populate_Variant_IntoSettingsMap(("%s.displayWindowsInputHint"):format(categoryData.name), state)
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-input_hints-crystal_dome"), "", settings[categoryData.name].displayCrystalDomeInputHint, defaults[categoryData.name].displayCrystalDomeInputHint, function(state)
    settings[categoryData.name].displayCrystalDomeInputHint = state

    settingsModified = true
    Populate_Variant_IntoSettingsMap(("%s.displayCrystalDomeInputHint"):format(categoryData.name), state)
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-input_hints-headlights_call"), "", settings[categoryData.name].displayHeadlightsCallInputHint, defaults[categoryData.name].displayHeadlightsCallInputHint, function(state)
    settings[categoryData.name].displayHeadlightsCallInputHint = state

    settingsModified = true
    Populate_Variant_IntoSettingsMap(("%s.displayHeadlightsCallInputHint"):format(categoryData.name), state)
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-input_hints-toggle_settings"), "", settings[categoryData.name].displayToggleLightSettingsInputHint, defaults[categoryData.name].displayToggleLightSettingsInputHint, function(state)
    settings[categoryData.name].displayToggleLightSettingsInputHint = state

    settingsModified = true
    Populate_Variant_IntoSettingsMap(("%s.displayToggleLightSettingsInputHint"):format(categoryData.name), state)
  end)
end

function setup_other_CategorySetters(categoryData)
  SetupCategory(categoryData)

  nativeSettings.addRangeFloat(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-other_settings-multitap_window"), GetLocalizedTextByKey("hgyi56-EVS-settings-other_settings-multitap_window-desc"), 0.10, 1.00, 0.01, "%.2f", settings[categoryData.name].multiTapTimeWindow, defaults[categoryData.name].multiTapTimeWindow, function(value)
    settings[categoryData.name].multiTapTimeWindow = value

    settingsModified = true
    Populate_Variant_IntoSettingsMap(("%s.multiTapTimeWindow"):format(categoryData.name), value)
  end)

  nativeSettings.addRangeFloat(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-other_settings-utility_lights_hold_time"), GetLocalizedTextByKey("hgyi56-EVS-settings-other_settings-utility_lights_hold_time-desc"), 0.00, 0.20, 0.01, "%.2f", settings[categoryData.name].cycleUtilityLightsHoldTime, defaults[categoryData.name].cycleUtilityLightsHoldTime, function(value)
    settings[categoryData.name].cycleUtilityLightsHoldTime = value

    settingsModified = true
    Populate_Variant_IntoSettingsMap(("%s.cycleUtilityLightsHoldTime"):format(categoryData.name), value)
  end)
end

function notifyScriptOnSettingChange()
  Hgyi56_Enhanced_Vehicle_System_MyModSettings.Get():OnNativeUISettingsChange()
end

function setup_CategorySetters(categoryData, additional)
  additional = additional or ""

  if additional == "npc_headlights" then
    setup_npc_headlights_CategorySetters(categoryData)
  
  elseif additional == "headlights" then
    setup_headlights_CategorySetters(categoryData)

  elseif additional == "utilitylights" then
    setup_utilitylights_CategorySetters(categoryData)

  elseif additional == "rooflight" then
    setup_rooflight_CategorySetters(categoryData)

  elseif additional == "interiorlights" then
    setup_interiorlights_CategorySetters(categoryData)

  elseif additional == "power_state" then
    setup_power_state_CategorySetters(categoryData)

  elseif additional == "crystalcoat" then
    setup_crystalcoat_CategorySetters(categoryData)

  elseif additional == "crystaldome" then
    setup_crystaldome_CategorySetters(categoryData)

  elseif additional == "doors" then
    setup_doors_CategorySetters(categoryData)

  elseif additional == "spoiler" then
    setup_spoiler_CategorySetters(categoryData)

  else
    SetupCategory(categoryData)
  
    setup_light_CategorySetters(categoryData, additional)
  end
end

function ensure_profileCategory_Exist(categoryData)
  if currentProfile then
    -- Initialize the profile structure
    if profiles[currentProfile] == nil then
      profiles[currentProfile] = {}
    end

    if profiles[currentProfile][categoryData.name] == nil then
      profiles[currentProfile][categoryData.name] = {customProfileEnabled = false}
    end
  end
end

function setup_profileSwitch(categoryData, label)
  label = label or nil

  if currentProfile then
    -- Initialize a new profile if needed
    ensure_profileCategory_Exist(categoryData)

    -- Profile switch
    nativeSettings.addSwitch(leadingControlsPath, ("%s: %s"):format(label and ("%s (%s)"):format(GetLocalizedTextByKey("hgyi56-EVS-settings-profile"), label) or GetLocalizedTextByKey("hgyi56-EVS-settings-profile"), profiles[currentProfile][categoryData.name].customProfileEnabled and currentProfile or GetLocalizedTextByKey("hgyi56-EVS-settings-global")), "", profiles[currentProfile][categoryData.name].customProfileEnabled, false, function(state)
      ensure_profileCategory_Exist(categoryData)

      profiles[currentProfile][categoryData.name].customProfileEnabled = state
      SetupMenu()

      settingsModified = true
      Populate_Variant_IntoSettingsMap(("%s.%s.customProfileEnabled"):format(currentProfile, categoryData.name), state)
    end)
  end
end

function PopulateSettings(categoryData)
  if type(categoryData) == "string" then
    if not categoryData:find("^#") then
      if categoryData == "power_state" then
        setup_profileSwitch(subcategories[categoryData])
        setup_power_state_CategorySetters(subcategories[categoryData])
      elseif categoryData == "npc_headlights" then
        setup_npc_headlights_CategorySetters(subcategories[categoryData])
      elseif categoryData == "headlights" then
        setup_profileSwitch(subcategories[categoryData])
        setup_headlights_CategorySetters(subcategories[categoryData])
      elseif categoryData == "utilitylights" then
        setup_profileSwitch(subcategories[categoryData])
        setup_utilitylights_CategorySetters(subcategories[categoryData])
      elseif categoryData == "rooflight" then
        setup_profileSwitch(subcategories[categoryData], GetLocalizedTextByKey("hgyi56-EVS-settings-rooflight-cat"))
        setup_rooflight_CategorySetters(subcategories[categoryData])
      elseif categoryData == "interiorlights" then
        setup_profileSwitch(subcategories[categoryData], GetLocalizedTextByKey("hgyi56-EVS-settings-interiorlights-cat"))
        setup_interiorlights_CategorySetters(subcategories[categoryData])
      elseif categoryData == "taillights"
        or categoryData == "blinkerlights"
        or categoryData == "reverselights" then
        setup_profileSwitch(subcategories[categoryData])
        setup_CategorySetters(subcategories[categoryData])
      elseif categoryData == "crystalcoat" then
        setup_profileSwitch(subcategories[categoryData])
        setup_crystalcoat_CategorySetters(subcategories[categoryData])
      elseif categoryData == "crystaldome" then
        setup_profileSwitch(subcategories[categoryData])
        setup_crystaldome_CategorySetters(subcategories[categoryData])
      elseif categoryData == "doors" then
        setup_profileSwitch(subcategories[categoryData])
        setup_doors_CategorySetters(subcategories[categoryData])
      elseif categoryData == "spoiler" then
        setup_profileSwitch(subcategories[categoryData])
        setup_spoiler_CategorySetters(subcategories[categoryData])
      elseif categoryData == "police_lights" then
        setup_police_lights_CategorySetters(subcategories[categoryData])
      elseif categoryData == "hints" then
        setup_hints_CategorySetters(subcategories[categoryData])
      elseif categoryData == "other" then
        setup_other_CategorySetters(subcategories[categoryData])
      end
    end

  elseif type(categoryData) == "table" then
    for _, data in pairs(categoryData) do
      PopulateSettings(data)
    end
  end
end

function PopulateMenuControls(subPath)
  if not nativeSettings.pathExists(subPath) then
    nativeSettings.addSubcategory(subPath, GetLocalizedTextByKey("hgyi56-EVS-menu_controls-cat"))
  end

  local currentMenu = navStack[#navStack]

  if currentMenu == "general" then
    SpawnCustomButton(subPath, "power_state")
    SpawnCustomButton(subPath, "lights")
    SpawnCustomButton(subPath, "crystalcoat")
    SpawnCustomButton(subPath, "crystaldome")
    SpawnCustomButton(subPath, "doors")
    SpawnCustomButton(subPath, "spoiler")
    SpawnCustomButton(subPath, "police_lights")
    SpawnCustomButton(subPath, "hints")
    SpawnCustomButton(subPath, "other")
  elseif currentMenu == "lights" then
    SpawnCustomButton(subPath, "headlights")
    SpawnCustomButton(subPath, "taillights")
    SpawnCustomButton(subPath, "utilitylights")
    SpawnCustomButton(subPath, "blinkerlights")
    SpawnCustomButton(subPath, "reverselights")
    SpawnCustomButton(subPath, "interiorlights")
  end

  if #navStack > 1 then
    SpawnBackButton(subPath)
  end
end

function SetupMenu()
  if nativeSettings.pathExists(modPath) then

    for _, data in pairs(subcategories) do
      nativeSettings.removeSubcategory(data.path)
    end
    
    nativeSettings.removeSubcategory(leadingControlsPath)
    nativeSettings.removeSubcategory(trailingControlsPath)
  end

  if not nativeSettings.pathExists(modPath) then
    nativeSettings.addTab(modPath, modDisplayName)
  end

  PopulateMenuControls(leadingControlsPath)
  
  for _, k in ipairs(menuIndex[navStack[#navStack]]) do
    PopulateSettings(k)
  end

  -- Calculate the number of widgets that have been created
  local widgetCount = 0
  for subPath, _ in pairs(nativeSettings.data[modName].subcategories) do
    if subPath ~= leadingControlsName then
      widgetCount = widgetCount + #nativeSettings.data[modName].subcategories[subPath].options
    end
  end

  -- Create trailing menu controls only if more than X widgets have been created
  if widgetCount > 4 then
    PopulateMenuControls(trailingControlsPath)
  end
end

function SpawnCustomButton(subPath, subMenu)
  if not nativeSettings.pathExists(subPath) then
    nativeSettings.addSubcategory(subPath, GetLocalizedTextByKey("hgyi56-EVS-menu_controls-cat"))
  end

  nativeSettings.addButton(subPath, GetLocalizedTextByKey(("hgyi56-EVS-menu_controls-%s-label"):format(subMenu)), "", GetLocalizedTextByKey(("hgyi56-EVS-menu_controls-%s-button"):format(subMenu)), 45, function()
    table.insert(navStack, subMenu)
    ResetScrollPos()
    SetupMenu()
  end)
end

function SpawnBackButton(subPath)
  if not nativeSettings.pathExists(subPath) then
    nativeSettings.addSubcategory(subPath, GetLocalizedTextByKey("hgyi56-EVS-menu_controls-cat"))
  end

  nativeSettings.addButton(subPath, GetLocalizedTextByKey("hgyi56-EVS-menu_controls-back-label"), "", GetLocalizedTextByKey("hgyi56-EVS-menu_controls-back-button"), 45, function()
    table.remove(navStack)
    ResetScrollPos()
    SetupMenu()
  end)
end

function SetupCategory(categoryData)
  if nativeSettings.pathExists(categoryData.path) then
    -- Only remove options otherwise rebuilding the category may produce order issues
    if nativeSettings.currentTab == modName then -- Handle subcategory removing when the tab is open
      nativeSettings.saveScrollPos()
      for _, option in pairs(nativeSettings.data[modName].subcategories[categoryData.name].options) do
          inkCompoundRef.RemoveChildByName(nativeSettings.settingsOptionsList, option.widgetName)
      end
      nativeSettings.restoreScrollPos()
    end

    nativeSettings.data[modName].subcategories[categoryData.name].options = {}
  else
    nativeSettings.addSubcategory(categoryData.path, categoryData.label)
  end
end

function ResetScrollPos()
  if nativeSettings ~= nil then
    local mainScrollArea = nativeSettings.settingsMainController:GetRootWidget():GetWidget(StringToName("wrapper/wrapper/MainScrollingArea"))
    mainScrollArea:GetController():SetScrollPosition(0)
  end
end

function SaveScrollPos()
  if nativeSettings ~= nil and nativeSettings.currentTabPath == modName then
    local scrollArea = nativeSettings.settingsMainController:GetRootWidget():GetWidget(StringToName("wrapper/wrapper/MainScrollingArea/scroll_area"))
    currentScrollPos = scrollArea:GetVerticalScrollPosition() * scrollArea:GetContentSize().Y
  end
end

function RestoreScrollPos()
  if nativeSettings ~= nil and nativeSettings.currentTabPath == modName then
    nativeSettings.oldScrollPos = currentScrollPos
    nativeSettings.restoreScrollPos()
  end
end

function SetupMenuListener()
  GameUI.Listen("MenuNav", function(state)
		if state.lastSubmenu ~= nil and state.lastSubmenu == "Settings" then
      SaveTableToFile(settings, settingsFileName)
      SaveTableToFile(profiles, profilesFileName)
      SaveScrollPos()

    elseif not state.lastSubmenu and state.submenu == "Settings" then -- Mods menu opening
      UpdateCurrentVehicle()
      SetupMenu() -- Refresh current menu for the current vehicle
    end
	end)
end

function UpdateCurrentVehicle()
  local vehicle = GetPlayer():GetMountedVehicle()

  if vehicle ~= nil then
    currentProfile = vehicle:GetRecordID().value
  else
    currentProfile = nil
  end
end

function LoadJsonKeyIntoSettings(key1, key2, value)
  local intValue, enumValue, isEnum = ConvertEnumValues(key2, value)
  local mapKey = key2
  
  if not key2:find(("^%s_"):format(key1)) then
    mapKey = ("%s.%s"):format(key1, key2)
  end

  -- Force enum values to be loaded as number into the redscript map
  if isEnum then
    intValue = intValue - 1
  end

  Populate_Variant_IntoSettingsMap(mapKey, intValue)

  -- Force enum values to be loaded as string
  settings[key1][key2] = enumValue
end

function LoadSettingsFromFile()
  local validJson = false
  local file = io.open(settingsFileName, 'r')
  
  if file ~= nil then
    local contents = file:read("*a")
    local savedSettings = nil
    validJson, savedSettings = pcall(function() return json.decode(contents) end)
    file:close()

    if validJson then
      for key1, _ in pairs(settings) do
        if savedSettings[key1] ~= nil then
          for key2, _ in pairs(settings[key1]) do
            if savedSettings[key1][key2] ~= nil and key2 ~= "preset" then
              LoadJsonKeyIntoSettings(key1, key2, savedSettings[key1][key2])
            end
          end
        end
      end
    end
  end
  -- Returns true if the settings file exist and has been loaded
  return validJson
end

function LoadProfilesFromFile()
  local validJson = false
  local file = io.open(profilesFileName, 'r')
  
  if file ~= nil then
    local contents = file:read("*a")
    local savedProfiles = nil
    validJson, savedProfiles = pcall(function() return json.decode(contents) end)
    file:close()

    if validJson then
      for k_vehicle, vehData in pairs(savedProfiles) do
        for k_category, categoryData in pairs(vehData) do
          for k_setting, value in pairs(categoryData) do
            if savedProfiles[k_vehicle][k_category][k_setting] ~= nil then
              
              local intValue, enumValue, isEnum = ConvertEnumValues(k_setting, value)
              local mapKey = ("%s.%s.%s"):format(k_vehicle, k_category, k_setting)

              if k_setting:find(("^%s_"):format(k_category)) then
                mapKey = ("%s.%s"):format(k_vehicle, k_setting)
              end

              -- Force enum values to be loaded as number into the redscript map
              if isEnum then
                intValue = intValue - 1
              end

              Populate_Variant_IntoSettingsMap(mapKey, intValue)

              -- Force enum values to be loaded as string
              if profiles[k_vehicle] == nil then
                profiles[k_vehicle] = {}
              end

              if profiles[k_vehicle][k_category] == nil then
                profiles[k_vehicle][k_category] = {}
              end

              profiles[k_vehicle][k_category][k_setting] = enumValue

            end
          end
        end
      end
    end
  end
  -- Returns true if the settings file exist and has been loaded
  return validJson
end

function LoadSettingsFromTable(table)
  for key1, _ in pairs(settings) do
    if table[key1] ~= nil then
      for key2, _ in pairs(settings[key1]) do
        if table[key1][key2] ~= nil and key2 ~= "preset" then
          LoadJsonKeyIntoSettings(key1, key2, table[key1][key2])
        end
      end
    end
  end
end

function ConvertEnumValues(key, value)
  local intValue = value
  local enumValue = value
  local isEnum = false
  
  if key == "defaultHeadlightsMode" then
    intValue = ToNumber_EHeadlightsMode(value)
    enumValue = ToEnum_EHeadlightsMode(value)
    isEnum = true

  elseif key == "headlightsSynchronizedWithTimeMode" then
    intValue = ToNumber_EHeadlightsSynchronizedWithTimeMode(value)
    enumValue = ToEnum_EHeadlightsSynchronizedWithTimeMode(value)
    isEnum = true

  elseif key == "utilityLightsSynchronizedWithTimeVehicleType" then
    intValue = ToNumber_EUtilityLightsSynchronizedWithTimeVehicleType(value)
    enumValue = ToEnum_EUtilityLightsSynchronizedWithTimeVehicleType(value)
    isEnum = true

  elseif key == "defaultUtilityLightsMode" then
    intValue = ToNumber_EUtilityLightsMode(value)
    enumValue = ToEnum_EUtilityLightsMode(value)
    isEnum = true

  elseif key == "enterBehavior" then
    intValue = ToNumber_EEnterBehavior(value)
    enumValue = ToEnum_EEnterBehavior(value)
    isEnum = true

  elseif key == "exitBehavior" then
    intValue = ToNumber_EExitBehavior(value)
    enumValue = ToEnum_EExitBehavior(value)
    isEnum = true

  elseif key == "npcHeadlightsAttenuation" then
    intValue = ToNumber_ELightAttenuation(value)
    enumValue = ToEnum_ELightAttenuation(value)
    isEnum = true

  elseif key == "interiorlightsRoofLightOperatingMode" then
    intValue = ToNumber_ERoofLightOperatingMode(value)
    enumValue = ToEnum_ERoofLightOperatingMode(value)
    isEnum = true

  elseif key == "interiorlightsAutomaticTurnOn" then
    intValue = ToNumber_EInteriorLightsToggleOn(value)
    enumValue = ToEnum_EInteriorLightsToggleOn(value)
    isEnum = true

  elseif key == "interiorlightsAutomaticTurnOff" then
    intValue = ToNumber_EInteriorLightsToggleOff(value)
    enumValue = ToEnum_EInteriorLightsToggleOff(value)
    isEnum = true

  elseif key == "doorsDriveClosing" then
    intValue = ToNumber_EDoorsDriveClosing(value)
    enumValue = ToEnum_EDoorsDriveClosing(value)
    isEnum = true

  elseif key:find("_CrystalCoatColorType$") then
    intValue = ToNumber_ECrystalCoatColorType(value)
    enumValue = ToEnum_ECrystalCoatColorType(value)
    isEnum = true

  elseif key:find("_ColorSequence$") then
    intValue = ToNumber_ELightsColorCycleType(value)
    enumValue = ToEnum_ELightsColorCycleType(value)
    isEnum = true

  elseif key:find("_ImpactedVehicles$") then
    intValue = ToNumber_ELightsColorVehicleType(value)
    enumValue = ToEnum_ELightsColorVehicleType(value)
    isEnum = true
  end

  return intValue, enumValue, isEnum
end

function PopulateSettingsMap(name, object)
  local key = Hgyi56_Enhanced_Vehicle_System_Key.Build(name)

  if Hgyi56_Enhanced_Vehicle_System_MyModSettings.Get().map:KeyExist(key) then
    Hgyi56_Enhanced_Vehicle_System_MyModSettings.Get().map:Set(key, object)
  else
    Hgyi56_Enhanced_Vehicle_System_MyModSettings.Get().map:Insert(key, object)
  end
end

function Populate_Variant_IntoSettingsMap(name, value)
  local variant = nil
  local redsDataType = nil
  
  for pattern, dataType in pairs(fieldForcedTypes) do
    if name:find(pattern) then
      redsDataType = dataType
      break
    end
  end

  local authorizedDataTypes = {"Bool", "String", "Int32", "Float"}
  if redsDataType then
    local valid = false
    for _, dtype in pairs(authorizedDataTypes) do
      if redsDataType == dtype then
        valid = true
        break
      end
    end

    if not valid then
      print("ERROR: unhandled specified map type:", redsDataType, "for key:", name)
      return
    end

    variant = ToVariant(value, redsDataType)
  else
    if type(value) == "boolean" then
      variant = ToVariant(value, "Bool")

    elseif type(value) == "number" then
      if value % 1 == 0 then -- integer
        variant = ToVariant(value, "Int32")
      else -- float
        variant = ToVariant(value, "Float")
      end

    elseif type(value) == "string" then
      variant = ToVariant(value, "String")

    else
      print("ERROR: unhandled map type:", type(value), "for key:", name)
      return
    end
  end

  local wrapper = Hgyi56_Enhanced_Vehicle_System_VariantWrapper.Create(variant)

  PopulateSettingsMap(name, wrapper)
end

function SaveTableToFile(tableObj, filePath)
  local validJson, contents = pcall(function() return json.encode(tableObj) end)
  
  if validJson and contents ~= nil then
    contents = PrettifyJson(contents)
    local file = io.open(filePath, "w+")
    file:write(contents)
    file:close()
  end
end

function Deepcopy(orig)
  local orig_type = type(orig)
  local copy
  if orig_type == 'table' then
      copy = {}
      for orig_key, orig_value in next, orig, nil do
          copy[Deepcopy(orig_key)] = Deepcopy(orig_value)
      end
      setmetatable(copy, Deepcopy(getmetatable(orig)))
  else -- number, string, boolean, etc
      copy = orig
  end
  return copy
end

function PrettifyJson(data)
  local prettyJSON = data
  
  if RedData_Json_ParseJson ~= nil then
    local jsonData = RedData_Json_ParseJson(data)
    prettyJSON = jsonData:ToString("  ")
  end

  return prettyJSON
end
