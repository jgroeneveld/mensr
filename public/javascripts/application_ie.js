function center_element_ie(element_name) {
  $(element_name).style.left =
          (document.body.offsetWidth / 2) - ($(element_name).offsetWidth / 2) +"px";
}