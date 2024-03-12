let vehicle = false;

let vehicleElement = document.getElementById('vehicle');

window.addEventListener('message', (event) => {
  if (event.data.type === 'UPDATE_HUD') {
    updateBar(document.getElementById('health-bar'), event.data.health);
    updateBar(document.getElementById('armor-bar'), event.data.armor);
    // document.getElementById('hunger-bar').style.width = event.data.hunger
    // document.getElementById('thirst-bar').style.width = event.data.thirst
    updateBar(document.getElementById('stamina-bar'), event.data.stamina);
    updateBar(document.getElementById('oxygen-bar'), event.data.oxygen);
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
  }
  if (event.data.type === 'TOGGLE_HUD') {
    document.body.className = event.data.visible ? '' : 'hidden';
  }
  if (event.data.type === 'TOGGLE_VEHICLE') {
    toggleVehicle(event.data.visible)
  }
})


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

function updateBar(bar, value) {
  value = Math.floor(value);
  bar.style.height = value + '%';
}

function updateInfo(element, value) {
  element.innerHTML = value;
}