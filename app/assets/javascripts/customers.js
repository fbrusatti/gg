$(document).ready(function() {

  var customerTable = $('#customers-table').dataTable({
    oLanguage: {
      sUrl: "/datatables/spanish.txt"
    },
    sPaginationType: "full_numbers",
    bJQueryUI: true,
    bProcessing: true,
    bServerSide: true,
    sAjaxSource: $('#customers-table').data('source'),
    "aoColumns": [
      { "sName": "name" },
      { "sName": "surname" },
      { "sName": "dni" },
      { "sName": "address" },
      { "sName": "phone" },
      { "sName": "mobile_phone" },
      { "sName": "email" }
    ],
    fnInitComplete: function(oSettings, json) {
      var keys = new KeyTable( {
        "table": document.getElementById('customers-table')
      }); // keyTable

      /* Apply a return key event to each cell in the table */
      keys.event.action( null, null, function (nCell) {
          /* Block KeyTable from performing any events while jEditable is in edit mode */
          keys.block = true;
          /* Initialise the Editable instance for this table */
          var column = customerTable.fnGetPosition(nCell)[1];
          /* column one = 0 is disable */
          if(column != 0) {
            $(nCell).editable( function (sVal) {
              /* Submit function (local only) - unblock KeyTable */
              keys.block = false;
              return sVal;
              }, {
                onblur: 'submit',
                method: "PUT",
                callback : function(value, settings) {
                  var aPos, aData, link, columName, dataString, dataJson;
                  aPos = customerTable.fnGetPosition(this); //[0, 2, 2]
                  aData = customerTable.fnGetData( aPos[0] ); // aPos[0] get row
                  link = $(aData[0]).attr('href');
                  columName = oSettings.aoColumns[aPos[1]].sName;
                  dataString = '{ "customer": { "'+columName+'":  "'+value+'"} }'
                  dataJson = $.parseJSON(dataString);
                  $.ajax({
                    type: "PUT",
                    url: link,
                    data: dataJson,
                    dataType: "JSON"
                   });
                 },
                onreset: function(){
                    /* Unblock KeyTable, but only after this 'esc' key event has finished. Otherwise
                     * it will 'esc' KeyTable as well
                     */
                    setTimeout( function () {keys.block = false;}, 0);
                }
            }) }
          else {
            setTimeout( function () {keys.block = false;}, 0);
          };
          /* Dispatch click event to go into edit mode - Saf 4 needs a timeout... */
          setTimeout( function () { $(nCell).click(); }, 0 );
    } );
  } // fnInitComplete
  }); // datatable
} ); // Ready


$(document).ready(function() {

  $("a.customer-save").click( function() {
    $("#new_customer, [id^=edit_customer_]").submit();
  });
})


