var timer, length_str = 27, length_item = 4;
$(document).on('keyup', '#posts-search', function() {
  clearTimeout(timer);
  timer = setTimeout(function () {
    var search = $('#posts-search').val();
    $.ajax({
      url: '/searches?search=' + search,
      context: document.body,
      dataType: 'json'
    }).done(function(data) {
      $('.results').empty();
      var posts = data.results["posts"];
      if(posts.length) {
        for (var i = 0; i < posts.length; i++) {
          $('.results').append('<a href="/posts/' + posts[i].slug
            +'"></span><span class="posts-search-str">'
            + posts[i].title.substring(0, length_str) + '</span></li></a><hr>');
          if(i == length_item) break;
        }
      }
      $('.results').append('<a href="/searches?search=' + search);
    });
  }, 500);
});

document.addEventListener('turbolinks:load', function() {
  $(document).on('submit', '.form-search', function(e) {
    if($('.posts-search').val() == '')
      e.preventDefault();
  });
});
