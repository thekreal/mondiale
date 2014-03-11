function setToMiddle(obj) {
  setXtoM(obj);
  setYtoM(obj);
}

function setXtoM(obj) {
  obj.offset({ left: ($(window).width() - obj.width()) / 2 })
}

function setYtoM(obj) {
  obj.offset({ top: ($(window).height() - obj.height()) / 2 })
}

function windowHeight(minHeight) {
  return $(window).height() < minHeight ? minHeight : $(window).height();
}

function setHeight(obj, minHeight) {
  minHeight = minHeight || -1
  obj.outerHeight(windowHeight(minHeight));
}