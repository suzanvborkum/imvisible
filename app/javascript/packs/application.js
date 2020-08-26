require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "animate.css"
import "bootstrap";
import { initMapbox } from '../plugins/init_mapbox';
import { initSelect2 } from '../plugins/init_select2';
import { collapse } from '../components/collapse';

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initSelect2();
  collapse();
});
