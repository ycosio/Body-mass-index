var MyApp = {
  Elements   : {},
  Actions    : {},
  Initialize : function(){
    MyApp.wrapElements();
    MyApp.bindEvents();
  }
};

/*List of DOM Elements*/
MyApp.wrapElements = function(){
    MyApp.Elements.commit = document.querySelector('[name="commit"]');
    MyApp.Elements.inputs = Array.from(document.forms).map(function(form){
      return Array.from(form.elements)
    });
};

/* Wire DOM Elements with myApp Actions*/
MyApp.bindEvents = function(){
  MyApp.Elements.commit.addEventListener('click', MyApp.Actions.clearLocalStorage);
  MyApp.Elements.inputs.forEach(function(form){
    form.forEach(function(element){
      MyApp.Actions.addMultipleEventListener(element,['keyup','change']);
      MyApp.Actions.restoreStorage(element);
    });
  });
};

//Clear Local Storage
MyApp.Actions.clearLocalStorage = function(){
  localStorage.clear();
};

// Multiple Event Listener
MyApp.Actions.addMultipleEventListener = function(element,events){
  events.forEach(function(events){
    element.addEventListener(events, function(event){
      let value = element.type == 'checkbox' ? element.checked : element.value
      localStorage.setItem(element.name, value);
    });
  });
}

// Restore Storage
MyApp.Actions.restoreStorage = function(element){
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
}

window.addEventListener('load',  MyApp.Initialize, false);
