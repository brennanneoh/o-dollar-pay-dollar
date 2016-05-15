requirejs.config {
  baseUrl: 'js/'
  paths:
    # NOTE: ko-extenders is not declared in "paths"
    # because the namespace and the filenames are the same
    'lodash': 'https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.12.0/lodash.min'
    'knockout': 'https://cdnjs.cloudflare.com/ajax/libs/knockout/3.3.0/knockout-min'
    'knockout.validation': 'https://cdnjs.cloudflare.com/ajax/libs/knockout-validation/2.0.3/knockout.validation.min'
    'text': 'https://cdnjs.cloudflare.com/ajax/libs/require-text/2.0.12/text'
    'cpf-education-loan-calculator-viewmodel': 'ko-components/view-models/cpf-education-loan-calculator'

}
