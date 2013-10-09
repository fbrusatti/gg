$(document).ready(function() {
  $('#products').dataTable({
    sPaginationType: "full_numbers",
    bJQueryUI: true,
    bProcessing: true,
    bServerSide: true,
    sAjaxSource: $('#products').data('source')
  });  

  $("a.product-save").click( function() {
    $("#new_product, [id^=edit_product_]").submit();
  });
})  