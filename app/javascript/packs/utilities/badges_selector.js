document.addEventListener('turbolinks:load', function(){
  var control = document.querySelector('.badges')
  if (control) {
    if (badge_parameter.value == ""){
      drawParameterSelector()
    }
    badge_rule.addEventListener('change', drawParameterSelector)}
})

function drawParameterSelector(){
  var spanElement = document.querySelector('.' + badge_rule.value)
  var selectorAry = spanElement.dataset.select.split(",")
  var parameterSelector = document.createElement('select')

  parameterSelector.id = "badge_parameter"
  parameterSelector.name = "badge[parameter]"

  for(var i = 0; i < selectorAry.length; i++){
    parameterSelector.innerHTML += '<option value="' + selectorAry[i] + '">' + selectorAry[i] + '</option>'
  }

  badge_parameter.parentNode.replaceChild(parameterSelector, badge_parameter)

}
