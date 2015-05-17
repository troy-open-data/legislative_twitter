ready = ->
  $(document).foundation()
  # $('.jqte-test').jqte()
  $('.datetimepicker').datetimepicker({
    inline: true
  })
  $('.geocomplete').geocomplete()
  $('#admin-toggle').click(->
    $('.admin').toggle(600)
  )

$(document).ready(ready);
$(document).on('page:load', ready);