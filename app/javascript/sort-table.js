document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.sortable-th')
  if (control) { control.addEventListener('click', sortRowsByTH) }
})


function sortRowsByTH() {
  var table = document.querySelector('table')

  var rows = table.querySelectorAll('tr')
  var sortedRows = []

  for (var i = 1; i < rows.length; i++) {
      sortedRows.push(rows[i])
  }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
      sortedRows.sort(compareRowsAsc)
      this.querySelector('.octicon-arrow-up').classList.remove('hide')
      this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
      sortedRows.sort(compareRowsDesc)
      this.querySelector('.octicon-arrow-down').classList.remove('hide')
      this.querySelector('.octicon-arrow-up').classList.add('hide')
  }

  var sortedTable = document.createElement('table')
  sortedTable.classList.add('table')
  sortedTable.innerHTML = "<thead></thead><tbody></tbody>"
  sortedTable.querySelector("thead").appendChild(rows[0])

  for (var i = 0; i < sortedRows.length; i++) {
      sortedTable.querySelector("tbody").appendChild(sortedRows[i])
  }

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  var testTh1 = row1.querySelectorAll('td')[1].textContent
  var testTh2 = row2.querySelectorAll('td')[1].textContent
  if (testTh1 < testTh2) { return -1 }
  if (testTh1 > testTh2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  var testTh1 = row1.querySelectorAll('td')[1].textContent
  var testTh2 = row2.querySelectorAll('td')[1].textContent
  if (testTh1 < testTh2) { return 1 }
  if (testTh1 > testTh2) { return -1 }
  return 0
}
