import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  console.log()
  $('#protest_station_id').select2({
    theme: 'bootstrap4', placeholder: "Escoge Una Estación",
    width: "100%"
    });
};

export { initSelect2 };
