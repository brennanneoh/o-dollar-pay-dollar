require ['lib/shared-config'], () ->
  requirejs.config {
    paths:
      'text': 'https://cdnjs.cloudflare.com/ajax/libs/require-text/2.0.12/text'
      'cpf-education-loan-calculator-viewmodel': 'ko-components/view-models/cpf-education-loan-calculator'
  }

  require ['knockout', 'cpf-education-loan-calculator-viewmodel', 'knockout.validation', 'ko-extenders'], (ko) ->
    ko.validation.init()
    ko.components.register 'cpf-education-loan-calculator', {
      viewModel:
        require: 'cpf-education-loan-calculator-viewmodel'
      template:
        require: 'text!ko-components/templates/cpf-education-loan-calculator.html'
    }
    ko.validation.registerExtenders()
    ko.applyBindings()
