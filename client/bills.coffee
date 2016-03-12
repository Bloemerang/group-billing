app = angular.module 'GroupBilling'


BillsCtrl = ($scope, $reactive) ->
  $reactive(this).attach $scope

  @helpers
    bills: ->
      Meteor.App.Bills.find()

BillsCtrl.prototype.billDate = (bill) ->
  new Date(bill.period.year, bill.period.month)

BillsCtrl.prototype.addBill = (amount, period) ->
  Meteor.App.Bills.insert
    amount: parseFloat(amount)
    period:
      year:  period.getFullYear()
      month: period.getMonth()

app.controller 'BillsCtrl', ['$scope', '$reactive', BillsCtrl]
