# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  setupCountdown()
setupCountdown  = ->
  $('#micropost_content').change(method).keyup(method)
method  = ->
  if $(this).val().length > 140
    $(this).val($(this).val().substr(0, 140))
  $('#countdown').text( 140 - $(this).val().length+" characters left")