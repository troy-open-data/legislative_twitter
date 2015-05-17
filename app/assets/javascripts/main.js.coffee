ready = ->
  $(document).foundation()
  $('#admin-toggle').click(->
    $('.admin').toggle(600)
  )

$(document).ready(ready)
$(document).on('page:load', ready)

# bills.js.coffee
#
# ready = ->
#   $('.jqte-test').jqte()
#
# $(document).ready(ready)
# $(document).on('page:load', ready)