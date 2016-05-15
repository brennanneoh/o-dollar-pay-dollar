define ['knockout'], (ko) ->
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
        expect(ko.validatedObservable(viewModel).isValid()).toEqual true

    describe 'loanAmount', ->
      itBehavesLikeFloatField viewModel.loanAmount

    describe 'yearlyInterestRate', ->
      itBehavesLikeFloatField viewModel.yearlyInterestRate

    describe 'monthlyInstallment', ->
      itBehavesLikeFloatField viewModel.monthlyInstallment
