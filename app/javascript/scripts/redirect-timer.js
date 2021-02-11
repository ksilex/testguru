document.addEventListener("turbolinks:load", function() {
  var timerDiv = document.querySelector(".timerDiv")
  if (timerDiv) {startTimer()}

  function startTimer() {
    var timer = timerDiv.textContent
    var hms = timer.split(":").map(Number)
    var seconds_total = hms[0] * 3600 + hms[1] * 60 + hms[2]
    setInterval(function() {
      --seconds_total
      var hours = seconds_total/3600
      var minutes = seconds_total/60%60
      var seconds = seconds_total%60
      timerDiv.textContent = `${Math.trunc(hours)}:${Math.trunc(minutes)}:${seconds}`
    }, 1000)
  }
})
