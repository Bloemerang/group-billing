app = angular.module 'GroupBilling', [
  'angular-meteor',
  'angular-meteor.auth'
  'ionic'
]

#onReady = ->
#  angular.bootstrap document, ['GroupBilling']
#
#if Meteor.isCordova
#  angular.element(document).on 'deviceready', onReady
#else
#  angular.element(document).ready(onReady)

app.config ($stateProvider, $urlRouterProvider) ->
  $stateProvider.state 'tab',
    abstract: true
    templateUrl: 'client/tabs.html'
    resolve: ['$auth', ($auth) -> $auth.requireUser()]
  $stateProvider.state 'tab.overview',
    url: '/overview'
    views: 'tab-overview':
      templateUrl: 'client/overview.html'
      controller: 'OverviewCtrl'
      controllerAs: 'overview'
  $stateProvider.state 'tab.bills',
    url: '/bills'
    views: 'tab-bills':
      templateUrl: 'client/bills.html'
      controller: 'BillsCtrl'
      controllerAs: 'ctrl'
  $stateProvider.state 'tab.new-bill',
    url: '/bills/new'
    views: 'tab-bills':
      templateUrl: 'client/new-bill.html'
      controller: 'BillsCtrl'
      controllerAs: 'ctrl'
  $stateProvider.state 'tab.payments',
    url: '/payments'
    views: 'tab-payments':
      templateUrl: 'client/payments.html'
  $stateProvider.state 'login',
    url: '/login'
    templateUrl: 'client/login.html'

  $urlRouterProvider.otherwise 'overview'

app.run ['$rootScope', '$state', ($rootScope, $state) ->
  $rootScope.$on '$stateChangeError', (event, toState, toParams, fromState, fromParams, error) ->
    $state.go 'login' if error is 'AUTH_REQUIRED'
]

app.controller 'MainCtrl', ['$scope', '$reactive', '$state', ($scope, $reactive, $state) ->
  @logIn = ->
    Meteor.loginWithGoogle requestPermissions: ['email'], (err) ->
      if err
        if err.error is 'unauthorized-email'
          alert 'Unauthorized email'
        else
          alert 'Unknown login error'
      else
        $state.go 'tab.overview'

  @logOut = ->
    Meteor.logout()
    # Force a reload if we're already on the login page; otherwise we won't re-render state
    # dependent on the login state.
    $state.go 'login', {}, reload: yes

  $reactive(this).attach $scope
]
