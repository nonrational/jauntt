(function() {

  $(document).on('click', '.current-user-name', function() {
    var $this = $(this),
        $form = $this.parent().find('.hidden');

    $this.hide();
    $form.show().focus();

    $(document).one('click', function() {
      $form.hide();
      $this.show();
    });
  });

})();
