$(document).ready(function() {

  $(document).keydown(function(event) {
    var button = event.which;
    if(button == 49 || button == 97 ) { //1
      $("a#invoice").on("click", function() { location.href = this.href; }).click();
    }
    if(button == 50 || button == 98 ) { //2
      $("a#budget").on("click", function() { location.href = this.href; }).click();
    }
  });

});
