$(document).ready(function() {
  $('#product-table').dataTable({
    oLanguage: {
      sUrl: "/datatables/spanish.txt"
    },
    asSorting: [],
    sPaginationType: "full_numbers",
    bJQueryUI: true,
    bProcessing: true,
    bServerSide: true,
    sAjaxSource: $('#product-table').data('source')
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

  $(document).on('ajax:before', '#new_vat', function(){
    if ($("#vat_percentaje").val() == '') {
      return false;
    }
  });

  $(document).on('ajax:success','#new_vat', function(evt, data, status, xhr){
    $('#vat_select')
      .append($("<option></option>")
      .attr("value",data.id)
      .text(data.percentaje)
    );
  });

  $(document).on('ajax:before', '#new_category', function(){
    if ($("#category_name").val() == '') {
      return false;
    }
  });

  $(document).on('ajax:success','#new_category', function(evt, data, status, xhr){
    $('#category_select')
      .append($("<option></option>")
      .attr("value",data.id)
      .text(data.name)
    );
  });

  $('#openBtn-category').click(function(){
    $('#category-modal').modal('show')
  });

  $('#openBtn-vat').click(function(){
    $('#vat-modal').modal('show')
  });
})