const goshuinFormMap = () => {
  const mapElement = document.getElementById("goshuin-map");

  if (!mapElement) return;

  const latitudeField = document.getElementById("goshuin-latitude")
  const longitudeField = document.getElementById("goshuin-longitude")

  const map = L.map(mapElement).setView([35.681236, 139.767125], 13);

  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution: "&copy; OpenStreetMap contributors"
  }).addTo(map);

  let marker;

  map.on("click", (e) => {
    const lat = e.latlng.lat;
    const lng = e.latlng.lng;

    latitudeField.value = lat;
    longitudeField.value = lng;

    console.log(latitudeField.value);
    console.log(longitudeField.value);
    
    if (marker) {
    marker.setLatLng(e.latlng);
    } else {
    marker = L.marker(e.latlng).addTo(map);
    }
  });
};

// 詳細機能
const goshuinShowMap = () => {
  const showMapElement = document.getElementById("goshuin-show-map");
  if (!showMapElement) return;
  const latitude = showMapElement.dataset.latitude;
  const longitude = showMapElement.dataset.longitude;
  const placeName = showMapElement.dataset.placeName;

  const map = L.map(showMapElement).setView([latitude, longitude], 13);

   L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution: "&copy; OpenStreetMap contributors"
  }).addTo(map);

  L.marker([latitude, longitude]).addTo(map).bindPopup(placeName).openPopup();

};

// 編集機能 
const goshuinEditMap = () => {
  const editMapElement = document.getElementById("goshuin-edit-map");
  if (!editMapElement) return;
  const latitude = editMapElement.dataset.latitude
  const longitude = editMapElement.dataset.longitude
  const placeName = editMapElement.dataset.placeName

  const latitudeField = document.getElementById("goshuin-latitude")
  const longitudeField = document.getElementById("goshuin-longitude")

  let marker;
  let map;
  if (latitude && longitude) {
    map = L.map(editMapElement).setView([latitude, longitude], 13);
    marker = L.marker([latitude, longitude]).addTo(map).bindPopup(placeName).openPopup();
  } else { 
    map = L.map(editMapElement).setView([35.681236, 139.767125], 13);
  }
  
  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution: "&copy; OpenStreetMap contributors"
  }).addTo(map);
  

  map.on("click", (e) => {
    const lat = e.latlng.lat;
    const lng = e.latlng.lng;

    latitudeField.value = lat;
    longitudeField.value = lng;

    if (marker) {
      marker.setLatLng(e.latlng);
    } else {
      marker = L.marker(e.latlng).addTo(map);
    }
  });
};

// 全体マップ
const goshuinAllMap = () => {
  const allMapElement = document.getElementById("goshuin-all-map");
  if (!allMapElement) return;
  const goshuinsData = document.querySelectorAll(".goshuin-map-data")
  
  const map = L.map(allMapElement).setView([35.681236, 139.767125], 5);
  
  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution: "&copy; OpenStreetMap contributors"
  }).addTo(map);

  goshuinsData.forEach((goshuinData) => {
    const latitude = goshuinData.dataset.latitude;
    const longitude = goshuinData.dataset.longitude;
    const placeName = goshuinData.dataset.placeName;
    if (latitude && longitude) {
      L.marker([latitude, longitude]).addTo(map).bindPopup(placeName);
    }
  });
};

window.addEventListener("turbo:load", goshuinFormMap);
window.addEventListener("turbo:load", goshuinShowMap);
window.addEventListener("turbo:load", goshuinEditMap);
window.addEventListener("turbo:load", goshuinAllMap);