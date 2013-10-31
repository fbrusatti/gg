    /***************
    DATE-TIME-PICKER
    ****************/

$(document).ready(function(){
  $('.check_date_time_picker').datetimepicker({
    language: 'es',
    pickDate: true,
    pickTime: false,
    maskInput: true,
    pick12HourFormat: true,
    pickSeconds: false,
    format: 'dd/MM/yyyy',
    startDate: 1910,
    endDate: Infinity
  });

  $("a.check-save").click(function() {
    $("a.check-save").attr("disabled", true);
    $("#new_check, [id^=edit_check_]").submit();
  });

});