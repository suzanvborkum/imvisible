const loadModal = () => {
  $(document).ready(function(){
    if(window.location.href.match(/[?]/)) {
      $("#protestModalCenter").modal('show');
    }
  });
}

export { loadModal }
