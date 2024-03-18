Config = {}

----------------------------------------------------------------------
--#region PLAYER INFO

Config.EnableColorMode = false -- Set to true if you want the color mode instead the black and white mode.
Config.ShowOnLeftSide = false -- Set to true if you want the status bars to be on the left side or false to be on the bottom side.

Config.HealthLimit = 95 -- The health limit in percentage to be shown.
Config.HungerLimit = 95  -- The hunger limit in percentage to be shown.
Config.ThirstLimit = 95 -- The thirst limit in percentage to be shown.

--#endregion
----------------------------------------------------------------------
--#region VEHICLE INFO

Config.SpeedometerUpdateRate = 100 -- The update rate of the speedometer in milliseconds, lower values = faster updates.(Recommended: min 100, max 300).
Config.SpeedometerInCenter = false -- Set to true if you want the speedometer to be in the center of the screen.

Config.UseMPH = false -- Enbale or disable the use of MPH
Config.FuelScript = 'legacyfuel' -- The script name of the your fuel script.
--List of compatible scripts: 'legacyfuel', 'ox-fuel', 'ps-fuel'.
Config.ShowTime = true -- Show the current time.
Config.ShowLocation = true -- Show the current street name.
Config.ShowZone = true -- If true it will show the current zone instead of the street name.
Config.ShowFuel = true -- Show the current fuel level in percentage.

Config.HideRadarOnFoot = true -- Hide the radar when not in a vehicle
--#endregion
----------------------------------------------------------------------

--Define the HUD elements you want to show.
Config.HUD_ELEMENTS = {
  HUD = { id = 0, hidden = true },
  WANTED_STARS = { id = 1, hidden = true },
  WEAPON_ICON = { id = 2, hidden = false },
  CASH = { id = 3, hidden = true },
  MP_CASH = { id = 4, hidden = true },
  MP_MESSAGE = { id = 5, hidden = true },
  VEHICLE_NAME = { id = 6, hidden = true },
  VEHICLE_CLASS = { id = 8, hidden = true },
  AREA_NAME = { id = 7, hidden = true },
  STREET_NAME = { id = 9, hidden = true },
  HELP_TEXT = { id = 10, hidden = false },
  FLOATING_HELP_TEXT_1 = { id = 11, hidden = false },
  FLOATING_HELP_TEXT_2 = { id = 12, hidden = false },
  CASH_CHANGE = { id = 13, hidden = true },
  SUBTITLE_TEXT = { id = 15, hidden = false },
  RADIO_STATIONS = { id = 16, hidden = false },
  SAVING_GAME = { id = 17, hidden = false },
  GAME_STREAM = { id = 18, hidden = false },
  WEAPON_WHEEL = { id = 19, hidden = false },
  WEAPON_WHEEL_STATS = { id = 20, hidden = true },
  MAX_HUD_COMPONENTS = { id = 21, hidden = false },
  MAX_HUD_WEAPONS = { id = 22, hidden = true },
  MAX_SCRIPTED_HUD_COMPONENTS = { id = 141, hidden = true }
}