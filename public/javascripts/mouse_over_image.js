Event.observe(window, 'load', function() {
  var elements = $$('.mouse_over_image');

  for (var i = 0; i < elements.length; i++) {
    elements[i].setOpacity(0.5);
  };


  for (var i = 0; i < elements.length; i++) {
    Event.observe(elements[i], 'mouseover', function() {
      this.setOpacity(1);
    });

    Event.observe(elements[i], 'mouseout', function() {
      this.setOpacity(0.5);
    });
  };
});