function update_rating_stars (identifier, i) {
  for (var j=0; j < 5; j++) {
    $("star_filled_" + identifier + "_" + j).hide();
    $("star_empty_" + identifier + "_" + j).show();      
  };

  for (var j=0; j <= i; j++) {
    $("star_filled_" + identifier + "_" + j).show();
    $("star_empty_" + identifier + "_" + j).hide();      
  };    
}