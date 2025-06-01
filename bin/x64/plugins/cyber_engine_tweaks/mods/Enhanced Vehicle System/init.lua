local hgyi56_EVS = {
  settings = require('settings'),
  GameUI = require('GameUI'),
  
  defaults = {},
  currentScrollPos = 0,
  
  modName = "hgyi56_EVS",  
  leadingControlsName = "leading_controls",
  trailingControlsName = "trailing_controls",

  modDisplayName = "EVS",
  settingsFileName = "settings.json",
  
  navStack = {"general"},
  menuIndex = {
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
      "#interiorlights",
      "lights"
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
  },
  
  subcategories = {}
}

local nativeSettings = {}

function hgyi56_EVS.table_invert(t)
  local s = {}

  for k, v in pairs(t) do
    s[v] = k
  end

  return s
end

function hgyi56_EVS.table_copy(t)
  local t2 = {}
  for k, v in pairs(t) do
    t2[k] = v
  end
  return t2
end

---- ENUM CONVERSION ----

function hgyi56_EVS.ToNumber_EHeadlightsMode(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = hgyi56_EVS.EHeadlightsMode_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type EHeadlightsMode"):format(value))
    end
    return newValue
  end
end

function hgyi56_EVS.ToEnum_EHeadlightsMode(value)
  if type(value) == "number" then
    newValue = hgyi56_EVS.EHeadlightsMode_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type EHeadlightsMode"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function hgyi56_EVS.ToNumber_EHeadlightsSynchronizedWithTimeMode(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = hgyi56_EVS.EHeadlightsSynchronizedWithTimeMode_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type EHeadlightsSynchronizedWithTimeMode"):format(value))
    end
    return newValue
  end
end

function hgyi56_EVS.ToEnum_EHeadlightsSynchronizedWithTimeMode(value)
  if type(value) == "number" then
    newValue = hgyi56_EVS.EHeadlightsSynchronizedWithTimeMode_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type EHeadlightsSynchronizedWithTimeMode"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function hgyi56_EVS.ToNumber_EUtilityLightsSynchronizedWithTimeVehicleType(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = hgyi56_EVS.EUtilityLightsSynchronizedWithTimeVehicleType_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type EUtilityLightsSynchronizedWithTimeVehicleType"):format(value))
    end
    return newValue
  end
end

function hgyi56_EVS.ToEnum_EUtilityLightsSynchronizedWithTimeVehicleType(value)
  if type(value) == "number" then
    newValue = hgyi56_EVS.EUtilityLightsSynchronizedWithTimeVehicleType_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type EUtilityLightsSynchronizedWithTimeVehicleType"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function hgyi56_EVS.ToNumber_EUtilityLightsMode(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = hgyi56_EVS.EUtilityLightsMode_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type EUtilityLightsMode"):format(value))
    end
    return newValue
  end
end

function hgyi56_EVS.ToEnum_EUtilityLightsMode(value)
  if type(value) == "number" then
    newValue = hgyi56_EVS.EUtilityLightsMode_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type EUtilityLightsMode"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function hgyi56_EVS.ToNumber_ELightsColorVehicleType(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = hgyi56_EVS.ELightsColorVehicleType_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type ELightsColorVehicleType"):format(value))
    end
    return newValue
  end
end

function hgyi56_EVS.ToEnum_ELightsColorVehicleType(value)
  if type(value) == "number" then
    newValue = hgyi56_EVS.ELightsColorVehicleType_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type ELightsColorVehicleType"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function hgyi56_EVS.ToNumber_ELightsColorCycleType(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = hgyi56_EVS.ELightsColorCycleType_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type ELightsColorCycleType"):format(value))
    end
    return newValue
  end
end

function hgyi56_EVS.ToEnum_ELightsColorCycleType(value)
  if type(value) == "number" then
    newValue = hgyi56_EVS.ELightsColorCycleType_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type ELightsColorCycleType"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function hgyi56_EVS.ToNumber_ECrystalCoatColorType(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = hgyi56_EVS.ECrystalCoatColorType_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type ECrystalCoatColorType"):format(value))
    end
    return newValue
  end
end

function hgyi56_EVS.ToEnum_ECrystalCoatColorType(value)
  if type(value) == "number" then
    newValue = hgyi56_EVS.ECrystalCoatColorType_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type ECrystalCoatColorType"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function hgyi56_EVS.ToNumber_EEnterBehavior(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = hgyi56_EVS.EEnterBehavior_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type EEnterBehavior"):format(value))
    end
    return newValue
  end
end

function hgyi56_EVS.ToEnum_EEnterBehavior(value)
  if type(value) == "number" then
    newValue = hgyi56_EVS.EEnterBehavior_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type EEnterBehavior"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function hgyi56_EVS.ToNumber_EExitBehavior(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = hgyi56_EVS.EExitBehavior_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type EExitBehavior"):format(value))
    end
    return newValue
  end
end

function hgyi56_EVS.ToEnum_EExitBehavior(value)
  if type(value) == "number" then
    newValue = hgyi56_EVS.EExitBehavior_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type EExitBehavior"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function hgyi56_EVS.ToNumber_EDoorsDriveClosing(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = hgyi56_EVS.EDoorsDriveClosing_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type EDoorsDriveClosing"):format(value))
    end
    return newValue
  end
end

function hgyi56_EVS.ToEnum_EDoorsDriveClosing(value)
  if type(value) == "number" then
    newValue = hgyi56_EVS.EDoorsDriveClosing_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type EDoorsDriveClosing"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function hgyi56_EVS.ToNumber_ERoofLightOperatingMode(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = hgyi56_EVS.ERoofLightOperatingMode_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type ERoofLightOperatingMode"):format(value))
    end
    return newValue
  end
end

function hgyi56_EVS.ToEnum_ERoofLightOperatingMode(value)
  if type(value) == "number" then
    newValue = hgyi56_EVS.ERoofLightOperatingMode_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type ERoofLightOperatingMode"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function hgyi56_EVS.ToNumber_EInteriorLightsToggleOff(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = hgyi56_EVS.EInteriorLightsToggleOff_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type EInteriorLightsToggleOff"):format(value))
    end
    return newValue
  end
end

function hgyi56_EVS.ToEnum_EInteriorLightsToggleOff(value)
  if type(value) == "number" then
    newValue = hgyi56_EVS.EInteriorLightsToggleOff_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type EInteriorLightsToggleOff"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function hgyi56_EVS.ToNumber_EInteriorLightsToggleOn(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = hgyi56_EVS.EInteriorLightsToggleOn_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type EInteriorLightsToggleOn"):format(value))
    end
    return newValue
  end
end

function hgyi56_EVS.ToEnum_EInteriorLightsToggleOn(value)
  if type(value) == "number" then
    newValue = hgyi56_EVS.EInteriorLightsToggleOn_enum[value]
    if newValue == nil then
      print(("'%d' is not a valid enum index for type EInteriorLightsToggleOn"):format(value))
    end
    return newValue
  elseif type(value) == "string" then
    return value
  end
end

function hgyi56_EVS.ToNumber_ELightAttenuation(value)
  if type(value) == "number" then
    return value
  elseif type(value) == "string" then
    newValue = hgyi56_EVS.ELightAttenuation_enum_reversed[value]
    if newValue == nil then
      print(("'%s' is not a valid enum value for type ELightAttenuation"):format(value))
    end
    return newValue
  end
end

function hgyi56_EVS.ToEnum_ELightAttenuation(value)
  if type(value) == "number" then
    newValue = hgyi56_EVS.ELightAttenuation_enum[value]
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

  hgyi56_EVS.modPath = "/" .. hgyi56_EVS.modName  
  hgyi56_EVS.leadingControlsPath = hgyi56_EVS.modPath .. "/" .. hgyi56_EVS.leadingControlsName
  hgyi56_EVS.trailingControlsPath = hgyi56_EVS.modPath .. "/" .. hgyi56_EVS.trailingControlsName

  hgyi56_EVS.subcategories = {
    power_state = {name = "power_state", path = hgyi56_EVS.modPath.."/power_state", label = "hgyi56-EVS-settings-power_state-cat"},
    lights = {name = "lights", path = hgyi56_EVS.modPath.."/lights", label = "hgyi56-EVS-settings-lights-cat"},
    npc_headlights = {name = "npc_headlights", path = hgyi56_EVS.modPath.."/npc_headlights", label = "hgyi56-EVS-settings-npc_headlights-cat"},
    headlights = {name = "headlights", path = hgyi56_EVS.modPath.."/headlights", label = "hgyi56-EVS-settings-headlights-cat"},
    taillights = {name = "taillights", path = hgyi56_EVS.modPath.."/taillights", label = "hgyi56-EVS-settings-taillights-cat"},
    utilitylights = {name = "utilitylights", path = hgyi56_EVS.modPath.."/utilitylights", label = "hgyi56-EVS-settings-utilitylights-cat"},
    blinkerlights = {name = "blinkerlights", path = hgyi56_EVS.modPath.."/blinkerlights", label = "hgyi56-EVS-settings-blinkerlights-cat"},
    reverselights = {name = "reverselights", path = hgyi56_EVS.modPath.."/reverselights", label = "hgyi56-EVS-settings-reverselights-cat"},
    rooflight = {name = "rooflight", path = hgyi56_EVS.modPath.."/rooflight", label = "hgyi56-EVS-settings-rooflight-cat"},
    interiorlights = {name = "interiorlights", path = hgyi56_EVS.modPath.."/interiorlights", label = "hgyi56-EVS-settings-interiorlights-cat"},
    crystalcoat = {name = "crystalcoat", path = hgyi56_EVS.modPath.."/crystalcoat", label = "hgyi56-EVS-settings-crystalcoat-cat"},
    crystaldome = {name = "crystaldome", path = hgyi56_EVS.modPath.."/crystaldome", label = "hgyi56-EVS-settings-crystaldome-cat"},
    doors = {name = "doors", path = hgyi56_EVS.modPath.."/doors", label = "hgyi56-EVS-settings-doors-cat"},
    spoiler = {name = "spoiler", path = hgyi56_EVS.modPath.."/spoiler", label = "hgyi56-EVS-settings-spoiler-cat"},
    police_lights = {name = "police_lights", path = hgyi56_EVS.modPath.."/police_lights", label = "hgyi56-EVS-settings-police_lights-cat"},
    hints = {name = "hints", path = hgyi56_EVS.modPath.."/hints", label = "hgyi56-EVS-settings-input_hints-cat"},
    other = {name = "other", path = hgyi56_EVS.modPath.."/other", label = "hgyi56-EVS-settings-other_settings-cat"}
  }

  hgyi56_EVS.defaults = hgyi56_EVS.Deepcopy(hgyi56_EVS.settings)

  hgyi56_EVS.EHeadlightsMode_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-off"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-low_beam"),
    [3] = GetLocalizedTextByKey("hgyi56-EVS-enum-high_beam")
  }
  hgyi56_EVS.EHeadlightsMode_enum = {
    [1] = "Off",
    [2] = "LowBeam",
    [3] = "HighBeam"
  }
  hgyi56_EVS.EHeadlightsMode_enum_reversed = hgyi56_EVS.table_invert(hgyi56_EVS.EHeadlightsMode_enum)
  
  hgyi56_EVS.EHeadlightsSynchronizedWithTimeMode_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-low_beam"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-high_beam")
  }
  hgyi56_EVS.EHeadlightsSynchronizedWithTimeMode_enum = {
    [1] = "LowBeam",
    [2] = "HighBeam"
  }
  hgyi56_EVS.EHeadlightsSynchronizedWithTimeMode_enum_reversed = hgyi56_EVS.table_invert(hgyi56_EVS.EHeadlightsSynchronizedWithTimeMode_enum)

  hgyi56_EVS.EUtilityLightsSynchronizedWithTimeVehicleType_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-no"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-motorcycles"),
    [3] = GetLocalizedTextByKey("hgyi56-EVS-enum-all_vehicles")
  }
  hgyi56_EVS.EUtilityLightsSynchronizedWithTimeVehicleType_enum = {
    [1] = "No",
    [2] = "Motorcycles",
    [3] = "AllVehicles"
  }
  hgyi56_EVS.EUtilityLightsSynchronizedWithTimeVehicleType_enum_reversed = hgyi56_EVS.table_invert(hgyi56_EVS.EUtilityLightsSynchronizedWithTimeVehicleType_enum)

  hgyi56_EVS.EUtilityLightsMode_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-off"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-active_for_motorcycles"),
    [3] = GetLocalizedTextByKey("hgyi56-EVS-enum-active_for_all_vehicles")
  }
  hgyi56_EVS.EUtilityLightsMode_enum = {
    [1] = "Off",
    [2] = "MotorcyclesActive",
    [3] = "AllVehiclesActive"
  }
  hgyi56_EVS.EUtilityLightsMode_enum_reversed = hgyi56_EVS.table_invert(hgyi56_EVS.EUtilityLightsMode_enum)
  
  hgyi56_EVS.ELightsColorVehicleType_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-motorcycles"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-all_vehicles")
  }
  hgyi56_EVS.ELightsColorVehicleType_enum = {
    [1] = "Motorcycles",
    [2] = "AllVehicles"
  }
  hgyi56_EVS.ELightsColorVehicleType_enum_reversed = hgyi56_EVS.table_invert(hgyi56_EVS.ELightsColorVehicleType_enum)
  
  hgyi56_EVS.ELightsColorCycleType_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-solid"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-blinker"),
    [3] = GetLocalizedTextByKey("hgyi56-EVS-enum-beacon"),
    [4] = GetLocalizedTextByKey("hgyi56-EVS-enum-pulse"),
    [5] = GetLocalizedTextByKey("hgyi56-EVS-enum-two_colors_cycle"),
    [6] = GetLocalizedTextByKey("hgyi56-EVS-enum-rainbow")
  }
  hgyi56_EVS.ELightsColorCycleType_enum = {
    [1] = "Solid",
    [2] = "Blinker",
    [3] = "Beacon",
    [4] = "Pulse",
    [5] = "TwoColorsCycle",
    [6] = "Rainbow"
  }
  hgyi56_EVS.ELightsColorCycleType_enum_reversed = hgyi56_EVS.table_invert(hgyi56_EVS.ELightsColorCycleType_enum)

  hgyi56_EVS.ECrystalCoatColorType_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-primary"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-secondary"),
    [3] = GetLocalizedTextByKey("hgyi56-EVS-enum-lights")
  }
  hgyi56_EVS.ECrystalCoatColorType_enum = {
    [1] = "Primary",
    [2] = "Secondary",
    [3] = "Lights"
  }
  hgyi56_EVS.ECrystalCoatColorType_enum_reversed = hgyi56_EVS.table_invert(hgyi56_EVS.ECrystalCoatColorType_enum)
  
  hgyi56_EVS.EEnterBehavior_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-keep_current_state"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-power_on"),
    [3] = GetLocalizedTextByKey("hgyi56-EVS-enum-start_engine")
  }
  hgyi56_EVS.EEnterBehavior_enum = {
    [1] = "KeepCurrentState",
    [2] = "PowerOn",
    [3] = "StartEngine"
  }
  hgyi56_EVS.EEnterBehavior_enum_reversed = hgyi56_EVS.table_invert(hgyi56_EVS.EEnterBehavior_enum)
  
  hgyi56_EVS.EExitBehavior_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-keep_current_state"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-stop_engine"),
    [3] = GetLocalizedTextByKey("hgyi56-EVS-enum-power_off")
  }
  hgyi56_EVS.EExitBehavior_enum = {
    [1] = "KeepCurrentState",
    [2] = "StopEngine",
    [3] = "PowerOff"
  }
  hgyi56_EVS.EExitBehavior_enum_reversed = hgyi56_EVS.table_invert(hgyi56_EVS.EExitBehavior_enum)
  
  hgyi56_EVS.EDoorsDriveClosing_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-no"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-on_start_moving"),
    [3] = GetLocalizedTextByKey("hgyi56-EVS-enum-custom_speed")
  }
  hgyi56_EVS.EDoorsDriveClosing_enum = {
    [1] = "No",
    [2] = "OnStartMoving",
    [3] = "CustomSpeed"
  }
  hgyi56_EVS.EDoorsDriveClosing_enum_reversed = hgyi56_EVS.table_invert(hgyi56_EVS.EDoorsDriveClosing_enum)
  
  hgyi56_EVS.ERoofLightOperatingMode_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-temporary"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-fixed")
  }
  hgyi56_EVS.ERoofLightOperatingMode_enum = {
    [1] = "Temporary",
    [2] = "Fixed"
  }
  hgyi56_EVS.ERoofLightOperatingMode_enum_reversed = hgyi56_EVS.table_invert(hgyi56_EVS.ERoofLightOperatingMode_enum)
  
  hgyi56_EVS.EInteriorLightsToggleOff_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-on_power_off"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-on_exit")
  }
  hgyi56_EVS.EInteriorLightsToggleOff_enum = {
    [1] = "OnPowerOff",
    [2] = "OnExit"
  }
  hgyi56_EVS.EInteriorLightsToggleOff_enum_reversed = hgyi56_EVS.table_invert(hgyi56_EVS.EInteriorLightsToggleOff_enum)
  
  hgyi56_EVS.EInteriorLightsToggleOn_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-manual"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-on_enter"),
    [3] = GetLocalizedTextByKey("hgyi56-EVS-enum-on_power_on")
  }
  hgyi56_EVS.EInteriorLightsToggleOn_enum = {
    [1] = "Manual",
    [2] = "OnEnter",
    [3] = "OnPowerOn"
  }
  hgyi56_EVS.EInteriorLightsToggleOn_enum_reversed = hgyi56_EVS.table_invert(hgyi56_EVS.EInteriorLightsToggleOn_enum)
  
  hgyi56_EVS.ELightAttenuation_values = {
    [1] = GetLocalizedTextByKey("hgyi56-EVS-enum-linear"),
    [2] = GetLocalizedTextByKey("hgyi56-EVS-enum-inverse_square")
  }
  hgyi56_EVS.ELightAttenuation_enum = {
    [1] = "Linear",
    [2] = "InverseSquare"
  }
  hgyi56_EVS.ELightAttenuation_enum_reversed = hgyi56_EVS.table_invert(hgyi56_EVS.ELightAttenuation_enum)
  
  hgyi56_EVS.LoadSettings()

  -- Override redscript getters
  for _, menu in pairs(hgyi56_EVS.menuIndex) do
    hgyi56_EVS.CreateGettersOverride(menu)
  end

  hgyi56_EVS.SetupMenuListener()

  if nativeSettings ~= nil then
    hgyi56_EVS.SetupMenu()
  end
  
  -- Required to load vehicle sounds on assembly
  hgyi56_EVS.notifyScriptOnSettingChange()

  -- On menu open
  ObserveBefore("SettingsMainGameController", "PopulateCategorySettingsOptions", function (self, idx)
    if nativeSettings.fromMods and nativeSettings.tabSizeCache then
      hgyi56_EVS.SaveScrollPos()
    end
  end)
  ObserveAfter("SettingsMainGameController", "PopulateCategorySettingsOptions", function (self, idx)
    if nativeSettings.fromMods and nativeSettings.tabSizeCache then
      hgyi56_EVS.RestoreScrollPos()
    end
  end)

  -- On menu close
  ObserveAfter("SettingsMainGameController", "RequestClose", function (self)
    hgyi56_EVS.notifyScriptOnSettingChange()
  end)
end)

function hgyi56_EVS.CreateGettersOverride(categoryData)
  if type(categoryData) == "string" then
    if categoryData:find("^#") then
      local menuItem = categoryData:gsub("#", "")
      hgyi56_EVS.CreateGettersOverride(hgyi56_EVS.menuIndex[menuItem])
    else
      if categoryData == "power_state" then
        hgyi56_EVS.setup_power_state_CategoryGetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "lights" then
        hgyi56_EVS.setup_lights_CategoryGetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "npc_headlights" then
        hgyi56_EVS.setup_npc_headlights_CategoryGetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "headlights" then
        hgyi56_EVS.setup_headlights_CategoryGetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "utilitylights" then
        hgyi56_EVS.setup_utilitylights_CategoryGetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "rooflight" then
        hgyi56_EVS.setup_rooflight_CategoryGetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "interiorlights" then
        hgyi56_EVS.setup_interiorlights_CategoryGetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "taillights"
        or categoryData == "blinkerlights"
        or categoryData == "reverselights" then
        hgyi56_EVS.setup_light_CategoryGetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "crystalcoat" then
        hgyi56_EVS.setup_crystalcoat_CategoryGetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "crystaldome" then
        hgyi56_EVS.setup_crystaldome_CategoryGetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "doors" then
        hgyi56_EVS.setup_doors_CategoryGetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "spoiler" then
        hgyi56_EVS.setup_spoiler_CategoryGetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "police_lights" then
        hgyi56_EVS.setup_police_lights_CategoryGetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "hints" then
        hgyi56_EVS.setup_hints_CategoryGetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "other" then
        hgyi56_EVS.setup_other_CategoryGetters(hgyi56_EVS.subcategories[categoryData])
      end
    end

  elseif type(categoryData) == "table" then
    for _, data in pairs(categoryData) do
      hgyi56_EVS.CreateGettersOverride(data)
    end
  end
end

function hgyi56_EVS.setup_power_state_CategoryGetters(categoryData)
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "enterBehavior", function(self, wrappedMethod)
    return hgyi56_EVS.ToNumber_EEnterBehavior(hgyi56_EVS.settings[categoryData.name].enterBehavior) - 1
  end)
  
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "exitBehavior", function(self, wrappedMethod)
    return hgyi56_EVS.ToNumber_EExitBehavior(hgyi56_EVS.settings[categoryData.name].exitBehavior) - 1
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "preventPowerOffDuringCombat", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].preventPowerOffDuringCombat
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "autoStartEngineDuringCombat", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].autoStartEngineDuringCombat
  end)
end

function hgyi56_EVS.setup_power_state_CategorySetters(categoryData)
  hgyi56_EVS.SetupCategory(categoryData)

  nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-power_state-on_enter"), GetLocalizedTextByKey("hgyi56-EVS-settings-power_state-on_enter-desc"), hgyi56_EVS.EEnterBehavior_values, hgyi56_EVS.ToNumber_EEnterBehavior(hgyi56_EVS.settings[categoryData.name].enterBehavior), hgyi56_EVS.ToNumber_EEnterBehavior(hgyi56_EVS.defaults[categoryData.name].enterBehavior), function(value)
    hgyi56_EVS.settings[categoryData.name].enterBehavior = hgyi56_EVS.ToEnum_EEnterBehavior(value)
  end)

  nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-power_state-on_exit"), GetLocalizedTextByKey("hgyi56-EVS-settings-power_state-on_exit-desc"), hgyi56_EVS.EExitBehavior_values, hgyi56_EVS.ToNumber_EExitBehavior(hgyi56_EVS.settings[categoryData.name].exitBehavior), hgyi56_EVS.ToNumber_EExitBehavior(hgyi56_EVS.defaults[categoryData.name].exitBehavior), function(value)
    hgyi56_EVS.settings[categoryData.name].exitBehavior = hgyi56_EVS.ToEnum_EExitBehavior(value)
  end)
  
  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-power_state-prevent_shutdown"), GetLocalizedTextByKey("hgyi56-EVS-settings-power_state-prevent_shutdown-desc"), hgyi56_EVS.settings[categoryData.name].preventPowerOffDuringCombat, hgyi56_EVS.defaults[categoryData.name].preventPowerOffDuringCombat, function(state)
    hgyi56_EVS.settings[categoryData.name].preventPowerOffDuringCombat = state
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-power_state-autostart_combat"), GetLocalizedTextByKey("hgyi56-EVS-settings-power_state-autostart_combat-desc"), hgyi56_EVS.settings[categoryData.name].autoStartEngineDuringCombat, hgyi56_EVS.defaults[categoryData.name].autoStartEngineDuringCombat, function(state)
    hgyi56_EVS.settings[categoryData.name].autoStartEngineDuringCombat = state
  end)
end

function hgyi56_EVS.setup_lights_CategoryGetters(categoryData)
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "autoResetLightColorEnabled", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].autoResetLightColorEnabled
  end)
end

function hgyi56_EVS.setup_lights_CategorySetters(categoryData)
  hgyi56_EVS.SetupCategory(categoryData)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-lights-auto_reset_light_color"), GetLocalizedTextByKey("hgyi56-EVS-settings-lights-auto_reset_light_color-desc"), hgyi56_EVS.settings[categoryData.name].autoResetLightColorEnabled, hgyi56_EVS.defaults[categoryData.name].autoResetLightColorEnabled, function(state)
    hgyi56_EVS.settings[categoryData.name].autoResetLightColorEnabled = state
  end)
end

function hgyi56_EVS.setup_npc_headlights_CategoryGetters(categoryData)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "npcHeadlightsOverride", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].npcHeadlightsOverride
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "npcHeadlightsRadiusMultiplier", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].npcHeadlightsRadiusMultiplier
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "npcHeadlightsIntensityMultiplier", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].npcHeadlightsIntensityMultiplier
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "npcHeadlightsAttenuation", function(self, wrappedMethod)
    return hgyi56_EVS.ToNumber_ELightAttenuation(hgyi56_EVS.settings[categoryData.name].npcHeadlightsAttenuation) - 1
  end)
end

function hgyi56_EVS.setup_npc_headlights_CategorySetters(categoryData)
  hgyi56_EVS.SetupCategory(categoryData)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-npc_headlights-override"), "", hgyi56_EVS.settings[categoryData.name].npcHeadlightsOverride, hgyi56_EVS.defaults[categoryData.name].npcHeadlightsOverride, function(state)
    hgyi56_EVS.settings[categoryData.name].npcHeadlightsOverride = state
    
    hgyi56_EVS.setup_CategorySetters(categoryData, "npc_headlights")
  end)

  if hgyi56_EVS.settings[categoryData.name].npcHeadlightsOverride then
    nativeSettings.addRangeFloat(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-npc_headlights-radius_multiplier"), GetLocalizedTextByKey("hgyi56-EVS-settings-delayed_effect-desc"), 0.0, 10.0, 0.1, "%.1f", hgyi56_EVS.settings[categoryData.name].npcHeadlightsRadiusMultiplier, hgyi56_EVS.defaults[categoryData.name].npcHeadlightsRadiusMultiplier, function(value)
      hgyi56_EVS.settings[categoryData.name].npcHeadlightsRadiusMultiplier = value
    end)
    
    nativeSettings.addRangeFloat(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-npc_headlights-intensity_multiplier"), GetLocalizedTextByKey("hgyi56-EVS-settings-delayed_effect-desc"), 0.0, 10.0, 0.1, "%.1f", hgyi56_EVS.settings[categoryData.name].npcHeadlightsIntensityMultiplier, hgyi56_EVS.defaults[categoryData.name].npcHeadlightsIntensityMultiplier, function(value)
      hgyi56_EVS.settings[categoryData.name].npcHeadlightsIntensityMultiplier = value
    end)

    nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-npc_headlights-attenuation"), GetLocalizedTextByKey("hgyi56-EVS-settings-delayed_effect-desc"), hgyi56_EVS.ELightAttenuation_values, hgyi56_EVS.ToNumber_ELightAttenuation(hgyi56_EVS.settings[categoryData.name].npcHeadlightsAttenuation), hgyi56_EVS.ToNumber_ELightAttenuation(hgyi56_EVS.defaults[categoryData.name].npcHeadlightsAttenuation), function(value)
      hgyi56_EVS.settings[categoryData.name].npcHeadlightsAttenuation = hgyi56_EVS.ToEnum_ELightAttenuation(value)
    end)
  end
end

function hgyi56_EVS.setup_headlights_CategoryGetters(categoryData)
  
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "headlightsSynchronizedWithTimeEnabled", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].headlightsSynchronizedWithTimeEnabled
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "defaultHeadlightsMode", function(self, wrappedMethod)
    return hgyi56_EVS.ToNumber_EHeadlightsMode(hgyi56_EVS.settings[categoryData.name].defaultHeadlightsMode) - 1
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "headlightsSynchronizedWithTimeMode", function(self, wrappedMethod)
    return hgyi56_EVS.ToNumber_EHeadlightsSynchronizedWithTimeMode(hgyi56_EVS.settings[categoryData.name].headlightsSynchronizedWithTimeMode) - 1
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "utilityLightsSynchronizedWithTimeVehicleType", function(self, wrappedMethod)
    return hgyi56_EVS.ToNumber_EUtilityLightsSynchronizedWithTimeVehicleType(hgyi56_EVS.settings[categoryData.name].utilityLightsSynchronizedWithTimeVehicleType) - 1
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "headlightsTurnOnHour", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].headlightsTurnOnHour
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "headlightsTurnOnMinute", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].headlightsTurnOnMinute
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "headlightsTurnOffHour", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].headlightsTurnOffHour
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "headlightsTurnOffMinute", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].headlightsTurnOffMinute
  end)

  hgyi56_EVS.setup_light_CategoryGetters(categoryData)
end

function hgyi56_EVS.setup_headlights_CategorySetters(categoryData)
  hgyi56_EVS.SetupCategory(categoryData)
  
  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-headlights-sync"), GetLocalizedTextByKey("hgyi56-EVS-settings-headlights-sync-desc"), hgyi56_EVS.settings[categoryData.name].headlightsSynchronizedWithTimeEnabled, hgyi56_EVS.defaults[categoryData.name].headlightsSynchronizedWithTimeEnabled, function(state)
    hgyi56_EVS.settings[categoryData.name].headlightsSynchronizedWithTimeEnabled = state
    
    hgyi56_EVS.setup_CategorySetters(categoryData, "headlights")
  end)

  if hgyi56_EVS.settings[categoryData.name].headlightsSynchronizedWithTimeEnabled then

    nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-headlights-night_mode"), GetLocalizedTextByKey("hgyi56-EVS-settings-headlights-night_mode-desc"), hgyi56_EVS.EHeadlightsSynchronizedWithTimeMode_values, hgyi56_EVS.ToNumber_EHeadlightsSynchronizedWithTimeMode(hgyi56_EVS.settings[categoryData.name].headlightsSynchronizedWithTimeMode), hgyi56_EVS.ToNumber_EHeadlightsSynchronizedWithTimeMode(hgyi56_EVS.defaults[categoryData.name].headlightsSynchronizedWithTimeMode), function(value)
      hgyi56_EVS.settings[categoryData.name].headlightsSynchronizedWithTimeMode = hgyi56_EVS.ToEnum_EHeadlightsSynchronizedWithTimeMode(value)
    end)

    nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-headlights-include_utility_lights"), GetLocalizedTextByKey("hgyi56-EVS-settings-headlights-include_utility_lights-desc"), hgyi56_EVS.EUtilityLightsSynchronizedWithTimeVehicleType_values, hgyi56_EVS.ToNumber_EUtilityLightsSynchronizedWithTimeVehicleType(hgyi56_EVS.settings[categoryData.name].utilityLightsSynchronizedWithTimeVehicleType), hgyi56_EVS.ToNumber_EUtilityLightsSynchronizedWithTimeVehicleType(hgyi56_EVS.defaults[categoryData.name].utilityLightsSynchronizedWithTimeVehicleType), function(value)
      hgyi56_EVS.settings[categoryData.name].utilityLightsSynchronizedWithTimeVehicleType = hgyi56_EVS.ToEnum_EUtilityLightsSynchronizedWithTimeVehicleType(value)
    end)

    nativeSettings.addRangeInt(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-headlights-turn_on_hour"), "", 0, 23, 1, hgyi56_EVS.settings[categoryData.name].headlightsTurnOnHour, hgyi56_EVS.defaults[categoryData.name].headlightsTurnOnHour, function(value)
      hgyi56_EVS.settings[categoryData.name].headlightsTurnOnHour = value
    end)

    nativeSettings.addRangeInt(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-headlights-turn_on_minute"), "", 0, 59, 1, hgyi56_EVS.settings[categoryData.name].headlightsTurnOnMinute, hgyi56_EVS.defaults[categoryData.name].headlightsTurnOnMinute, function(value)
      hgyi56_EVS.settings[categoryData.name].headlightsTurnOnMinute = value
    end)

    nativeSettings.addRangeInt(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-headlights-turn_off_hour"), "", 0, 23, 1, hgyi56_EVS.settings[categoryData.name].headlightsTurnOffHour, hgyi56_EVS.defaults[categoryData.name].headlightsTurnOffHour, function(value)
      hgyi56_EVS.settings[categoryData.name].headlightsTurnOffHour = value
    end)

    nativeSettings.addRangeInt(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-headlights-turn_off_minute"), "", 0, 59, 1, hgyi56_EVS.settings[categoryData.name].headlightsTurnOffMinute, hgyi56_EVS.defaults[categoryData.name].headlightsTurnOffMinute, function(value)
      hgyi56_EVS.settings[categoryData.name].headlightsTurnOffMinute = value
    end)

  else
    nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-default_mode"), GetLocalizedTextByKey("hgyi56-EVS-settings-headlights-default_mode-desc"), hgyi56_EVS.EHeadlightsMode_values, hgyi56_EVS.ToNumber_EHeadlightsMode(hgyi56_EVS.settings[categoryData.name].defaultHeadlightsMode), hgyi56_EVS.ToNumber_EHeadlightsMode(hgyi56_EVS.defaults[categoryData.name].defaultHeadlightsMode), function(value)
      hgyi56_EVS.settings[categoryData.name].defaultHeadlightsMode = hgyi56_EVS.ToEnum_EHeadlightsMode(value)
    end)
  end

  hgyi56_EVS.setup_light_CategorySetters(categoryData, "headlights")
end

function hgyi56_EVS.setup_utilitylights_CategoryGetters(categoryData)
  
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "utilityLightsSynchronizedWithHeadlightsShutoff", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].utilityLightsSynchronizedWithHeadlightsShutoff
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "defaultUtilityLightsMode", function(self, wrappedMethod)
    return hgyi56_EVS.ToNumber_EUtilityLightsMode(hgyi56_EVS.settings[categoryData.name].defaultUtilityLightsMode) - 1
  end)

  hgyi56_EVS.setup_light_CategoryGetters(categoryData)
end

function hgyi56_EVS.setup_utilitylights_CategorySetters(categoryData)
  hgyi56_EVS.SetupCategory(categoryData)
  
  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-utilitylights-sync_with_shutoff"), GetLocalizedTextByKey("hgyi56-EVS-settings-utilitylights-sync_with_shutoff-desc"), hgyi56_EVS.settings[categoryData.name].utilityLightsSynchronizedWithHeadlightsShutoff, hgyi56_EVS.defaults[categoryData.name].utilityLightsSynchronizedWithHeadlightsShutoff, function(state)
    hgyi56_EVS.settings[categoryData.name].utilityLightsSynchronizedWithHeadlightsShutoff = state
  end)

  nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-default_mode"), GetLocalizedTextByKey("hgyi56-EVS-settings-utilitylights-default_mode-desc"), hgyi56_EVS.EUtilityLightsMode_values, hgyi56_EVS.ToNumber_EUtilityLightsMode(hgyi56_EVS.settings[categoryData.name].defaultUtilityLightsMode), hgyi56_EVS.ToNumber_EUtilityLightsMode(hgyi56_EVS.defaults[categoryData.name].defaultUtilityLightsMode), function(value)
    hgyi56_EVS.settings[categoryData.name].defaultUtilityLightsMode = hgyi56_EVS.ToEnum_EUtilityLightsMode(value)
  end)

  hgyi56_EVS.setup_light_CategorySetters(categoryData, "utilitylights")
end

function hgyi56_EVS.setup_rooflight_CategoryGetters(categoryData)
  
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "interiorlightsRoofLightOperatingMode", function(self, wrappedMethod)
    return hgyi56_EVS.ToNumber_ERoofLightOperatingMode(hgyi56_EVS.settings[categoryData.name].interiorlightsRoofLightOperatingMode) - 1
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "interiorlightsRoofLightTurnOnWithDoors", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].interiorlightsRoofLightTurnOnWithDoors
  end)
end

function hgyi56_EVS.setup_rooflight_CategorySetters(categoryData)
  hgyi56_EVS.SetupCategory(categoryData)

  nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-interiorlights-roof_light_op_mode"), GetLocalizedTextByKey("hgyi56-EVS-settings-interiorlights-roof_light_op_mode-desc"), hgyi56_EVS.ERoofLightOperatingMode_values, hgyi56_EVS.ToNumber_ERoofLightOperatingMode(hgyi56_EVS.settings[categoryData.name].interiorlightsRoofLightOperatingMode), hgyi56_EVS.ToNumber_ERoofLightOperatingMode(hgyi56_EVS.defaults[categoryData.name].interiorlightsRoofLightOperatingMode), function(value)
    hgyi56_EVS.settings[categoryData.name].interiorlightsRoofLightOperatingMode = hgyi56_EVS.ToEnum_ERoofLightOperatingMode(value)
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-interiorlights-enable_on_power_on"), "", hgyi56_EVS.settings[categoryData.name].interiorlightsRoofLightTurnOnWithPowerState, hgyi56_EVS.defaults[categoryData.name].interiorlightsRoofLightTurnOnWithPowerState, function(state)
    hgyi56_EVS.settings[categoryData.name].interiorlightsRoofLightTurnOnWithPowerState = state
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-interiorlights-enable_with_doors"), "", hgyi56_EVS.settings[categoryData.name].interiorlightsRoofLightTurnOnWithDoors, hgyi56_EVS.defaults[categoryData.name].interiorlightsRoofLightTurnOnWithDoors, function(state)
    hgyi56_EVS.settings[categoryData.name].interiorlightsRoofLightTurnOnWithDoors = state
  end)
end

function hgyi56_EVS.setup_interiorlights_CategoryGetters(categoryData)
  
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "interiorlightsAutomaticTurnOn", function(self, wrappedMethod)
    return hgyi56_EVS.ToNumber_EInteriorLightsToggleOn(hgyi56_EVS.settings[categoryData.name].interiorlightsAutomaticTurnOn) - 1
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "interiorlightsAutomaticTurnOff", function(self, wrappedMethod)
    return hgyi56_EVS.ToNumber_EInteriorLightsToggleOff(hgyi56_EVS.settings[categoryData.name].interiorlightsAutomaticTurnOff) - 1
  end)

  hgyi56_EVS.setup_light_CategoryGetters(categoryData)
end

function hgyi56_EVS.setup_interiorlights_CategorySetters(categoryData)
  hgyi56_EVS.SetupCategory(categoryData)

  nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-interiorlights-automatic_turn_on"), "", hgyi56_EVS.EInteriorLightsToggleOn_values, hgyi56_EVS.ToNumber_EInteriorLightsToggleOn(hgyi56_EVS.settings[categoryData.name].interiorlightsAutomaticTurnOn), hgyi56_EVS.ToNumber_EInteriorLightsToggleOn(hgyi56_EVS.defaults[categoryData.name].interiorlightsAutomaticTurnOn), function(value)
    hgyi56_EVS.settings[categoryData.name].interiorlightsAutomaticTurnOn = hgyi56_EVS.ToEnum_EInteriorLightsToggleOn(value)
  end)

  nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-interiorlights-automatic_turn_off"), "", hgyi56_EVS.EInteriorLightsToggleOff_values, hgyi56_EVS.ToNumber_EInteriorLightsToggleOff(hgyi56_EVS.settings[categoryData.name].interiorlightsAutomaticTurnOff), hgyi56_EVS.ToNumber_EInteriorLightsToggleOff(hgyi56_EVS.defaults[categoryData.name].interiorlightsAutomaticTurnOff), function(value)
    hgyi56_EVS.settings[categoryData.name].interiorlightsAutomaticTurnOff = hgyi56_EVS.ToEnum_EInteriorLightsToggleOff(value)
  end)

  hgyi56_EVS.setup_light_CategorySetters(categoryData, "interiorlights")
end

function hgyi56_EVS.setup_light_CategoryGetters(categoryData)

  local settings_CrystalCoatInclude = ("%s_CrystalCoatInclude"):format(categoryData.name)
  local settings_CrystalCoatColorType = ("%s_CrystalCoatColorType"):format(categoryData.name)
  local settings_ColorSequence = ("%s_ColorSequence"):format(categoryData.name)
  local settings_SequenceLatency = ("%s_SequenceLatency"):format(categoryData.name)
  local settings_ImpactedVehicles = ("%s_ImpactedVehicles"):format(categoryData.name)
  local settings_LightIntensityEnabled = ("%s_LightIntensityEnabled"):format(categoryData.name)
  local settings_LightIntensity = ("%s_LightIntensity"):format(categoryData.name)
  local settings_LightColorEnabled = ("%s_LightColorEnabled"):format(categoryData.name)
  local settings_LightColorRed = ("%s_LightColorRed"):format(categoryData.name)
  local settings_LightColorGreen = ("%s_LightColorGreen"):format(categoryData.name)
  local settings_LightColorBlue = ("%s_LightColorBlue"):format(categoryData.name)
  local settings_CycleColorRed = ("%s_CycleColorRed"):format(categoryData.name)
  local settings_CycleColorGreen = ("%s_CycleColorGreen"):format(categoryData.name)
  local settings_CycleColorBlue = ("%s_CycleColorBlue"):format(categoryData.name)
  
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", settings_CrystalCoatInclude, function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name][settings_CrystalCoatInclude]
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", settings_CrystalCoatColorType, function(self, wrappedMethod)
    return hgyi56_EVS.ToNumber_ECrystalCoatColorType(hgyi56_EVS.settings[categoryData.name][settings_CrystalCoatColorType]) - 1
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", settings_ColorSequence, function(self, wrappedMethod)
    return hgyi56_EVS.ToNumber_ELightsColorCycleType(hgyi56_EVS.settings[categoryData.name][settings_ColorSequence]) - 1
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", settings_SequenceLatency, function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name][settings_SequenceLatency]
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", settings_ImpactedVehicles, function(self, wrappedMethod)
    return hgyi56_EVS.ToNumber_ELightsColorVehicleType(hgyi56_EVS.settings[categoryData.name][settings_ImpactedVehicles]) - 1
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", settings_LightIntensityEnabled, function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name][settings_LightIntensityEnabled]
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", settings_LightIntensity, function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name][settings_LightIntensity]
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", settings_LightColorEnabled, function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name][settings_LightColorEnabled]
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", settings_LightColorRed, function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name][settings_LightColorRed]
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", settings_LightColorGreen, function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name][settings_LightColorGreen]
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", settings_LightColorBlue, function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name][settings_LightColorBlue]
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", settings_CycleColorRed, function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name][settings_CycleColorRed]
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", settings_CycleColorGreen, function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name][settings_CycleColorGreen]
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", settings_CycleColorBlue, function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name][settings_CycleColorBlue]
  end)
end

function hgyi56_EVS.setup_light_CategorySetters(categoryData, additional)
  additional = additional or ""

  local settings_CrystalCoatInclude = ("%s_CrystalCoatInclude"):format(categoryData.name)
  local settings_CrystalCoatColorType = ("%s_CrystalCoatColorType"):format(categoryData.name)
  local settings_ColorSequence = ("%s_ColorSequence"):format(categoryData.name)
  local settings_SequenceLatency = ("%s_SequenceLatency"):format(categoryData.name)
  local settings_ImpactedVehicles = ("%s_ImpactedVehicles"):format(categoryData.name)
  local settings_LightIntensityEnabled = ("%s_LightIntensityEnabled"):format(categoryData.name)
  local settings_LightIntensity = ("%s_LightIntensity"):format(categoryData.name)
  local settings_LightColorEnabled = ("%s_LightColorEnabled"):format(categoryData.name)
  local settings_LightColorRed = ("%s_LightColorRed"):format(categoryData.name)
  local settings_LightColorGreen = ("%s_LightColorGreen"):format(categoryData.name)
  local settings_LightColorBlue = ("%s_LightColorBlue"):format(categoryData.name)
  local settings_CycleColorRed = ("%s_CycleColorRed"):format(categoryData.name)
  local settings_CycleColorGreen = ("%s_CycleColorGreen"):format(categoryData.name)
  local settings_CycleColorBlue = ("%s_CycleColorBlue"):format(categoryData.name)
  
  local settingEnumValue_ColorSequence = hgyi56_EVS.ToEnum_ELightsColorCycleType(hgyi56_EVS.settings[categoryData.name][settings_ColorSequence])

  -- Forced values
  if settingEnumValue_ColorSequence == "TwoColorsCycle" then
    hgyi56_EVS.settings[categoryData.name][settings_LightColorEnabled] = true
  elseif settingEnumValue_ColorSequence == "Rainbow" then
    hgyi56_EVS.settings[categoryData.name][settings_LightColorEnabled] = false
  end
  
  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-use_cc_color"), GetLocalizedTextByKey("hgyi56-EVS-settings-use_cc_color-desc"), hgyi56_EVS.settings[categoryData.name][settings_CrystalCoatInclude], hgyi56_EVS.defaults[categoryData.name][settings_CrystalCoatInclude], function(state)
    hgyi56_EVS.settings[categoryData.name][settings_CrystalCoatInclude] = state
    
    hgyi56_EVS.setup_CategorySetters(categoryData, additional)
  end)

  if hgyi56_EVS.settings[categoryData.name][settings_CrystalCoatInclude] then
    nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-cc_color_type"), GetLocalizedTextByKey("hgyi56-EVS-settings-cc_color_type-desc"), hgyi56_EVS.ECrystalCoatColorType_values, hgyi56_EVS.ToNumber_ECrystalCoatColorType(hgyi56_EVS.settings[categoryData.name][settings_CrystalCoatColorType]), hgyi56_EVS.ToNumber_ECrystalCoatColorType(hgyi56_EVS.defaults[categoryData.name][settings_CrystalCoatColorType]), function(value)
      hgyi56_EVS.settings[categoryData.name][settings_CrystalCoatColorType] = hgyi56_EVS.ToEnum_ECrystalCoatColorType(value)
    end)
  end

  nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-color_sequence"), GetLocalizedTextByKey("hgyi56-EVS-settings-color_sequence-desc"), hgyi56_EVS.ELightsColorCycleType_values, hgyi56_EVS.ToNumber_ELightsColorCycleType(hgyi56_EVS.settings[categoryData.name][settings_ColorSequence]), hgyi56_EVS.ToNumber_ELightsColorCycleType(hgyi56_EVS.defaults[categoryData.name][settings_ColorSequence]), function(value)
    local value = hgyi56_EVS.ToEnum_ELightsColorCycleType(value)
    hgyi56_EVS.settings[categoryData.name][settings_ColorSequence] = value

    -- Default values
    if value == "Blinker" then
      hgyi56_EVS.settings[categoryData.name][settings_SequenceLatency] = 0.3
    elseif value == "Beacon" then
      hgyi56_EVS.settings[categoryData.name][settings_SequenceLatency] = 0.8
    elseif value == "Pulse" then
      hgyi56_EVS.settings[categoryData.name][settings_SequenceLatency] = 2.0
    elseif value == "TwoColorsCycle" then
      hgyi56_EVS.settings[categoryData.name][settings_SequenceLatency] = 2.0
    elseif value == "Rainbow" then
      hgyi56_EVS.settings[categoryData.name][settings_SequenceLatency] = 1.5
    end
    
    hgyi56_EVS.setup_CategorySetters(categoryData, additional)
  end)

  if settingEnumValue_ColorSequence ~= "Solid" then
    nativeSettings.addRangeFloat(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-sequence_latency"), GetLocalizedTextByKey("hgyi56-EVS-settings-sequence_latency-desc"), 0.2, 5.0, 0.1, "%.1f", hgyi56_EVS.settings[categoryData.name][settings_SequenceLatency], hgyi56_EVS.defaults[categoryData.name][settings_SequenceLatency], function(value)
      hgyi56_EVS.settings[categoryData.name][settings_SequenceLatency] = value
    end)
  end

  if hgyi56_EVS.settings[categoryData.name][settings_LightColorEnabled]
  or hgyi56_EVS.settings[categoryData.name][settings_LightIntensityEnabled]
  or settingEnumValue_ColorSequence ~= "Solid" then
    nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-impacted_vehicles"), GetLocalizedTextByKey("hgyi56-EVS-settings-impacted_vehicles-desc"), hgyi56_EVS.ELightsColorVehicleType_values, hgyi56_EVS.ToNumber_ELightsColorVehicleType(hgyi56_EVS.settings[categoryData.name][settings_ImpactedVehicles]), hgyi56_EVS.ToNumber_ELightsColorVehicleType(hgyi56_EVS.defaults[categoryData.name][settings_ImpactedVehicles]), function(value)
      hgyi56_EVS.settings[categoryData.name][settings_ImpactedVehicles] = hgyi56_EVS.ToEnum_ELightsColorVehicleType(value)
    end)
  end

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-custom_intensity"), GetLocalizedTextByKey("hgyi56-EVS-settings-custom_intensity-desc"), hgyi56_EVS.settings[categoryData.name][settings_LightIntensityEnabled], hgyi56_EVS.defaults[categoryData.name][settings_LightIntensityEnabled], function(state)
    hgyi56_EVS.settings[categoryData.name][settings_LightIntensityEnabled] = state
    
    hgyi56_EVS.setup_CategorySetters(categoryData, additional)
  end)

  if hgyi56_EVS.settings[categoryData.name][settings_LightIntensityEnabled] then
    nativeSettings.addRangeInt(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-intensity"), "", 0, 100, 1, hgyi56_EVS.settings[categoryData.name][settings_LightIntensity], hgyi56_EVS.defaults[categoryData.name][settings_LightIntensity], function(value)
      hgyi56_EVS.settings[categoryData.name][settings_LightIntensity] = value
    end)
  end

  if settingEnumValue_ColorSequence ~= "Rainbow"
  and settingEnumValue_ColorSequence ~= "TwoColorsCycle" then
    nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-custom_color"), GetLocalizedTextByKey("hgyi56-EVS-settings-custom_color-desc"), hgyi56_EVS.settings[categoryData.name][settings_LightColorEnabled], hgyi56_EVS.defaults[categoryData.name][settings_LightColorEnabled], function(state)
      hgyi56_EVS.settings[categoryData.name][settings_LightColorEnabled] = state
      
    hgyi56_EVS.setup_CategorySetters(categoryData, additional)
    end)
  end

  if hgyi56_EVS.settings[categoryData.name][settings_LightColorEnabled]
  or settingEnumValue_ColorSequence == "TwoColorsCycle" then
    nativeSettings.addRangeInt(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-custom_color-red"), "", 0, 255, 1, hgyi56_EVS.settings[categoryData.name][settings_LightColorRed], hgyi56_EVS.defaults[categoryData.name][settings_LightColorRed], function(value)
      hgyi56_EVS.settings[categoryData.name][settings_LightColorRed] = value
    end)
    
    nativeSettings.addRangeInt(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-custom_color-green"), "", 0, 255, 1, hgyi56_EVS.settings[categoryData.name][settings_LightColorGreen], hgyi56_EVS.defaults[categoryData.name][settings_LightColorGreen], function(value)
      hgyi56_EVS.settings[categoryData.name][settings_LightColorGreen] = value
    end)
    
    nativeSettings.addRangeInt(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-custom_color-blue"), "", 0, 255, 1, hgyi56_EVS.settings[categoryData.name][settings_LightColorBlue], hgyi56_EVS.defaults[categoryData.name][settings_LightColorBlue], function(value)
      hgyi56_EVS.settings[categoryData.name][settings_LightColorBlue] = value
    end)
  end

  if settingEnumValue_ColorSequence == "TwoColorsCycle" then
    nativeSettings.addRangeInt(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-cycle_color-red"), "", 0, 255, 1, hgyi56_EVS.settings[categoryData.name][settings_CycleColorRed], hgyi56_EVS.defaults[categoryData.name][settings_CycleColorRed], function(value)
      hgyi56_EVS.settings[categoryData.name][settings_CycleColorRed] = value
    end)
    
    nativeSettings.addRangeInt(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-cycle_color-green"), "", 0, 255, 1, hgyi56_EVS.settings[categoryData.name][settings_CycleColorGreen], hgyi56_EVS.defaults[categoryData.name][settings_CycleColorGreen], function(value)
      hgyi56_EVS.settings[categoryData.name][settings_CycleColorGreen] = value
    end)
    
    nativeSettings.addRangeInt(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-cycle_color-blue"), "", 0, 255, 1, hgyi56_EVS.settings[categoryData.name][settings_CycleColorBlue], hgyi56_EVS.defaults[categoryData.name][settings_CycleColorBlue], function(value)
      hgyi56_EVS.settings[categoryData.name][settings_CycleColorBlue] = value
    end)
  end
end

function hgyi56_EVS.setup_crystalcoat_CategoryGetters(categoryData)
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "crystalCoatDeactivationDistance", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].crystalCoatDeactivationDistance
  end)
end

function hgyi56_EVS.setup_crystalcoat_CategorySetters(categoryData)
  hgyi56_EVS.SetupCategory(categoryData)

  nativeSettings.addRangeFloat(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-crystalcoat-deactivation_distance"), GetLocalizedTextByKey("hgyi56-EVS-settings-crystalcoat-deactivation_distance-desc"), 5.65, 200.0, 0.01, "%.2f", hgyi56_EVS.settings[categoryData.name].crystalCoatDeactivationDistance, hgyi56_EVS.defaults[categoryData.name].crystalCoatDeactivationDistance, function(value)
    hgyi56_EVS.settings[categoryData.name].crystalCoatDeactivationDistance = value
  end)
end

function hgyi56_EVS.setup_crystaldome_CategoryGetters(categoryData)
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "crystalDomeSynchronizedWithPowerState", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].crystalDomeSynchronizedWithPowerState
  end)
  
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "crystalDomeKeepOnUntilExit", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].crystalDomeKeepOnUntilExit
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "preventCrystalDomeOffDuringCombat", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].preventCrystalDomeOffDuringCombat
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "autoEnableCrystalDomeDuringCombat", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].autoEnableCrystalDomeDuringCombat
  end)
end

function hgyi56_EVS.setup_crystaldome_CategorySetters(categoryData)
  hgyi56_EVS.SetupCategory(categoryData)

  -- Forced values
  if not hgyi56_EVS.settings[categoryData.name].crystalDomeSynchronizedWithPowerState then
    hgyi56_EVS.settings[categoryData.name].crystalDomeKeepOnUntilExit = false;
  end

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-crystaldome-sync_with_power"), GetLocalizedTextByKey("hgyi56-EVS-settings-crystaldome-sync_with_power-desc"), hgyi56_EVS.settings[categoryData.name].crystalDomeSynchronizedWithPowerState, hgyi56_EVS.defaults[categoryData.name].crystalDomeSynchronizedWithPowerState, function(state)
    hgyi56_EVS.settings[categoryData.name].crystalDomeSynchronizedWithPowerState = state

    hgyi56_EVS.SetupCategory(categoryData)
    hgyi56_EVS.setup_crystaldome_CategorySetters(categoryData)
  end)

  if hgyi56_EVS.settings[categoryData.name].crystalDomeSynchronizedWithPowerState then
    nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-crystaldome-keep_on"), GetLocalizedTextByKey("hgyi56-EVS-settings-crystaldome-keep_on-desc"), hgyi56_EVS.settings[categoryData.name].crystalDomeKeepOnUntilExit, hgyi56_EVS.defaults[categoryData.name].crystalDomeKeepOnUntilExit, function(state)
      hgyi56_EVS.settings[categoryData.name].crystalDomeKeepOnUntilExit = state
    end)
  end

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-crystaldome-prevent_shutdown"), GetLocalizedTextByKey("hgyi56-EVS-settings-crystaldome-prevent_shutdown-desc"), hgyi56_EVS.settings[categoryData.name].preventCrystalDomeOffDuringCombat, hgyi56_EVS.defaults[categoryData.name].preventCrystalDomeOffDuringCombat, function(state)
    hgyi56_EVS.settings[categoryData.name].preventCrystalDomeOffDuringCombat = state
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-crystaldome-autostart"), GetLocalizedTextByKey("hgyi56-EVS-settings-crystaldome-autostart-desc"), hgyi56_EVS.settings[categoryData.name].autoEnableCrystalDomeDuringCombat, hgyi56_EVS.defaults[categoryData.name].autoEnableCrystalDomeDuringCombat, function(state)
    hgyi56_EVS.settings[categoryData.name].autoEnableCrystalDomeDuringCombat = state
  end)
end

function hgyi56_EVS.setup_doors_CategoryGetters(categoryData)
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "doorsDriveClosing", function(self, wrappedMethod)
    return hgyi56_EVS.ToNumber_EDoorsDriveClosing(hgyi56_EVS.settings[categoryData.name].doorsDriveClosing) - 1
  end)
  
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "doorsDriveClosingSpeed", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].doorsDriveClosingSpeed
  end)
end

function hgyi56_EVS.setup_doors_CategorySetters(categoryData)
  hgyi56_EVS.SetupCategory(categoryData)

  local settingEnumValue_doorsDriveClosing = hgyi56_EVS.ToEnum_EDoorsDriveClosing(hgyi56_EVS.settings[categoryData.name].doorsDriveClosing)

  nativeSettings.addSelectorString(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-doors-close_with_speed"), GetLocalizedTextByKey("hgyi56-EVS-settings-doors-close_with_speed-desc"), hgyi56_EVS.EDoorsDriveClosing_values, hgyi56_EVS.ToNumber_EDoorsDriveClosing(hgyi56_EVS.settings[categoryData.name].doorsDriveClosing), hgyi56_EVS.ToNumber_EDoorsDriveClosing(hgyi56_EVS.defaults[categoryData.name].doorsDriveClosing), function(value)
    hgyi56_EVS.settings[categoryData.name].doorsDriveClosing = hgyi56_EVS.ToEnum_EDoorsDriveClosing(value)

    hgyi56_EVS.SetupCategory(categoryData)
    hgyi56_EVS.setup_doors_CategorySetters(categoryData)
  end)

  if settingEnumValue_doorsDriveClosing == "CustomSpeed" then
    nativeSettings.addRangeFloat(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-doors-closing_speed"), GetLocalizedTextByKey("hgyi56-EVS-settings-doors-closing_speed-desc"), 2.0, 250.0, 1.0, "%.0f", hgyi56_EVS.settings[categoryData.name].doorsDriveClosingSpeed, hgyi56_EVS.defaults[categoryData.name].doorsDriveClosingSpeed, function(value)
      hgyi56_EVS.settings[categoryData.name].doorsDriveClosingSpeed = value
    end)
  end
end

function hgyi56_EVS.setup_spoiler_CategoryGetters(categoryData)
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "spoilerSynchronizedWithPowerState", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].spoilerSynchronizedWithPowerState
  end)
  
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "spoilerDeploySpeedEnabled", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].spoilerDeploySpeedEnabled
  end)
  
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "spoilerDeploySpeed", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].spoilerDeploySpeed
  end)
  
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "spoilerRetractSpeedEnabled", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].spoilerRetractSpeedEnabled
  end)
  
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "spoilerRetractSpeed", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].spoilerRetractSpeed
  end)
end

function hgyi56_EVS.setup_spoiler_CategorySetters(categoryData)
  hgyi56_EVS.SetupCategory(categoryData)

  -- Forced values
  if hgyi56_EVS.settings[categoryData.name].spoilerSynchronizedWithPowerState then
    hgyi56_EVS.settings[categoryData.name].spoilerDeploySpeedEnabled = false
    hgyi56_EVS.settings[categoryData.name].spoilerRetractSpeedEnabled = false
  end

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-spoiler-sync_with_power"), GetLocalizedTextByKey("hgyi56-EVS-settings-spoiler-sync_with_power-desc"), hgyi56_EVS.settings[categoryData.name].spoilerSynchronizedWithPowerState, hgyi56_EVS.defaults[categoryData.name].spoilerSynchronizedWithPowerState, function(state)
    hgyi56_EVS.settings[categoryData.name].spoilerSynchronizedWithPowerState = state

    hgyi56_EVS.SetupCategory(categoryData)
    hgyi56_EVS.setup_spoiler_CategorySetters(categoryData)
  end)

  if not hgyi56_EVS.settings[categoryData.name].spoilerSynchronizedWithPowerState then
    nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-spoiler-deploy_with_speed"), GetLocalizedTextByKey("hgyi56-EVS-settings-spoiler-deploy_with_speed-desc"), hgyi56_EVS.settings[categoryData.name].spoilerDeploySpeedEnabled, hgyi56_EVS.defaults[categoryData.name].spoilerDeploySpeedEnabled, function(state)
      hgyi56_EVS.settings[categoryData.name].spoilerDeploySpeedEnabled = state

      hgyi56_EVS.SetupCategory(categoryData)
      hgyi56_EVS.setup_spoiler_CategorySetters(categoryData)
    end)
  end

  if hgyi56_EVS.settings[categoryData.name].spoilerDeploySpeedEnabled then
    nativeSettings.addRangeFloat(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-spoiler-deploy_speed"), GetLocalizedTextByKey("hgyi56-EVS-settings-spoiler-deploy_speed-desc"), 0.0, 250.0, 1.0, "%.0f", hgyi56_EVS.settings[categoryData.name].spoilerDeploySpeed, hgyi56_EVS.defaults[categoryData.name].spoilerDeploySpeed, function(value)
      hgyi56_EVS.settings[categoryData.name].spoilerDeploySpeed = value
    end)
  end

  if not hgyi56_EVS.settings[categoryData.name].spoilerSynchronizedWithPowerState then
    nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-spoiler-retract_with_speed"), GetLocalizedTextByKey("hgyi56-EVS-settings-spoiler-retract_with_speed-desc"), hgyi56_EVS.settings[categoryData.name].spoilerRetractSpeedEnabled, hgyi56_EVS.defaults[categoryData.name].spoilerRetractSpeedEnabled, function(state)
      hgyi56_EVS.settings[categoryData.name].spoilerRetractSpeedEnabled = state

      hgyi56_EVS.SetupCategory(categoryData)
      hgyi56_EVS.setup_spoiler_CategorySetters(categoryData)
    end)
  end

  if hgyi56_EVS.settings[categoryData.name].spoilerRetractSpeedEnabled then
    nativeSettings.addRangeFloat(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-spoiler-retract_speed"), GetLocalizedTextByKey("hgyi56-EVS-settings-spoiler-retract_speed-desc"), 0.0, 250.0, 1.0, "%.0f", hgyi56_EVS.settings[categoryData.name].spoilerRetractSpeed, hgyi56_EVS.defaults[categoryData.name].spoilerRetractSpeed, function(value)
      hgyi56_EVS.settings[categoryData.name].spoilerRetractSpeed = value
    end)
  end
end

function hgyi56_EVS.setup_police_lights_CategoryGetters(categoryData)
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "keepSirenOnWhileOutsidePlayerEnabled", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].keepSirenOnWhileOutsidePlayerEnabled
  end)
  
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "keepSirenOnWhileOutsideNPCsEnabled", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].keepSirenOnWhileOutsideNPCsEnabled
  end)
  
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "policeBikeSirenEnabled", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].policeBikeSirenEnabled
  end)

  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "policeDispatchRadioEnabled", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].policeDispatchRadioEnabled
  end)
end

function hgyi56_EVS.setup_police_lights_CategorySetters(categoryData)
  hgyi56_EVS.SetupCategory(categoryData)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-police_lights-keep_siren_player"), GetLocalizedTextByKey("hgyi56-EVS-settings-police_lights-keep_siren_player-desc"), hgyi56_EVS.settings[categoryData.name].keepSirenOnWhileOutsidePlayerEnabled, hgyi56_EVS.defaults[categoryData.name].keepSirenOnWhileOutsidePlayerEnabled, function(state)
    hgyi56_EVS.settings[categoryData.name].keepSirenOnWhileOutsidePlayerEnabled = state
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-police_lights-keep_siren_npc"), GetLocalizedTextByKey("hgyi56-EVS-settings-police_lights-keep_siren_npc-desc"), hgyi56_EVS.settings[categoryData.name].keepSirenOnWhileOutsideNPCsEnabled, hgyi56_EVS.defaults[categoryData.name].keepSirenOnWhileOutsideNPCsEnabled, function(state)
    hgyi56_EVS.settings[categoryData.name].keepSirenOnWhileOutsideNPCsEnabled = state
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-police_lights-siren_for_bikes"), GetLocalizedTextByKey("hgyi56-EVS-settings-police_lights-siren_for_bikes-desc"), hgyi56_EVS.settings[categoryData.name].policeBikeSirenEnabled, hgyi56_EVS.defaults[categoryData.name].policeBikeSirenEnabled, function(state)
    hgyi56_EVS.settings[categoryData.name].policeBikeSirenEnabled = state
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-police_lights-dispatch_radio"), GetLocalizedTextByKey("hgyi56-EVS-settings-police_lights-dispatch_radio-desc"), hgyi56_EVS.settings[categoryData.name].policeDispatchRadioEnabled, hgyi56_EVS.defaults[categoryData.name].policeDispatchRadioEnabled, function(state)
    hgyi56_EVS.settings[categoryData.name].policeDispatchRadioEnabled = state
  end)
end

function hgyi56_EVS.setup_hints_CategoryGetters(categoryData)
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "displayPowerEngineInputHint", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].displayPowerEngineInputHint
  end)
  
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "displayDoorsInputHint", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].displayDoorsInputHint
  end)
  
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "displaySpoilerInputHint", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].displaySpoilerInputHint
  end)
  
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "displayWindowsInputHint", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].displayWindowsInputHint
  end)
  
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "displayCrystalDomeInputHint", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].displayCrystalDomeInputHint
  end)
  
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "displayHeadlightsCallInputHint", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].displayHeadlightsCallInputHint
  end)
  
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "displayToggleLightSettingsInputHint", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].displayToggleLightSettingsInputHint
  end)
end

function hgyi56_EVS.setup_hints_CategorySetters(categoryData)
  hgyi56_EVS.SetupCategory(categoryData)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-input_hints-power_engine"), "", hgyi56_EVS.settings[categoryData.name].displayPowerEngineInputHint, hgyi56_EVS.defaults[categoryData.name].displayPowerEngineInputHint, function(state)
    hgyi56_EVS.settings[categoryData.name].displayPowerEngineInputHint = state
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-input_hints-doors"), "", hgyi56_EVS.settings[categoryData.name].displayDoorsInputHint, hgyi56_EVS.defaults[categoryData.name].displayDoorsInputHint, function(state)
    hgyi56_EVS.settings[categoryData.name].displayDoorsInputHint = state
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-input_hints-hood_trunk_spoiler"), "", hgyi56_EVS.settings[categoryData.name].displaySpoilerInputHint, hgyi56_EVS.defaults[categoryData.name].displaySpoilerInputHint, function(state)
    hgyi56_EVS.settings[categoryData.name].displaySpoilerInputHint = state
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-input_hints-windows"), "", hgyi56_EVS.settings[categoryData.name].displayWindowsInputHint, hgyi56_EVS.defaults[categoryData.name].displayWindowsInputHint, function(state)
    hgyi56_EVS.settings[categoryData.name].displayWindowsInputHint = state
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-input_hints-crystal_dome"), "", hgyi56_EVS.settings[categoryData.name].displayCrystalDomeInputHint, hgyi56_EVS.defaults[categoryData.name].displayCrystalDomeInputHint, function(state)
    hgyi56_EVS.settings[categoryData.name].displayCrystalDomeInputHint = state
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-input_hints-headlights_call"), "", hgyi56_EVS.settings[categoryData.name].displayHeadlightsCallInputHint, hgyi56_EVS.defaults[categoryData.name].displayHeadlightsCallInputHint, function(state)
    hgyi56_EVS.settings[categoryData.name].displayHeadlightsCallInputHint = state
  end)

  nativeSettings.addSwitch(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-input_hints-toggle_settings"), "", hgyi56_EVS.settings[categoryData.name].displayToggleLightSettingsInputHint, hgyi56_EVS.defaults[categoryData.name].displayToggleLightSettingsInputHint, function(state)
    hgyi56_EVS.settings[categoryData.name].displayToggleLightSettingsInputHint = state
  end)
end

function hgyi56_EVS.setup_other_CategoryGetters(categoryData)
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "multiTapTimeWindow", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].multiTapTimeWindow
  end)
  
  Override("Hgyi56.Enhanced_Vehicle_System.MyModSettings", "cycleUtilityLightsHoldTime", function(self, wrappedMethod)
    return hgyi56_EVS.settings[categoryData.name].cycleUtilityLightsHoldTime
  end)
end

function hgyi56_EVS.setup_other_CategorySetters(categoryData)
  hgyi56_EVS.SetupCategory(categoryData)

  nativeSettings.addRangeFloat(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-other_settings-multitap_window"), GetLocalizedTextByKey("hgyi56-EVS-settings-other_settings-multitap_window-desc"), 0.10, 1.00, 0.01, "%.2f", hgyi56_EVS.settings[categoryData.name].multiTapTimeWindow, hgyi56_EVS.defaults[categoryData.name].multiTapTimeWindow, function(value)
    hgyi56_EVS.settings[categoryData.name].multiTapTimeWindow = value
  end)

  nativeSettings.addRangeFloat(categoryData.path, GetLocalizedTextByKey("hgyi56-EVS-settings-other_settings-utility_lights_hold_time"), GetLocalizedTextByKey("hgyi56-EVS-settings-other_settings-utility_lights_hold_time-desc"), 0.00, 0.20, 0.01, "%.2f", hgyi56_EVS.settings[categoryData.name].cycleUtilityLightsHoldTime, hgyi56_EVS.defaults[categoryData.name].cycleUtilityLightsHoldTime, function(value)
    hgyi56_EVS.settings[categoryData.name].cycleUtilityLightsHoldTime = value
  end)
end

function hgyi56_EVS.notifyScriptOnSettingChange()
  Hgyi56_Enhanced_Vehicle_System_MyModSettings.Get():OnNativeUISettingsChange()
end

function hgyi56_EVS.setup_CategorySetters(categoryData, additional)
  additional = additional or ""

  if additional == "npc_headlights" then
    hgyi56_EVS.setup_npc_headlights_CategorySetters(categoryData)
  
  elseif additional == "headlights" then
    hgyi56_EVS.setup_headlights_CategorySetters(categoryData)

  elseif additional == "utilitylights" then
    hgyi56_EVS.setup_utilitylights_CategorySetters(categoryData)

  elseif additional == "rooflight" then
    hgyi56_EVS.setup_rooflight_CategorySetters(categoryData)

  elseif additional == "interiorlights" then
    hgyi56_EVS.setup_interiorlights_CategorySetters(categoryData)

  else
    hgyi56_EVS.SetupCategory(categoryData)
  
    hgyi56_EVS.setup_light_CategorySetters(categoryData, additional)
  end
end

function hgyi56_EVS.PopulateSettings(categoryData)
  if type(categoryData) == "string" then
    if not categoryData:find("^#") then
      if categoryData == "power_state" then
        hgyi56_EVS.setup_power_state_CategorySetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "lights" then
        hgyi56_EVS.setup_lights_CategorySetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "npc_headlights" then
        hgyi56_EVS.setup_npc_headlights_CategorySetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "headlights" then
        hgyi56_EVS.setup_headlights_CategorySetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "utilitylights" then
        hgyi56_EVS.setup_utilitylights_CategorySetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "rooflight" then
        hgyi56_EVS.setup_rooflight_CategorySetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "interiorlights" then
        hgyi56_EVS.setup_interiorlights_CategorySetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "taillights"
        or categoryData == "blinkerlights"
        or categoryData == "reverselights" then
        hgyi56_EVS.setup_CategorySetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "crystalcoat" then
        hgyi56_EVS.setup_crystalcoat_CategorySetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "crystaldome" then
        hgyi56_EVS.setup_crystaldome_CategorySetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "doors" then
        hgyi56_EVS.setup_doors_CategorySetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "spoiler" then
        hgyi56_EVS.setup_spoiler_CategorySetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "police_lights" then
        hgyi56_EVS.setup_police_lights_CategorySetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "hints" then
        hgyi56_EVS.setup_hints_CategorySetters(hgyi56_EVS.subcategories[categoryData])
      elseif categoryData == "other" then
        hgyi56_EVS.setup_other_CategorySetters(hgyi56_EVS.subcategories[categoryData])
      end
    end

  elseif type(categoryData) == "table" then
    for _, data in pairs(categoryData) do
      hgyi56_EVS.PopulateSettings(data)
    end
  end
end

function hgyi56_EVS.PopulateMenuControls(subPath)
  if not nativeSettings.pathExists(subPath) then
    nativeSettings.addSubcategory(subPath, GetLocalizedTextByKey("hgyi56-EVS-menu_controls-cat"))
  end

  local currentMenu = hgyi56_EVS.navStack[#hgyi56_EVS.navStack]

  if currentMenu == "general" then
    hgyi56_EVS.SpawnCustomButton(subPath, "power_state")
    hgyi56_EVS.SpawnCustomButton(subPath, "lights")
    hgyi56_EVS.SpawnCustomButton(subPath, "crystalcoat")
    hgyi56_EVS.SpawnCustomButton(subPath, "crystaldome")
    hgyi56_EVS.SpawnCustomButton(subPath, "doors")
    hgyi56_EVS.SpawnCustomButton(subPath, "spoiler")
    hgyi56_EVS.SpawnCustomButton(subPath, "police_lights")
    hgyi56_EVS.SpawnCustomButton(subPath, "hints")
    hgyi56_EVS.SpawnCustomButton(subPath, "other")
  elseif currentMenu == "lights" then
    hgyi56_EVS.SpawnCustomButton(subPath, "headlights")
    hgyi56_EVS.SpawnCustomButton(subPath, "taillights")
    hgyi56_EVS.SpawnCustomButton(subPath, "utilitylights")
    hgyi56_EVS.SpawnCustomButton(subPath, "blinkerlights")
    hgyi56_EVS.SpawnCustomButton(subPath, "reverselights")
    hgyi56_EVS.SpawnCustomButton(subPath, "interiorlights")
  end

  if #hgyi56_EVS.navStack > 1 then
    hgyi56_EVS.SpawnBackButton(subPath)
  end
end

function hgyi56_EVS.SetupMenu()
  if nativeSettings.pathExists(hgyi56_EVS.modPath) then

    for _, data in pairs(hgyi56_EVS.subcategories) do
      nativeSettings.removeSubcategory(data.path)
    end
    
    nativeSettings.removeSubcategory(hgyi56_EVS.leadingControlsPath)
    nativeSettings.removeSubcategory(hgyi56_EVS.trailingControlsPath)
  end

  if not nativeSettings.pathExists(hgyi56_EVS.modPath) then
    nativeSettings.addTab(hgyi56_EVS.modPath, hgyi56_EVS.modDisplayName)
  end

  hgyi56_EVS.PopulateMenuControls(hgyi56_EVS.leadingControlsPath)
  
  for _, k in ipairs(hgyi56_EVS.menuIndex[hgyi56_EVS.navStack[#hgyi56_EVS.navStack]]) do
    hgyi56_EVS.PopulateSettings(k)
  end

  -- Calculate the number of widgets that have been created
  local widgetCount = 0
  for subPath, _ in pairs(nativeSettings.data[hgyi56_EVS.modName].subcategories) do
    if subPath ~= hgyi56_EVS.leadingControlsName then
      widgetCount = widgetCount + #nativeSettings.data[hgyi56_EVS.modName].subcategories[subPath].options
    end
  end

  -- Create trailing menu controls only if more than X widgets have been created
  if widgetCount > 4 then
    hgyi56_EVS.PopulateMenuControls(hgyi56_EVS.trailingControlsPath)
  end
end

function hgyi56_EVS.SpawnCustomButton(subPath, subMenu)
  if not nativeSettings.pathExists(subPath) then
    nativeSettings.addSubcategory(subPath, GetLocalizedTextByKey("hgyi56-EVS-menu_controls-cat"))
  end

  nativeSettings.addButton(subPath, GetLocalizedTextByKey(("hgyi56-EVS-menu_controls-%s-label"):format(subMenu)), "", GetLocalizedTextByKey(("hgyi56-EVS-menu_controls-%s-button"):format(subMenu)), 45, function()
    table.insert(hgyi56_EVS.navStack, subMenu)
    hgyi56_EVS.ResetScrollPos()
    hgyi56_EVS.SetupMenu()
  end)
end

function hgyi56_EVS.SpawnBackButton(subPath)
  if not nativeSettings.pathExists(subPath) then
    nativeSettings.addSubcategory(subPath, GetLocalizedTextByKey("hgyi56-EVS-menu_controls-cat"))
  end

  nativeSettings.addButton(subPath, GetLocalizedTextByKey("hgyi56-EVS-menu_controls-back-label"), "", GetLocalizedTextByKey("hgyi56-EVS-menu_controls-back-button"), 45, function()
    table.remove(hgyi56_EVS.navStack)
    hgyi56_EVS.ResetScrollPos()
    hgyi56_EVS.SetupMenu()
  end)
end

function hgyi56_EVS.SetupCategory(categoryData)
  if nativeSettings.pathExists(categoryData.path) then
    -- Only remove options otherwise rebuilding the category may produce order issues
    if nativeSettings.currentTab == hgyi56_EVS.modName then -- Handle subcategory removing when the tab is open
      nativeSettings.saveScrollPos()
      for _, option in pairs(nativeSettings.data[hgyi56_EVS.modName].subcategories[categoryData.name].options) do
          inkCompoundRef.RemoveChildByName(nativeSettings.settingsOptionsList, option.widgetName)
      end
      nativeSettings.restoreScrollPos()
    end

    nativeSettings.data[hgyi56_EVS.modName].subcategories[categoryData.name].options = {}
  else
    nativeSettings.addSubcategory(categoryData.path, categoryData.label)
  end
end

function hgyi56_EVS.ResetScrollPos()
  local mainScrollArea = nativeSettings.settingsMainController:GetRootWidget():GetWidget(StringToName("wrapper/wrapper/MainScrollingArea"))
  mainScrollArea:GetController():SetScrollPosition(0)
end

function hgyi56_EVS.SaveScrollPos()
  if nativeSettings.currentTabPath == hgyi56_EVS.modName then
    local scrollArea = nativeSettings.settingsMainController:GetRootWidget():GetWidget(StringToName("wrapper/wrapper/MainScrollingArea/scroll_area"))
    hgyi56_EVS.currentScrollPos = scrollArea:GetVerticalScrollPosition() * scrollArea:GetContentSize().Y
  end
end

function hgyi56_EVS.RestoreScrollPos()
  if nativeSettings.currentTabPath == hgyi56_EVS.modName then
    nativeSettings.oldScrollPos = hgyi56_EVS.currentScrollPos
    nativeSettings.restoreScrollPos()
  end
end

function hgyi56_EVS.SetupMenuListener()
  hgyi56_EVS.GameUI.Listen("MenuNav", function(state)
		if state.lastSubmenu ~= nil and state.lastSubmenu == "Settings" then
      hgyi56_EVS.SaveSettings()
      hgyi56_EVS.SaveScrollPos()
    end
	end)
end

function hgyi56_EVS.LoadSettings()
  local file = io.open(hgyi56_EVS.settingsFileName, 'r')
  if file ~= nil then
    local contents = file:read("*a")
    local validJson, savedSettings = pcall(function() return json.decode(contents) end)
    file:close()

    if validJson then
      for key1, _ in pairs(hgyi56_EVS.settings) do
        if savedSettings[key1] ~= nil then
          for key2, _ in pairs(hgyi56_EVS.settings[key1]) do
            if savedSettings[key1][key2] ~= nil then

              -- Force enum values to be loaded as string
              local value = hgyi56_EVS.ConvertEnumValuesToString(key2, savedSettings[key1][key2])

              hgyi56_EVS.settings[key1][key2] = value
            end
          end
        end
      end
    end
  end

  -- If NativeUI is not installed, create or overwrite the settings file so new settings are created into the file
  if nativeSettings == nil then
    hgyi56_EVS.SaveSettings()
  end
end

function hgyi56_EVS.ConvertEnumValuesToString(key, value)
  
  if key == "defaultHeadlightsMode" then
    value = hgyi56_EVS.ToEnum_EHeadlightsMode(value)

  elseif key == "headlightsSynchronizedWithTimeMode" then
    value = hgyi56_EVS.ToEnum_EHeadlightsSynchronizedWithTimeMode(value)

  elseif key == "utilityLightsSynchronizedWithTimeVehicleType" then
    value = hgyi56_EVS.ToEnum_EUtilityLightsSynchronizedWithTimeVehicleType(value)

  elseif key == "defaultUtilityLightsMode" then
    value = hgyi56_EVS.ToEnum_EUtilityLightsMode(value)

  elseif key == "enterBehavior" then
    value = hgyi56_EVS.ToEnum_EEnterBehavior(value)

  elseif key == "exitBehavior" then
    value = hgyi56_EVS.ToEnum_EExitBehavior(value)

  elseif key == "npcHeadlightsAttenuation" then
    value = hgyi56_EVS.ToEnum_ELightAttenuation(value)

  elseif key == "interiorlightsRoofLightOperatingMode" then
    value = hgyi56_EVS.ToEnum_ERoofLightOperatingMode(value)

  elseif key == "interiorlightsAutomaticTurnOn" then
    value = hgyi56_EVS.ToEnum_EInteriorLightsToggleOn(value)

  elseif key == "interiorlightsAutomaticTurnOff" then
    value = hgyi56_EVS.ToEnum_EInteriorLightsToggleOff(value)

  elseif key == "doorsDriveClosing" then
    value = hgyi56_EVS.ToEnum_EDoorsDriveClosing(value)

  elseif key == "interiorlightsRoofLightOperatingMode" then
    value = hgyi56_EVS.ToEnum_ERoofLightOperatingMode(value)

  elseif key:find("_CrystalCoatColorType$") then
    value = hgyi56_EVS.ToEnum_ECrystalCoatColorType(value)

  elseif key:find("_ColorSequence$") then
    value = hgyi56_EVS.ToEnum_ELightsColorCycleType(value)

  elseif key:find("_ImpactedVehicles$") then
    value = hgyi56_EVS.ToEnum_ELightsColorVehicleType(value)

  elseif key:find("_CrystalCoatColorType$") then
    value = hgyi56_EVS.ToEnum_ECrystalCoatColorType(value)

  elseif key:find("_CrystalCoatColorType$") then
    value = hgyi56_EVS.ToEnum_ECrystalCoatColorType(value)

  elseif key:find("_CrystalCoatColorType$") then
    value = hgyi56_EVS.ToEnum_ECrystalCoatColorType(value)
  end

  return value
end

function hgyi56_EVS.SaveSettings()
  local validJson, contents = pcall(function() return json.encode(hgyi56_EVS.settings) end)
  
  if validJson and contents ~= nil then
    contents = hgyi56_EVS.PrettifyJson(contents)
    local file = io.open(hgyi56_EVS.settingsFileName, "w+")
    file:write(contents)
    file:close()
  end
end

function hgyi56_EVS.Deepcopy(orig)
  local orig_type = type(orig)
  local copy
  if orig_type == 'table' then
      copy = {}
      for orig_key, orig_value in next, orig, nil do
          copy[hgyi56_EVS.Deepcopy(orig_key)] = hgyi56_EVS.Deepcopy(orig_value)
      end
      setmetatable(copy, hgyi56_EVS.Deepcopy(getmetatable(orig)))
  else -- number, string, boolean, etc
      copy = orig
  end
  return copy
end

function hgyi56_EVS.PrettifyJson(data)
  local prettyJSON = data
  
  if RedData_Json_ParseJson ~= nil then
    local jsonData = RedData_Json_ParseJson(data)
    prettyJSON = jsonData:ToString("  ")
  end

  return prettyJSON
end

return hgyi56_EVS