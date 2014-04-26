// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
 
 //Minimum Password Validation
$(document).on(('ready page:load'), function(){
  document.getElementById("session_form").onclick = function(event)
  {
    if(event.toElement.type == "submit")
    {
      var emailInput = document.getElementById("session_email");;
      var passwordInput = document.getElementById("session_password");;
      var minPassLength = 6

      if(passwordInput.value.length < minPassLength)
      {
        var isBlank = false;
        if(passwordInput.value.length == 0)
        {
          isBlank = true;
        }
        
        passwordInput.value = "";
        var elements = document.getElementsByTagName("INPUT");
          for (var i = 0; i < elements.length; i++)
          {
              
            if(elements[i].name != passwordInput.name)
            {
              continue;
            }

              elements[i].oninvalid = function(e)
                {
                    e.target.setCustomValidity("");
                    if (!e.target.validity.valid)
                    {
                        if(isBlank)
                        {
                          e.target.setCustomValidity("Please fill out this field.");
                        }
                        else
                        {
                          e.target.setCustomValidity("Password must be at least "+minPassLength+" charactors long.");
                        }
                    }
                };
              elements[i].oninput = function(e)
              {
                  e.target.setCustomValidity("");
              };
          }
      }
    }
  }
});