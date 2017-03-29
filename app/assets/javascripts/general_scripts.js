(function(forms){
  forms.forEach(function(form){
    Array.from(form.elements).forEach(function(element, index){
      addMultipleEventListener(element,['keyup','change']);
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
