# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
  $(".button_submit").live "click", (e) ->
    e.preventDefault()
    $("#form1").trigger "submit"
    $("#form2").trigger "submit"
