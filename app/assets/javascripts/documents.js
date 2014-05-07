$(document).ready(function() {

  $(document).keydown(function(event) {
    var button = event.which;
    if(button == 49 || button == 97 ) { //1
      $("a#invoice").on("click", function() { location.href = this.href; }).click();
    }
    if(button == 50 || button == 98 ) { //2
      $("a#budget").on("click", function() { location.href = this.href; }).click();
    }
    if(button == 51 || button == 99 ) { //3
      $("a#receipt").on("click", function() { location.href = this.href; }).click();
    }
  });

  // index document
  //
  var documentsTable;
  documentsTable = $('#documents #documents_table').dataTable({
    sPaginationType: "full_numbers",
    bAutoWidth: false,
    bJQueryUI: true,
    bProcessing: true,
    bServerSide: true,
    sAjaxSource: $('#documents #documents_table').data('source'),
    "aaSorting": [[ 1, "desc" ]],
    fnInitComplete: function(oSettings, json){
      $("thead th").each( function (i) {
          $('select', this).change( function () {
            documentsTable.fnFilter($(this).val(),i);
           });
      });
    },
    oLanguage: {
      sUrl: "/datatables/spanish.txt"
    }
  });

});
