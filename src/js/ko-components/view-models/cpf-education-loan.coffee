@ODPD ||= {}
@ODPD.KoComponents ||= {}
@ODPD.KoComponents.ViewModels ||= {}

class ODPD.KoComponents.ViewModels.CpfEducationLoanCalculator
  constuctor: () ->
    @loanAmount = ko.observable()
    @yearlyInterestRate = ko.observable()
    @monthlyInstallment = ko.observable()
