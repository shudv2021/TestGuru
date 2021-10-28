document.addEventListener('turbolinks:load', function(){
    let controls = document.querySelectorAll('.form-inline-link')

    if (controls.length){
        for (let i = 0; i < controls.length; i++) {
            controls[i].addEventListener('click', formInlineLinkHandler)
        }
    }
})

function  formInlineLinkHandler(event){
    event.preventDefault()

    let testId = this.dataset.testId
    console.log(testId)
    formInlineHandler(testId)
}

function formInlineHandler(testID){
    let link = document.querySelector('.form-inline-link[data-test-id="'+testID+'"]')
    let testTitle = document.querySelector('.form-title[data-test-id="'+testID+'"]')
    let formInline = document.querySelector('form-inlien[data-test-id="'+testID+'"]')
    console.log(link)
    console.log(testTitle)
    console.log(formInline)
}

