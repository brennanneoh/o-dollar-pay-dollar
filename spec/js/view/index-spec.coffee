define ['lodash'], (_) ->
  describe 'cpf-education-loan-calculator-template', ->

    beforeEach ->
      jasmine.getFixtures().fixturesPath = 'build/js/ko-components/templates'
      loadFixtures('cpf-education-loan-calculator.html')

    itShouldBehaveLikeNumberInput = (element) ->
      it 'should be number input', ->
        expect($(element)).toEqual 'INPUT'
        expect($(element)).toHaveAttr 'type', 'number'

    itShouldBehaveLikeObservableDataBind = (element, binding) ->
      it 'should have a knockout observable binding', ->
        expect(_.includes($(element).attr('data-bind'), binding)).toEqual true

    describe 'Loan Amount', ->
        itShouldBehaveLikeNumberInput '#loan-amount'
        itShouldBehaveLikeObservableDataBind '#loan-amount', 'value: loanAmount'

    describe 'Yearly Interest Rate', ->
        itShouldBehaveLikeNumberInput '#yearly-interest-rate'
        itShouldBehaveLikeObservableDataBind '#yearly-interest-rate', 'value: yearlyInterestRate'

    describe 'Monthly Installment', ->
        itShouldBehaveLikeNumberInput '#monthly-installment'
        itShouldBehaveLikeObservableDataBind '#monthly-installment', 'value: monthlyInstallment'
