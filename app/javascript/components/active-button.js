const activeButton = () => {
  $(document).ready(function(){
    $(".form-check-experienced-label").click(function(){
      $(this).toggleClass("active");
      console.log(this)
    });
  });
}

export { activeButton };
