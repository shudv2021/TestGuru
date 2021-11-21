
document.addEventListener('turbolinks:load', function(){
    let timerPanel = document.querySelector('.timer')

    const remainingTime = timerPanel.dataset.remainingTime;
    startTimer(remainingTime);
})

function startTimer(timerPanel, remainingTime) {
    if (rmainingTime > 0) {
        timerPanel.textContent = remainingTime;
        remainingTime--;
        setTimeout(startTimer, 1000, remainingTime)
    }
    else {concole.log('завершить тест')}
}
