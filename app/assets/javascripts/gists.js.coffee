$(document).ready ->
  $(".row").infinitescroll
    navSelector: "ul.pagination" # selector for the paged navigation (it will be hidden)
    nextSelector: "ul.pagination a[rel=next]" # selector for the NEXT link (to page 2)
    itemSelector: ".row div.col-sm-6.col-md-4" # selector for all items you'll retrieve



# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
