document.addEventListener('turbolinks:load', function(){
    let progressBar = document.getElementById('test-progress')

    if (progressBar) {
        let questionNumber = progressBar.dataset.questionNumber
        let totalQuestion = progressBar.dataset.totalQuestion
        let progress = Math.floor((questionNumber-1)/totalQuestion * 100)

        progressBar.textContent = "Вопрос "+questionNumber+" пройдено " + progress + "%"
        progressBar.style.width = progress + "%"
    }
})
