const activeButton = () => {
  $(document).ready(function(){
    $(".form-check-experienced-input").click(function(){
      $(this).toggleClass("active");
    });
  });
}

export { activeButton };
