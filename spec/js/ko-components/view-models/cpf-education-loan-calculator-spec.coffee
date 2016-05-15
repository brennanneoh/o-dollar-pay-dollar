define ['knockout', 'lodash'], (ko, _) ->
  describe 'OOPD.KoComponents.ViewModels.CpfEducationLoanCalculator', ->
    viewModel = new ODPD.KoComponents.ViewModels.CpfEducationLoanCalculator()

    itBehavesLikeMandatoryField = (field) ->
      it 'has mandatory field validation', ->
        field ''
        expect(field.isValid()).toEqual false

    itBehavesLikeFloatField = (field) ->
      it 'should only accept float', ->
        field 123
        expect(field.isValid()).toEqual true

        field 123.456
        expect(field.isValid()).toEqual true

        field '123abc'
        expect(field.isValid()).toEqual false

    describe 'viewModel', ->
      it 'should be valid when loaded', ->
        expect(ko.validatedObservable(viewModel).isValid()).toEqual false

    describe 'loanAmount', ->
      itBehavesLikeFloatField viewModel.loanAmount
      itBehavesLikeMandatoryField viewModel.loanAmount

    describe 'yearlyInterestRate', ->
      itBehavesLikeFloatField viewModel.yearlyInterestRate
      itBehavesLikeMandatoryField viewModel.yearlyInterestRate

    describe 'monthlyInstallment', ->
      itBehavesLikeFloatField viewModel.monthlyInstallment
      itBehavesLikeMandatoryField viewModel.monthlyInstallment

    describe 'loanPaymentPeriod', ->
      it 'should calculate the loan payment period', ->
        viewModel.loanAmount 30000
        viewModel.yearlyInterestRate 2.5
        viewModel.monthlyInstallment 600
        expect(viewModel.loanRepaymentPeriod()).toEqual 4.4
