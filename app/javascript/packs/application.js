import "bootstrap";
import { hoverCard } from './hover-card';
// import { star_rating } from './star_rating'
// star_rating();
hoverCard();

import mapboxgl from 'mapbox-gl';
const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
  // [ ... ]
      mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
  const markers = JSON.parse(mapElement.dataset.markers);
  markers.forEach((marker) => {
    new mapboxgl.Marker()
    .setLngLat([ marker.lng, marker.lat ])
    .addTo(map);
  });
    fitMapToMarkers(map, markers);
}
}

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

initMapbox();


