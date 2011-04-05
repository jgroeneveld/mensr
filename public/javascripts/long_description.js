function handleTooLongDishDescriptions() {
  var elements = $$('.dish_description');

  for (var i = 0; i < elements.length; i++) {
    var element = elements[i];

    var divHeight = element.offsetHeight;
    if (divHeight > 96) {
      element.className += ' too_long';
    }
  }
}