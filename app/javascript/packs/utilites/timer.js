
document.addEventListener('turbolinks:load', function(){
    let timerPanel = document.querySelector('.timer')

    let remainingTime = timerPanel.dataset.remainingTime;
    startTimer(remainingTime);
})

function startTimer(timerPanel, remainingTime) {
    if (remainingTime > 0) {
        timerPanel.textContent = remainingTime;
        remainingTime--;
        setTimeout(startTimer, 1000, remainingTime)
    } else {timerPanel.textContent = 'Завершить тест'}
}
