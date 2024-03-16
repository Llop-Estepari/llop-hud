let r = document.querySelector(':root');

let vehicleElement = document.getElementById('vehicle');
let vehicleInfo = document.querySelector('.vehicle-info');

let statusConatiner = document.getElementById('status');

let healthBar = document.getElementById('health-bar');
let healthContainer = document.getElementById('health');
let armorBar = document.getElementById('armor-bar');
let armorContainer = document.getElementById('armor');
let oxygenBar = document.getElementById('oxygen-bar');
let oxygenConatiner = document.getElementById('oxygen');
let staminaBar = document.getElementById('stamina-bar');
let staminaContainer = document.getElementById('stamina');
let hungerBar = document.getElementById('hunger-bar');
let hungerContainer = document.getElementById('hunger');
let thirstBar = document.getElementById('thirst-bar');
let thirstContainer = document.getElementById('thirst');

window.addEventListener('message', (event) => {
  if (event.data.type === 'OPEN') {
    setColorMode(event.data.colorMode);
    updateSide(event.data.position);

  }
  if (event.data.type === 'UPDATE_HUD') {
    updateBarIfLowerThanCustom(healthContainer, healthBar, event.data.health);
    updateBarIfMoreThanZero(armorContainer, armorBar, event.data.armor);
    updateBarIfLowerThanCustom(staminaContainer, staminaBar, [event.data.stamina, 100]);
    updateBarIfLowerThanCustom(oxygenConatiner, oxygenBar, [event.data.oxygen, 100]);
    // Add hunger, and thirst here
  }
  if (event.data.type === 'UPDATE_VEHICLE') {
    updateInfo(document.getElementById('speed'), ('000' + event.data.speed).slice(-3));
    updateRPM(document.getElementById('rpm'), event.data.rpm);
    updateInfo(document.getElementById('gear'), event.data.gear);
    updateOptionalsValues(document.getElementById('location-info'), document.getElementById('location-data'), event.data.location);
    updateOptionalsValues(document.getElementById('time-info'), document.getElementById('time-data'), event.data.time);
    updateLockStatus(event.data.lock);
    updateLightStatus(event.data.light);
    updateEngineHealth(event.data.engine);
    updateOptionalsValues(document.getElementById('fuel-info') ,document.getElementById('fuel-data'), event.data.fuel);
    if (event.data.center) {
      vehicleInfo.classList.add('in-center');
    } else {
      vehicleInfo.classList.remove('in-center');

    }
  }
  if (event.data.type === 'TOGGLE_HUD') {
    document.body.className = event.data.visible ? '' : 'hidden';
  }
  if (event.data.type === 'TOGGLE_VEHICLE') {
    toggleVehicle(event.data.visible)
  }
})

function setColorMode(color) {
  if (color){
    r.style.setProperty('--normal-shadow', '-1px -1px 2px #16161644, 1px -1px 2px #16161644, -1px 1px 2px #16161644, 1px 1px 2px #16161644');
  } else {
    r.style.setProperty('--health-color', '#ececec');
    r.style.setProperty('--armor-color', '#ececec');
    r.style.setProperty('--hunger-color', '#ececec');
    r.style.setProperty('--thirst-color', '#ececec');
    r.style.setProperty('--stamina-color', '#ececec');
    r.style.setProperty('--oxygen-color', '#ececec');
    r.style.setProperty('--text-health-color', '#0f0f0f');
    r.style.setProperty('--text-armor-color', '#0f0f0f');
    r.style.setProperty('--text-hunger-color', '#0f0f0f');
    r.style.setProperty('--text-thirst-color', '#0f0f0f');
    r.style.setProperty('--text-stamina-color', '#0f0f0f');
    r.style.setProperty('--text-oxygen-color', '#0f0f0f');
  }
}

function updateSide(value) {
  if (value === true) {
    statusConatiner.className = 'left-side'
  } else {
    statusConatiner.className = 'bot-side'
  }
}

function updateBarIfMoreThanZero(container, bar, value) {
  bar.style.height = getHeight(value);
  if (value > 0) {
    container.classList.remove('hidden');
  } else {
    container.classList.add('hidden');
  }
}

function updateBarIfLowerThanCustom(container, bar, value) {
  bar.style.height = getHeight(value[0]);
  if (value[0] < value[1]) {
    container.classList.remove('hidden');
  } else {
    container.classList.add('hidden');
  }
}

function getHeight(value) {
  return Math.floor(value) + '%';
}

function updateOptionalsValues(element, label, value) {
  if (value === '') {
    element.classList.add('hidden');
  } else {
    element.classList.remove('hidden');
    label.innerHTML = value;
  }
}

function updateLockStatus(value){
  if (value != 2){
    document.getElementById('lock-status').classList.add('off');
  } else {
    document.getElementById('lock-status').classList.remove('off');
  }
}

function updateLightStatus(value) {
  if (value === 1){
    document.getElementById('light-status').classList.remove('off');
    document.getElementById('light-status').classList.remove('highbeams');
  } else if (value === 2) {
    document.getElementById('light-status').classList.remove('off');
    document.getElementById('light-status').classList.add('highbeams');
  } else {
    document.getElementById('light-status').classList.remove('highbeams');
    document.getElementById('light-status').classList.add('off');
  }
}

let engineStatus = document.getElementById('engine-status');

function updateEngineHealth(value){
  if (value >= 300){
    engineStatus.classList.remove('engine-broken');
    engineStatus.classList.remove('off');
  } else if (value <= 300 && value > -4000) {
    engineStatus.classList.add('engine-broken');
    engineStatus.classList.remove('off');
  } else {
    engineStatus.classList.remove('engine-broken');
    engineStatus.classList.add('off');
  }
}

function updateRPM(el, value){
  el.style.width = value + '%';
  if(value >= 94){
    el.style.background = '#FF554C';
  } else {
    el.style.background = '#ececec'
  }
}

function updateSpeedometer(value) {
  document.getElementById('speed').innerHTML = ('000' + value).slice(-3);
}

function toggleVehicle(visibility){
  vehicleElement.className = visibility ? '' : 'hidden';
}


function updateInfo(element, value) {
  element.innerHTML = value;
}