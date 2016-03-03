app = angular.module 'GroupBilling'

app.controller 'BillsCtrl', ['$scope', '$meteor', '$ionicHistory',
  ($scope, $meteor, $ionicHistory) ->
    $scope.bills = $meteor.collection Meteor.App.Bills

    $scope.billDate = (bill) ->
      new Date(bill.period.year, bill.period.month)

    $scope.addBill = (amount, period) ->
      $scope.bills.push
        amount: parseFloat(amount)
        period:
          year:  period.getFullYear()
          month: period.getMonth()
      $ionicHistory.goBack()
]
