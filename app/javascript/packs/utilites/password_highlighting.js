document.addEventListener('turbolinks:load', function (){
    let control = document.getElementById('user_password_confirmation')
    if (control) {control.addEventListener('input', highlightPass)}
})

function highlightPass() {
    let passwordConfirmation = document.getElementById('user_password_confirmation')
    let password = document.getElementById('user_password')

    function defineStile(color) {
        password.style.backgroundColor = color
        passwordConfirmation.style.backgroundColor = color
    }

    if (password.value === passwordConfirmation.value) { defineStile('green')}
    else {defineStile('red')}
    /*если поле проверки не содержит значений значит функция события не выполняется - те третье уловие задания
    выполняется по умолчанию
     */
}
