document.addEventListener("turbolinks:load", function() {
  var pass_field = document.querySelector("#user_password")
  var pass_conf_field = document.querySelector("#user_password_confirmation")
  if (pass_field && pass_conf_field) {
    [pass_field, pass_conf_field].forEach(function(element) {
      element.addEventListener("input", checkFields);
    })
  }

  function checkFields() {
    if (pass_conf_field.value == "") {
      pass_conf_field.style.border = "none";
      pass_field.style.border = "none";
      document.querySelector(".input-group-append").style.display = "none"
    }
    else if (pass_field.value == pass_conf_field.value) {
      pass_conf_field.style.border = "1px solid green"
      pass_field.style.border = "1px solid green"
      document.querySelector(".input-group-append").style.display = "none"
    }
    else {
      pass_conf_field.style.border = "1px solid red";
      pass_field.style.border = "1px solid red";
      document.querySelector(".input-group-append").style.display = "inline"
    }
  }
})
