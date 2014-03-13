function post_success(obj, obj_name, target) {
  var form = $('#' + obj_name + '.form-float');
  slideUpRemove(form);
  removeBlur();

  var outerWrap = $('<div class="row">')
  var innerWrap = $('<div class="columns large-10 large-offset-1">')
  innerWrap.append(obj);
  outerWrap.append(innerWrap);
  outerWrap.appendTo('.' + target + '-content');

  coverPhoto();
  initializeMap();
}

function post_fail(obj) {
  obj.insertAfter('.form-title')
  alertCloseBtn(obj)
}