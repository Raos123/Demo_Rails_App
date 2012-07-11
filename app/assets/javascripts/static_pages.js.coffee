# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  setupCountdown()
setupCountdown  = ->
  $('#micropost_content').keydown(method).keyup(method)
s = true
method  = ->
  if s
    s = false
    text = 140-$(this).val().length
    text = if text < 0 then "Content is too long." else text+" characters left."
    $('#countdown').text(text)
    s = true