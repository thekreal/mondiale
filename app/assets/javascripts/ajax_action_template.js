function post_success(obj, obj_name, target) {
  var form = $('#' + obj_name + '.form-float');
  slideUpRemove(form);
  removeBlur();

  obj.appendTo(target);

  coverPhoto();
  initializeMap();
}

function post_fail(obj) {
  obj.insertAfter('.form-title')
  alertCloseBtn(obj)
}