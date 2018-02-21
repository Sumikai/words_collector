bookmark_icon = ->
  $("#bookmark-link").click 'ajax:success', ->
    $(this).children('i').toggleClass("changed");
  
$(document).on('page:change', bookmark_icon);

#bookmark_icon = ->
 # $("#bookmark-link").click ->
    #$(this).children('i').toggleClass('fa-bookmark-o')

#$(document).on('page:change', bookmark_icon)