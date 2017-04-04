Bm.Initializers.index = function(){
  Bm.Elements.wrapElements();
  Bm.Actions.bindEvents();
  Bm.Actions.proccesingLocalStorage(Bm.Elements.forms);
};

window.addEventListener('load',  Bm.Initializers.index, false);

