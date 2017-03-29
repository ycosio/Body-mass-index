(function(forms){

  forms.forEach(function(form){
    Array.from(form.elements).forEach(function(element, index){
        element.addEventListener('keyup', function(event){localStorage.setItem(element.name,  element.value)});
        element.addEventListener('change', function(event){localStorage.setItem(element.name, function(){
          if(element.type == 'checkbox')
            return element.checked
          else
            return element.value
        }(element))});
    });
  });

})(Array.from(document.forms));
