document.addEventListener('turbolinks:load', function(){
  var control = document.querySelector('.compare-passwords')
  if (control) {control.addEventListener('input', showPasswordsCompare)}
})

function showPasswordsCompare(){
  var password = user_password.value
  var password_confirmation = user_password_confirmation.value

  if (password == password_confirmation && password_confirmation != ""){
    document.querySelector('.octicon-check-circle-fill').classList.remove('hide')
    document.querySelector('.octicon-x-circle-fill').classList.add('hide')
  } else {
    document.querySelector('.octicon-check-circle-fill').classList.add('hide')
    document.querySelector('.octicon-x-circle-fill').classList.remove('hide')
  }
  if (password_confirmation == ""){
    document.querySelector('.octicon-check-circle-fill').classList.add('hide')
    document.querySelector('.octicon-x-circle-fill').classList.add('hide')
  }
}
