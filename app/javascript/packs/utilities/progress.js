document.addEventListener('turbolinks:load', function(){
  var bar = document.querySelector('.bar')

  if (bar){
    drawProgress(bar)
  }
})

function drawProgress(bar){
  var  percent = bar.dataset.percent
  bar.style.width = percent + "%"
}
