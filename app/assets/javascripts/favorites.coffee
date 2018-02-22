bookmark_icon = ->
  $('#bookmark-link').click ->
    $(this).children('i').toggleClass('fa-bookmark-o')

$(document).ready(bookmark_icon)
$(document).on('turbolinks:load', bookmark_icon) #'turbolinks:load'によって、turbolinksをoffにすることなくjQueryが読み込める