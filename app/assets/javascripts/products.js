$(document).ready(function() {
  $('#products').dataTable({
    oLanguage: {
      sUrl: "/datatables/spanish.txt"
    },
    sPaginationType: "full_numbers",
    bJQueryUI: true,
    bProcessing: true,
    bServerSide: true,
    sAjaxSource: $('#products').data('source')
  });

  $("a.product-save").click( function() {
    $("#new_product, [id^=edit_product_]").submit();
  });

  $(document).on('ajax:success','#new_category', function(evt, data, status, xhr){
    $('#new_category_modal').modal('toggle');
    // console.log("sdfafasfafasf")
  });

  $("a.save-category").click( function() {
    $("#submit_cat").submit();
  });

  $('#openBtn-category').click(function(){
    $('#category-modal').modal({show:true})
  });

  $('#openBtn-vat').click(function(){
    $('#new_vat').modal({show:true})
  });
})