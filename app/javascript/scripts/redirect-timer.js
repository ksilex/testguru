document.addEventListener("turbolinks:load", function() {
  var controls = document.querySelectorAll(".start-link")

  for (var i = 0; i < controls.length; i++) {
    controls[i].addEventListener("click", startTimer)
  }

})

function startTimer() {
}
