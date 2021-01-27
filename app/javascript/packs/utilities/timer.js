document.addEventListener('turbolinks:load', function(){
  var timer = document.querySelector('.timer')

  if (timer){
    initializeClock(timer)
  }
})

function setTimer(timer){
  seconds_left = Number(timer.dataset.secondsLeft)
  drawTimer(timer, seconds_left)
}

function drawTimer(timer, seconds){
  var minutes = Math.floor( seconds / 60)
  var seconds = seconds % 60
  timer.innerHTML = ('0' + minutes).slice(-2) + ":" + ('0' + seconds).slice(-2)
}


function getSecondsRemaining(timer) {
  var current_timer = timer.innerHTML
  var minutes = Number(current_timer.slice(0,2))
  var seconds = Number(current_timer.slice(-2))

  seconds += minutes*60

  return seconds
}

function initializeClock(timer) {
  if (timer.innerHTML == ""){
    setTimer(timer)
  }

  function updateClock() {
    var total_seconds = getSecondsRemaining(timer);
    total_seconds -= 1

    drawTimer(timer,total_seconds)

    if (total_seconds == 0) {
      clearInterval(timeinterval);
    }
  }

  var timeinterval = setInterval(updateClock, 1000);
}

