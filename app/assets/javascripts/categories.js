$(document).ready(function() {

  $(function () {
    $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
    $('.tree li.parent_li > span').on('click', function (e) {
      var children = $(this).parent('li.parent_li').find(' > ul > li');
      if (children.is(":visible")) {
        children.hide('fast');
        $(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-arrow-up').removeClass('icon-arrow-down');
      } else {
        children.show('fast');
        $(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-arrow-down').removeClass('icon-arrow-up');
      }
      e.stopPropagation();
    });
  });

})// End Document
