$(document).ready(function() {

    // token to category
  $('#product_category_tokens').tokenInput('/categories.json', {
    crossDomain: false,
    prePopulate: $('#product_category_tokens').data('pre'),
    theme: "facebook",
    tokenLimit: "1",
    noResultsText: "<%= I18n.t('.token_input.noResultsText') %>",
    hintText: "<%= I18n.t('.token_input.hintText_surname')%>",
    searchingText: "<%= I18n.t('.token_input.searchingText')%>",
    resultsFormatter: function(item){
      var referrer = (item.referrer==null? "":"("+item.referrer.name+")")
      return "<li><p style='color: black' >" + item.name+ referrer+ " </p> </li>" },
    tokenFormatter: function(item) {
      var referrer = (item.referrer==null? "":"("+item.referrer.name+")")
      return "<li><p>" + item.name+ referrer+ " </p> </li>" }
  });

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

  $(document).on('ajax:before', '#new_vat', function(){
    if ($("#vat_percentaje").val() == '') {
      return false;
    }
  });

  $(document).on('ajax:success','#new_vat', function(evt, data, status, xhr){
    $('#vat-modal').modal('hide');
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
    $('#category-modal').modal('hide');
  });

  $('#openBtn-category').click(function(){
    $('#category_name').val('');
    $('#category-modal').modal('show')
  });
  $('#openBtn-vat').click(function(){
    $('#vat-modal').modal('show')
  });

})// End Document
