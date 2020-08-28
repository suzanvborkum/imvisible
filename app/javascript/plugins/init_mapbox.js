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

      const container = document.createElement('div');
      const element = document.createElement('div');
      const backgroundElement = document.createElement('div');
      const textElement = document.createTextNode(`${marker.number_of_protests}`);
      const sizes = {
        large: 30,
        medium: 20,
        small: 15,
        none: 0
      }

      element.appendChild(textElement);
      container.appendChild(element);
      container.appendChild(backgroundElement);
      container.className = 'marker-container'
      element.className = 'marker';
      backgroundElement.className = 'marker-pulse';
      element.style.backgroundSize = 'contain';
      if (marker.number_of_protests > 7) {
      element.dataset.size = sizes.large;
      element.style.width = `${sizes.large}px`;
      element.style.height = `${sizes.large}px`;
      backgroundElement.dataset.size = sizes.large ;
      backgroundElement.style.width = `${sizes.large }px`;
      backgroundElement.style.height = `${sizes.large }px`;
      element.style.fontSize = `${sizes.large - 10}px`;
      } else if (marker.number_of_protests > 5) {
        element.dataset.size = sizes.medium;
        element.style.width = `${sizes.medium}px`;
        element.style.height = `${sizes.medium}px`;
        element.style.fontSize = `${sizes.medium - 5}px`;
        backgroundElement.dataset.size = sizes.medium;
        backgroundElement.style.width = `${sizes.medium}px`;
        backgroundElement.style.height = `${sizes.medium}px`;
      } else if (marker.number_of_protests > 0) {
        element.dataset.size = sizes.small;
        element.style.width = `${sizes.small}px`;
        element.style.height = `${sizes.small}px`;
        element.style.fontSize = `${sizes.small - 5}px`;
        backgroundElement.dataset.size = sizes.small;
        backgroundElement.style.width = `${sizes.small}px`;
        backgroundElement.style.height = `${sizes.small}px`;
      } else {
        element.dataset.size = sizes.none;
        element.style.width = `${sizes.none}px`;
        element.style.height = `${sizes.none}px`;
        element.style.fontSize = `${sizes.none}px`;
        backgroundElement.dataset.size = sizes.none;
        backgroundElement.style.width = `${sizes.none}px`;
        backgroundElement.style.height = `${sizes.none}px`;
      }

    const mapboxMarker = new mapboxgl.Marker(container)
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
