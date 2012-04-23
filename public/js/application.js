(function($) {
  $(function() {
    $('input.lookup').click(function() {
      var ip = $('input#ip').val();
      (ip === '') ? alert('Lookup is blank. Please enter a value.') :
        window.location = "/" + ip;
    });
  });
})(jQuery);
