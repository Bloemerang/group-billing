app = angular.module 'GroupBilling'


BillsCtrl = ($scope, $reactive) ->
  $reactive(this).attach $scope

  @billsReady = no

  # Not well tested. Contect still not fully loading when conditionalizing it on main.loggedIn
  @subscribe 'bills', (-> []),
    onReady: -> @billsReady = yes

  @helpers
    bills: -> Meteor.App.Bills.find()
    loading: -> @billsReady

BillsCtrl.prototype.billDate = (bill) ->
  new Date(bill.period.year, bill.period.month)

BillsCtrl.prototype.addBill = (amount, period) ->
  Meteor.App.Bills.insert
    amount: parseFloat(amount)
    period:
      year:  period.getFullYear()
      month: period.getMonth()

app.controller 'BillsCtrl', ['$scope', '$reactive', BillsCtrl]
