window.app = window.app || {}
#= require jquery-1.8.0.min
#= require underscore-min
#= require backbone-min
#= require_tree risk_management

jQuery ->
  
  window.app.router = new window.app.Router

  Backbone.history.start
    root: '/risks/categories'

  return


