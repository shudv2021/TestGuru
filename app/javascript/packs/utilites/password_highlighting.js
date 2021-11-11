asdadfsdfgdg
document.addEventListener('turbolinks:load', function (){
    let control = document.getElementById('user_password_confirmation')
    if (control) {control.addEventListener('input', highlightPass)}
})

function highlightPass() {
    let passwordConfirmation = document.getElementById('user_password_confirmation')
    let password = document.getElementById('user_password')

    if (password.value === '' || passwordConfirmation.value === '') {
        clearStile(password, passwordConfirmation)
        return 
    }
    if (password.value === passwordConfirmation.value) { defineStile('green', password, passwordConfirmation)}
    else {defineStile('red', password, passwordConfirmation)}

}

function defineStile(color, password, passwordConfirmation) {
    password.style.backgroundColor = color
    passwordConfirmation.style.backgroundColor = color
}

function clearStile(password, passwordConfirmation) {
    password.style.backgroundColor = ''
    passwordConfirmation.style.backgroundColor = ''
}
