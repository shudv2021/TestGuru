
document.addEventListener('turbolinks:load', function(){
    let timerPanel = document.querySelector('.timer')
    console.log(timerPanel)
    let remainingTime = timerPanel.dataset.remainingTime;
    console.log(remainingTime)
    startTimer(timerPanel, remainingTime);
})

function startTimer(timerPanel, remainingTime) {
    if (remainingTime > 0) {
        console.log(remainingTime)
        timerPanel.textContent = remainingTime;
        remainingTime--;
        TimerPanel.dataset.remainingTime = remainingTime;
        setTimeout(startTimer, 1000, timerPanel, remainingTime)
    } else {timerPanel.textContent = 'Завершить тест';
        console.log('Завершить тест')
    }
}
