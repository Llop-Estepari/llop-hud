Config = {}

----------------------------------------------------------------------
--#region PLAYER INFO

Config.EnableColorMode = false -- Set to true if you want the color mode instead the black and white mode.
Config.ShowOnLeftSide = false -- Set to true if you want the status bars to be on the left side or false to be on the bottom side.

Config.HealthLimit = 95 -- The health limit in percentage to be shown.
Config.HungerLimit = 90  -- The hunger limit in percentage to be shown.
Config.ThirstLimit = 90 -- The thirst limit in percentage to be shown.

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

Config.DisableHUDElements = true -- Set to true if you want to disable the HUD elements.

Config.Disable = {
  hudComponents = { 1, 2, 3, 4, 5, 6, 8, 7, 9, 13, 14, 19, 20, 21, 22 }, -- Hud Components: https://docs.fivem.net/natives/?_0x6806C51AD12B83B8
  controls = { 37 },                                            -- Controls: https://docs.fivem.net/docs/game-references/controls/
  displayAmmo = true,                                           -- false disables ammo display
}