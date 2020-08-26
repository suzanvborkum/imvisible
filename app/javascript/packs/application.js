require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")



import "bootstrap";
import { initMapbox } from '../plugins/init_mapbox';
import { initSelect2 } from '../plugins/init_select2';


document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initSelect2();
});
