// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function center_element(element_name) {
  if(!$(element_name))
    return;
  if(typeof center_element_ie == 'function')
    center_element_ie(element_name);
  else
    $(element_name).style.left = (window.innerWidth / 2) - ($(element_name).offsetWidth / 2) +"px";
}

function show_flash (text, className) {
  var flash_div = $(document.createElement("div"));
  var flash_type = className || "notice";
  flash_div.addClassName(flash_type);
  flash_div.appendChild(document.createTextNode(text));
  $('flashes').appendChild(flash_div);
  center_element('flashes');
  flash_div.hide();
  Effect.BlindDown(flash_div, {duration: 0.5});
  setTimeout(function () {new Effect.Fade(flash_div);}, 5000);
}