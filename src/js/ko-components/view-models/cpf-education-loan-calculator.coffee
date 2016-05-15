define ['knockout', 'lodash', 'knockout.validation'], (ko, _) ->
  @ODPD ||= {}
  @ODPD.KoComponents ||= {}
  @ODPD.KoComponents.ViewModels ||= {}

  class ODPD.KoComponents.ViewModels.CpfEducationLoanCalculator
    constructor: () ->
      @loanAmount = ko.observable().extend #30000
        toNumber: true
        required: true
        number: true

      @yearlyInterestRate = ko.observable().extend # 2.5
        toNumber: true
        required: true
        number: true

      @monthlyInstallment = ko.observable().extend # 600
        toNumber: true
        required: true
        number: true

      @loanRepaymentPeriod = ko.computed =>
        _.floor (Math.log(@monthlyInstallment()) -
        Math.log(@monthlyInstallment() - @loanAmount() * @yearlyInterestRate() / 100 / 12)) /
        Math.log(1 + @yearlyInterestRate() / 100 / 12) / 12, 1
