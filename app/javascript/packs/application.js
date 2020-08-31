require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "animate.css";
import "animate.css"
import "bootstrap";
import "animate.css";
import { initMapbox } from '../plugins/init_mapbox';
import { initSelect2 } from '../plugins/init_select2';
import { collapse } from '../components/collapse';
import { indexScroll, indexScroll2 } from '../components/indexscroll';

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initSelect2();
  collapse();
  indexScroll();
  indexScroll2();
});
