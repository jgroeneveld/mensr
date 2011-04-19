function makeSortable(containerID, responseURL) {
  Sortable.create(containerID, {
    tag: 'div',
    overlap: 'horizontal',
    constraint: '',
    handle: 'drag_handle',
    scroll: window,
    onUpdate: function() {
      var seq = Sortable.serialize(containerID);

      new Ajax.Request(responseURL, {
        method: "post",
        parameters: { data: seq }
      });
    }
  });
}