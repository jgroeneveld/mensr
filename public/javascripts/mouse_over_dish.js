  function doMouseOverDishPost (data) {

  var element = $('dish_' + data.id);

  modHideChildren(element, data);

  Event.observe(element, 'mouseover', function() {
    modShowChildren(this, data);
  });

  Event.observe(element, 'mouseout', function() {
     modHideChildren(this, data);
  });

};

function modHideChildren (element, data) {
  if (!data.showStarsForDish) {
    modHideChildrenBySelector(element, '#stars_for_dish_' + data.id)
  };

  if (!data.showStarsForSet) {
    modHideChildrenBySelector(element, '#stars_for_set_d_' + data.id)
  };
};

function modShowChildren (element, data) {
  if (!data.showStarsForDish) {
    modShowChildrenBySelector(element, '#stars_for_dish_' + data.id)
  };

  if (!data.showStarsForSet) {
    modShowChildrenBySelector(element, '#stars_for_set_d_' + data.id)
  };
};

function modHideChildrenBySelector (element, selector) {
  var children = element.getElementsBySelector(selector);

  for (var i = 0; i < children.length; i++) {
    children[i].setStyle({
      visibility: 'hidden'
    });
  };
};


function modShowChildrenBySelector (element, selector) {
  var children = element.getElementsBySelector(selector);

  for (var i = 0; i < children.length; i++) {
    children[i].setStyle({
      visibility: 'visible'
    });
  };
};