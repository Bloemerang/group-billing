Meteor.publish 'bills', ->
  Meteor.App.Bills.find()
