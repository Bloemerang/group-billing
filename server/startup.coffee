AuthorizedUsers = new Mongo.Collection 'authorized_users'

Accounts.validateNewUser (user) ->
  email = user.services.google.email
  console.log "Validating #{email}"
  return no unless email
  return no unless /[\w.]+@[\w.]+/.test email
  return yes if AuthorizedUsers.find(email: email).count() is 1
  throw new Meteor.Error 'unauthorized-email'
