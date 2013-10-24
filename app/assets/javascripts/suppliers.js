$(document).ready(function() {
  $('#suppliers-table').dataTable({
    oLanguage: {
      sUrl: "/datatables/spanish.txt"
    },
    sPaginationType: "full_numbers",
    bJQueryUI: true,
    bProcessing: true,
    bServerSide: true,
    sAjaxSource: $('#suppliers-table').data('source')
  });  

  $("a.supplier-save").click( function() {
    $("#new_supplier, [id^=edit_supplier_]").submit();
  });
})  