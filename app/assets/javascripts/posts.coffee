$ ->
  if $('.pagination').length && $('#my-posts').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("Loading more products...")
        $.getScript(url)
    $(window).scroll()
