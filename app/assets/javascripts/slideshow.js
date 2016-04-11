setInterval(function() {
  $.post('next',
         {current_id: $('#slide-presenter').data('id')},
         function(data) {
           $('#slide-presenter').data('id', data.id);
           $('#slide-presenter').attr('src', data.url);
         },
         'json');
}, 10000);
