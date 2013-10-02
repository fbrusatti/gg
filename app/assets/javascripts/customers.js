$(document).ready(function() {
  $('#customers').dataTable({
    sPaginationType: "full_numbers",
    bJQueryUI: true,
    bProcessing: true,
    bServerSide: true,
    sAjaxSource: $('#customers').data('source')
  });  

  $("a.customer-save").click( function() {
    $("#new_customer, [id^=edit_customer_]").submit();
  });
})  