document.addEventListener('turbolinks:load', function(){
  $('.form-inline-link').on('click', formInLineLinkHandler)

  var errors = document.querySelector('.resource-errors')
  var link = document.querySelector('.form-inline-link')

  if (errors && link){
    var resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
})


function formInLineLinkHandler(event){
  event.preventDefault()

  var testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId){
  var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')

  var $testTitle = $('.test-title[data-test-id="' + testId + '"]')
  var $formInLine = $('.form-inline[data-test-id="' + testId + '"]')

  $formInLine.toggle()
  $testTitle.toggle()

  if($formInLine.is(':visible')){
    link.textContent = 'Cancel'
  } else {
    link.textContent = 'Edit'
  }
}
