# llop-hud

Minimalist and configurable UI with speedometer for QB framework, responsive with every resolution and aspect ratio.


## Features

 - Command for disable or enable the hud ("toggleui").
 - A color mode for the status progress bars. 
 - Multiple config variables for a simple configuration.
 - Percentage limits for some progressbar (health, thirst and hungry) to be shown.
 - Speedometer inspired in the new NoPixel HUD with:
     - MPH or KPH
     - RPM
     - Gear
     - Fuel
     - Lights
     - Engine health
     - Lock state.
 - Location and time displayed on gps.
 - Options to disable native hud components.
 - Compatibility with Legacyfuel, ox-fuel and ps-fuel.

## Dependency

 - QBCore (can be used for standalone with some adjustments)

## Installing

1.  Download the entire project or [from the release](https://github.com/Llop-Estepari/llop-HUD/releases/tag/v1.0.0).
2.  Place `llop-HUD` in your resources directory (you can change the name of the resouce).
3.  Add `ensure llop-HUD` to your server.cfg


`Config.EnableColorMode` Set to true if you want the color mode instead the black and white mode.

`Config.ShowOnLeftSide`  Set to true if you want the status bars to be on the left side or false to be on the bottom side.

`Config.HealthLimit` The health limit in percentage to be shown.

`Config.HungerLimit` The hunger limit in percentage to be shown.

`Config.ThirstLimit` The thirst limit in percentage to be shown.

`Config.SpeedometerUpdateRate` The update rate of the speedometer in milliseconds, lower values = faster updates. (Recommended: min 100, max 300)

`Config.SpeedometerInCenter` Set to true if you want the speedometer to be in the center of the screen.

`Config.UseMPH` Enbale or disable the use of MPH

`Config.FuelScript` The script name of the your fuel script. List of compatible scripts: 'legacyfuel', 'ox-fuel', 'ps-fuel'.

`Config.ShowTime` Show the current time.

`Config.ShowLocation` Show the current street name.

`Config.ShowZone` If true it will show the current zone instead of the street name.

`Config.ShowFuel` Show the current fuel level in percentage.

`Config.HideRadarOnFoot` Hide the radar when not in a vehicle

`Config.DisableHUDElements` Set to true if you want to disable the HUD elements.

## Screenshots
