app = angular.module 'GroupBilling', ['angular-meteor', 'ionic']

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
  $stateProvider.state 'tab.overview',
    url: '/overview'
    views: 'tab-overview':
      templateUrl: 'client/overview.html'
      controller: 'TestCtrl'
  $stateProvider.state 'tab.bills',
    url: '/bills'
    views: 'tab-bills':
      templateUrl: 'client/bills.html'
  $stateProvider.state 'tab.new-bill',
    url: '/bills/new'
    views: 'tab-bills':
      templateUrl: 'client/new-bill.html'
  $stateProvider.state 'tab.payments',
    url: '/payments'
    views: 'tab-payments':
      templateUrl: 'client/payments.html'

  $urlRouterProvider.otherwise 'overview'
