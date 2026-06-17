const goshuinMap = () => {
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

    console.log(lat);
    console.log(lng);

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

window.addEventListener("turbo:load", goshuinMap);