<h1 align="center">llop-hud </h1>


**Minimalist** and configurable **UI** with **speedometer** for **QB framework**, **_RESPONSIVE_** with every resolution and aspect ratio.

<p align="center">
  <img src="https://i.gyazo.com/f287e28d5049047a77ed7341e07c2105.jpg"/><br>
  <a href="#features">Features</a> •
  <a href="#dependency">Dependency</a> •
  <a href="#installation">Installation</a> •
  <a href="#configuration-variables">Configuration</a> •
  <a href="#screenshots">Screenshots</a> •
  <a href="#video">Video</a><br>
</p>

## Features

 - Command for toggle the hud visibility ("toggleui").
 - A **color mode** for the status progress bars. 
 - Multiple configuration variables.
 - Percentage limits for some progressbar (**health**, **thirst** and **hungry**) to be shown.
 - **Armour** is only shown when you have more than 0% of armour.
 - **Stamina** and **oxygen** are only shown when they are below 100%.
 - **Speedometer** features: _(inspired in the new NoPixel HUD)_
     - MPH or KPH
     - RPM
     - Gear
     - Fuel
     - Lights
     - Engine health
     - Lock state.
 - **Location and time** displayed on gps.
 - Options to **disable native hud** components.
 - Compatibility with Legacyfuel, ox-fuel and ps-fuel.

## Dependency

 - [QBCore](https://github.com/qbcore-framework/) _(can be used for standalone with some adjustments)_

## Installation

1.  Download the entire project or [from the release](https://github.com/Llop-Estepari/llop-HUD/releases/tag/v1.0.0).
2.  Place `llop-HUD` in your resources directory (you can change the name of the resouce).
3.  Add `ensure llop-HUD` to your server.cfg

## Configuration Variables

`Config.EnableColorMode` Set to true if you want the color mode instead the black and white mode.

`Config.ShowOnLeftSide`  Set to true if you want the status bars to be on the left side or false to be on the bottom side.

`Config.HealthLimit` The health minimum (in percentage) to be shown.

`Config.HungerLimit` The hunger minimum (in percentage) to be shown.

`Config.ThirstLimit` The thirst minimum (in percentage) to be shown.

`Config.SpeedometerUpdateRate` The update rate of the speedometer in milliseconds, lower values = faster updates. (Recommended: min 100, max 300)

`Config.SpeedometerInCenter` Set to true if you want the speedometer to be in the center of the screen.

`Config.UseMPH` Enbale or disable the use of MPH

`Config.FuelScript` The script name of the your fuel script. List of compatible scripts: 'legacyfuel', 'ox-fuel', 'ps-fuel'.

`Config.ShowTime` Show the current time.

`Config.ShowLocation` Show the current street name.

`Config.ShowZone` If true it will show the current zone instead of the street name.

`Config.ShowFuel` Show the current fuel level.

`Config.HideRadarOnFoot` Hide the radar when not in a vehicle

`Config.DisableHUDElements` Set to true if you want to disable the HUD elements.

## Screenshots

<h3 align="center">Default</h3>
<p align="center">
  <img src="https://i.gyazo.com/308e956b127163c37994a82b83c7e3cc.jpg"/><br>
</p>

<h3 align="center">Speedometer</h3>
<p align="center">
  <img src="https://i.gyazo.com/3eac5dfa2f2e7b3e0adf1f977fb54a16.jpg"/><br>
</p>


<h3 align="center">Color mode</h3>
<p align="center">
  <img src="https://i.gyazo.com/89be149d5521bbd45d1d6bbf384684d3.png"/><br>
</p>


<h3 align="center">Left side</h3>
<p align="center">
  <img src="https://i.gyazo.com/d55601938c6220767be24cc73f2bc9f6.jpg" width=500/><br>
</p>


## Video
<p align="center">
  <a href="https://www.youtube.com/watch?v=ZC_f-Kv7Ut0"><img width=248 src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpnghq.com%2Fwp-content%2Fuploads%2Fpnghq.com-youtube-tv-logo-youtubetv-5-350x350.png&f=1&nofb=1&ipt=3ce64901b170d36a8f631341562559c8031fded0a88b4538ae9d0c0b6bf1ac47&ipo=images"></a>
</p>

