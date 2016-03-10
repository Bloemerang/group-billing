app = angular.module 'GroupBilling'

app.controller 'OverviewCtrl', ['$scope', ($scope) ->
  $scope.text = 'Hello Angular!'

  $scope.logIn = ->
    Meteor.loginWithGoogle requestPermissions: ['email'], (err) ->
      if err
        if err.error is 'unauthorized-email'
          alert 'Unauthorized email'
        else
          alert 'Unknown login error'
  $scope.logOut = ->
    Meteor.logout()
]
