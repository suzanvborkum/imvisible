require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "animate.css"
import "bootstrap";
import { initMapbox } from '../plugins/init_mapbox';



document.addEventListener('turbolinks:load', () => {
  initMapbox();
});
