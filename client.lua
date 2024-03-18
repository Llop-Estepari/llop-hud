local QBCore = exports['qb-core']:GetCoreObject()
PlayerData = QBCore.Functions.GetPlayerData()

local ui_visibility = true
local mph = 2.236936
local kph = 3.6
local isInVehicle

local cur_hunger = 100
local cur_thirst = 100

local lastFuelUpdate = 0
local lastFuelCheck = {}



-- This function loads the settings.
local function loadSettings()
  SendNUIMessage({
    type = 'SETTINGS',
    colorMode = Config.EnableColorMode,
    position = Config.ShowOnLeftSide,
  })
end

local function showHUD()
  SendNUIMessage({
    type = 'VISIBILITY',
    visible = true,
  })
end

local function hideHUD()
  SendNUIMessage({
    type = 'VISIBILITY',
    visible = false,
  })
end

-- This function calculates return fuel level of a vehicle.
--
-- @param vehicle The vehicle to check the fuel level of.
--
-- @return The fuel level of the vehicle. A number between 0 and 99.
local function getFuelLevel(vehicle)
  if Config.ShowFuel then
    if Config.FuelScript == 'legacyfuel' then
      local updateTick = GetGameTimer()
      if (updateTick - lastFuelUpdate) > 2000 then
          lastFuelUpdate = updateTick
          lastFuelCheck = math.floor(exports['LegacyFuel']:GetFuel(vehicle))
      end
      lastFuelCheck = math.max(0, math.min(lastFuelCheck, 99))

      return lastFuelCheck
    elseif Config.FuelScript == 'ox-fuel' then
      --TODO: Add compatibility with ox-fuel
    elseif Config.FuelScript == 'ps-fuel' then
      --TODO: Add compatibility with ps-fuel
    else
      return 99
    end
  else
    return ''
  end
end

-- This function toggles the visibility of the vehicle HUD.
local function toggleVehicleHUD()
  SendNUIMessage({
    type = 'TOGGLE_VEHICLE',
    visible = isInVehicle,
  })
end

-- This function updates the vehicle HUD with the current state and show the time and location if enabled.
local function UpdateVehicleHUD(pedId)
  if IsPedInAnyVehicle(pedId, true) then
    local vehicle = GetVehiclePedIsIn(pedId, false)
    if GetVehicleClass(vehicle) == 13 then
      return
    end

    toggleVehicleHUD()
    local coords = GetEntityCoords(pedId)


    local r, light, cur_highbeams = GetVehicleLightsState(vehicle)
    local cur_light = light + cur_highbeams
    local cur_lock = GetVehicleDoorLockStatus(vehicle)
    local cur_engine = GetVehicleEngineHealth(vehicle)

    local cur_location = ''
    if Config.ShowLocation then
      if Config.ShowZone then
        local zone = GetNameOfZone(coords.x, coords.y, coords.z)
        cur_location = GetLabelText(zone)
      else
        cur_location = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
      end
    end

    local cur_time = ''
    if Config.ShowTime then
      local cur_hour = string.format("%02d", GetClockHours())
      local cur_min = string.format("%02d", GetClockMinutes())
      cur_time = cur_hour .. ':' .. cur_min
    end

    local cur_speed = GetEntitySpeed(pedId)
    if Config.UseMPH then
      cur_speed = math.floor(cur_speed * mph)
    else
      cur_speed = math.floor(cur_speed * kph)
    end
    local cur_rpm = GetVehicleCurrentRpm(vehicle) * 100
    local cur_gear = tostring(GetVehicleCurrentGear(vehicle))
    if cur_gear == '0' then
      cur_gear = 'R'
    end

    SendNUIMessage({
      type = 'UPDATE_VEHICLE',
      center = Config.SpeedometerInCenter,
      location = cur_location,
      speed = cur_speed,
      rpm = math.floor(cur_rpm),
      gear = cur_gear,
      time = cur_time,
      light = cur_light,
      lock = cur_lock,
      engine = cur_engine,
      fuel = getFuelLevel(vehicle),
    })
  end
end

-- This function updates the player HUD.
local function UpdateHUD(pedId)
  local playerId = PlayerId()
  local cur_health = (GetEntityHealth(pedId) - 100)
  local cur_armor = GetPedArmour(pedId)
  local cur_oxygen = GetPlayerUnderwaterTimeRemaining(playerId) * 10
  local cur_stamina = GetPlayerStamina(playerId)

  if GetPlayerUnderwaterTimeRemaining(playerId) <= 0 then
    cur_oxygen = 0
  end
  if GetEntityHealth(pedId) < 100 then
    cur_health = 0
  end

  SendNUIMessage({
    type = 'UPDATE_HUD',
    health = {cur_health, Config.HealthLimit},
    armor = cur_armor,
    hunger = {cur_hunger, Config.HungerLimit},
    thirst = {cur_thirst, Config.ThirstLimit},
    stamina = cur_stamina,
    oxygen = cur_oxygen,
  })
end



-- This command toggles the UI.
RegisterCommand("toggleUI", function(_, args)
  ui_visibility = not ui_visibility
  SendNUIMessage({
    type = 'TOGGLE_HUD',
    visible = ui_visibility,
  })
end, false)


-- This thread constantly updates the UI based on the state of the player.
CreateThread(function()
  while true do
    Wait(1000)
    if ui_visibility then
      local pedId = PlayerPedId()
      UpdateHUD(pedId)
    end
  end
end)

--This thread constantly hide default GTA HUD elements.
CreateThread(function()
  while true do
    Wait(0)
    if Config.HideRadarOnFoot then
      local pedId = PlayerPedId()
      isInVehicle = IsPedInAnyVehicle(pedId, false)
      DisplayRadar(isInVehicle)
    end
    if Config.DisableHUDElements then
      for _, val in pairs(Config.HUD_ELEMENTS) do
        if val.hidden then
          HideHudComponentThisFrame(val.id)
        end
      end
    end
  end
end)

-- This thread continuously updates the UI based on the state of the current vehicle.
CreateThread(function()
  while true do
    if ui_visibility then
      if isInVehicle then
        local pedId = PlayerPedId()
        UpdateVehicleHUD(pedId)
        Wait(Config.SpeedometerUpdateRate)
      else
        toggleVehicleHUD()
        Wait(1000)
      end
    else
      Wait(1000)
    end
  end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
  Wait(2000)
  --print("OnPlayerLoaded!")
  loadSettings()
  PlayerData = QBCore.Functions.GetPlayerData()
  showHUD()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
  --print("OnPlayerUnload!")
  PlayerData = {}
  hideHUD()
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
  PlayerData = val
end)

RegisterNetEvent('hud:client:UpdateNeeds', function(newHunger, newThirst)
  cur_hunger = newHunger
  cur_thirst = newThirst
end)
