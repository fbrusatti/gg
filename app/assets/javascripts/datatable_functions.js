// multi select row of datatable
function multiSelectedRow(oTable, idTable){
  var giRedraw = false
  // Add a click handler to the rows - this could be used as a callback
  $( idTable + " tbody").click(function(event) {
    if ($(event.target).closest('tr').hasClass('row_selected'))
      $(event.target).closest('tr').removeClass('row_selected');
    else
      $(event.target).closest('tr').addClass('row_selected');
  });
}

// select row of datatable
function rowSelected(oTable, idTable){
  var giRedraw = false
  // Add a click handler to the rows - this could be used as a callback
  $( idTable + " tbody").click(function(event) {
    $(oTable.fnSettings().aoData).each(function (){
      $(this.nTr).removeClass('row_selected');
    });
    $(event.target).closest('tr').addClass('row_selected');
  });
  // Add a click handler for the delete row
  $('#delete').click( function() {
    var anSelected = fnGetSelected( oTable );
    oTable.fnDeleteRow( anSelected[0] );
  } );
}

// Get the rows which are currently selected
function fnGetSelected( oTableLocal ){
  var aReturn = new Array();
  var aTrs = oTableLocal.fnGetNodes();
  for ( var i=0 ; i<aTrs.length ; i++ ){
    if ( $(aTrs[i]).hasClass('row_selected') ){
      aReturn.push( oTableLocal.fnGetData( aTrs[i] ) );
    }
  }
  return aReturn;
}

// handle the datatable with keyboard
// example idModals: "#calculator-modal, #contract-modal"
function datatableKeyboard(idTable, idModals){
  $(document).keydown(function (event) {
    // prevent row enter when some modal was open
    if (!($(idModals).hasClass('in'))){
      var currentRow = $( idTable + ' .row_selected').get(0);
      switch(event.keyCode){
        case 9: // tab
          event.preventDefault();
          $( idTable + '_filter input').focus();
          break;
        case 40: //arrow down
          if ($(currentRow).next().length != 0) {
            $(currentRow).next().addClass("row_selected");
            $(currentRow).removeClass("row_selected");
          }
          break;
        case 38: //arrow up
          if ($(currentRow).prev().length != 0) {
            $(currentRow).prev().addClass("row_selected");
            $(currentRow).removeClass("row_selected");
          }
          break;
        case 13: //enter
          var row = $(".row_selected td:first a");
          if (row.length) {
            row[0].click()
          }
          break;
      }
    }
  });
  // select the first datatable's row when enter is pressed
  $(document).on('keyup', idTable + '_filter input', function(event){
    var nothingSelected = $(idTable + ' .row_selected').length == 0;
    if (event.which == 13 && nothingSelected){
      $(idTable + ' tbody tr:first td:first').click()
    }
  });
}


