(function($) {
  $(function() {
    $('form.lookup').submit(function() {
      var ip = $('input#ip').val();
      (ip === '') ? alert('Lookup is blank. Please enter a value.') :
        window.location = "/" + ip;
      return false;
    });
  });
})(jQuery);
