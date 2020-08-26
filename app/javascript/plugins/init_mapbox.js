import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v11',
      center: [-99.13, 19.43],
      zoom: 11,
      maxZoom : 17,
      minZoom : 11
    });
    map.addControl(new mapboxgl.NavigationControl());
    const markersArray = []

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      const element = document.createElement('div');
      const textElement = document.createTextNode(`${marker.number_of_protests}`);

      element.appendChild(textElement);
      element.className = 'marker';
      element.style.backgroundSize = 'contain';
      if (marker.number_of_protests > 7) {
      element.dataset.size = '30'
      element.style.width = '30px';
      element.style.height = '30px';
      element.style.fontSize = '20px';
      } else if (marker.number_of_protests > 5) {
        element.dataset.size = '20'
        element.style.width = '20px';
        element.style.height = '20px';
        element.style.fontSize = '15px';
      } else if (marker.number_of_protests > 0) {
        element.dataset.size = '15'
        element.style.width = '15px';
        element.style.height = '15px';
        element.style.fontSize = '10px';
      } else {
        element.dataset.size = '0'
        element.style.width = '0px';
        element.style.height = '0px';
        element.style.fontSize = '0px';
      }

    const mapboxMarker = new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
      markersArray.push(mapboxMarker)
  });
    map.on('zoom', function(event) {
      console.log(map.getZoom())
      markersArray.forEach(marker => {
        const size = (map.getZoom() * +marker.getElement().dataset.size) / 9
        console.log(size)
        marker.getElement().style.width = `${size}px`
        marker.getElement().style.height = `${size}px`
      })
    });
  }
};

export { initMapbox };
