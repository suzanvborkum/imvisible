import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  // map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/suzanvborkum/ckebev08e0nq219rd7gssbo35',
      center: [-99.13, 19.43],
      zoom: 11
    });
    map.addControl(new mapboxgl.NavigationControl());
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundSize = 'contain';
    element.style.width = '15px';
    element.style.height = '15px';

    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
    fitMapToMarkers(map, markers)
  }
};


export { initMapbox };
