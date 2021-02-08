document.addEventListener("turbolinks:load", function() {
  var progBar = document.querySelector(".progress-bar")
  if (progBar) {changeBar(progBar)}

  function changeBar(progBar) {
    var questNum = progBar.dataset.questNum - 1
    var questTotal = progBar.dataset.questTotal
    var percent = Math.round(questNum/questTotal * 100)
    progBar.textContent = percent + "%"
    progBar.style.width = percent < 1.5 ? "1.5%" : percent + "%" // просто для видимости
  }
})
