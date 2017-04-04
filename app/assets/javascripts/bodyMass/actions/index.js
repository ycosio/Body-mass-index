/* Wire DOM Elements with myApp Actions*/
Bm.Actions.bindEvents = function(){
  Bm.Elements.commit.addEventListener('click', Bm.Actions.clearLocalStorage);
  // Add individual EventListener(event, setItem) for every element
  // addMultipleEvent function is trabsformed in setItem
};

//Clear Local Storage
Bm.Actions.clearLocalStorage = function(){
  localStorage.clear();
};

// Multiple Event Listener
Bm.Actions.addMultipleEventListener = function(element,events){
  events.forEach(function(events){
    element.addEventListener(events, function(event){
      let value = element.type == 'checkbox' ? element.checked : element.value
      localStorage.setItem(element.name, value);
    });
  });
};

// Restore Storage
Bm.Actions.restoreStorage = function(element){
  let value = localStorage[element.name]
  if(value){
    switch(element.type){
      case 'text':
        element.value = value
      break;
      case 'checkbox':
        element.checked = value == "true"
      break;
      case 'radio':
        element.checked = value == element.value
      break;
      default:
        element.innerHTML = value
    }
  }
};

// Proccesing Local Storage
// Use Bm.Elements.forEach just with Bm.Actions.restoreStorage
Bm.Actions.proccesingLocalStorage = function(){
  Bm.Elements.forms.forEach(function(form){
    Array.from(form.elements).forEach(function(element){
      Bm.Actions.addMultipleEventListener(element,['keyup','change']);
      Bm.Actions.restoreStorage(element);
    });
  });
};
