app = angular.module 'GroupBilling'

app.controller 'OverviewCtrl', ['$scope', '$reactive', ($scope, $reactive) ->
  $reactive(this).attach $scope

  @text = 'Hello Angular!'
]
