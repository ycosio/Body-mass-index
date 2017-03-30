document.addEventListener('DOMContentLoaded', function(){
  document.getElementsByName('commit')[0].addEventListener('click', function(event){
    localStorage.clear();
  });
}, false);

(function(forms){
  forms.forEach(function(form){
    Array.from(form.elements).forEach(function(element, index){
      addMultipleEventListener(element,['keyup','change']);
      restoreStorage(element);
    });
  });
})(Array.from(document.forms));

function addMultipleEventListener(element,events){
  events.forEach(function(events){
    element.addEventListener(events, function(event){
      let value = element.type == 'checkbox' ? element.checked : element.value
      localStorage.setItem(element.name, value);
    });
  });
}

function restoreStorage(element){
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
