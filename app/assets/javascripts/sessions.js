// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('ready page:load'), function(){
document.getElementById("session_form").onclick = function(event)
{
    
  var emailInput = document.getElementById("session_email");
  var passwordInput = document.getElementById("session_password");

  if(event.toElement.type == "submit")
  {
    if(emailInput.value == "")
    {
      //emailInput.placeholder =    "Email                                 *required";
      if(emailInput.required == false || emailInput.required == null || typeof(emailInput.required) == "undefined")
      {
        //event.preventDefault();
      }
    }

    if(passwordInput.value.length < 6)
    {
      //passwordInput.placeholder =   "Password                          *required";
      if(passwordInput.required == false || passwordInput.required == null || typeof(passwordInput.required) == "undefined")
      {
        //event.preventDefault();
      }
      event.preventDefault();
    }
  }
  else
  {
    //emailInput.placeholder = "Email";
    //passwordInput.placeholder = "Password";
  }
}
});