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

  
  $("a.save-category").click( function() {
    $("#submit_new_cat").submit();
  });

  $("a.save-vat").click( function() {
    $("#submit_new_vat").submit();
  });

  $(document).on('ajax:success','#new_vat', function(evt, data, status, xhr){
    $('#vat_select')
      .append($("<option></option>")
      .attr("value",data.id)
      .text(data.percentaje) 
    );
    console.log(data)
  });

  $(document).on('ajax:success','#new_category', function(evt, data, status, xhr){
    $('#category_select')
      .append($("<option></option>")
      .attr("value",data.id)
      .text(data.name) 
    );
    console.log(data)
  });

  $('#openBtn-category').click(function(){
    $('#category-modal').modal('show')
  });

  $('#openBtn-vat').click(function(){
    $('#vat-modal').modal('show')
  });
})  