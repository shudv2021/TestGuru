
document.addEventListener('turbolinks:load', function(){
    let timerPanel = document.querySelector('.timer')
    console.log(timerPanel)
    const remainingTime = timerPanel.dataset.remainingTime;
    console.log(remainingTime)
    startTimer(timerPanel, remainingTime);
})

function startTimer(timerPanel, remainingTime) {
    if (remainingTime > 0) {
        console.log(remainingTime)
        timerPanel.textContent = timerFormat(remainingTime);
        remainingTime--;
        setTimeout(startTimer, 1000, timerPanel, remainingTime)
    } else {
        document.getElementById('test_passage').submit();
    }
}

function timerFormat(remainingTime) {
    let remainingSeconds = remainingTime % 60
    let remainingMinutes = (remainingTime - remainingSeconds) / 60

    if (remainingSeconds < 10) {
        remainingSeconds  = '0' + remainingSeconds
    }
    if (remainingMinutes < 10) {
        remainingMinutes = '0' + remainingMinutes
    }
    return remainingMinutes + ':' + remainingSeconds
}
