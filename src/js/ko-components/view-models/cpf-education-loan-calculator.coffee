define ['knockout', 'knockout.validation'], (ko) ->
  @ODPD ||= {}
  @ODPD.KoComponents ||= {}
  @ODPD.KoComponents.ViewModels ||= {}

  class ODPD.KoComponents.ViewModels.CpfEducationLoanCalculator
    constructor: () ->
      @loanAmount = ko.observable().extend #30000
        toNumber: true
        number: true

      @yearlyInterestRate = ko.observable().extend # 2.5
        toNumber: true
        number: true

      @monthlyInstallment = ko.observable().extend # 600
        toNumber: true
        number: true

      @loanRepaymentPeriod = ko.computed =>
        (Math.log(@monthlyInstallment()) -
        Math.log(@monthlyInstallment() - @loanAmount() * @yearlyInterestRate() / 100 / 12)) /
        Math.log(1 + @yearlyInterestRate() / 12) # 4.4 years
