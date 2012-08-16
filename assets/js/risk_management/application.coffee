#= require ../jquery-1.8.0.min
#= require ../underscore-min
#= require ../backbone-min
#= require_tree models
#= require_tree collections
#= require_tree views
#= require_tree routers
# Application namespace: Risk

_.templateSettings =
  interpolate: /\{\{(.+?)\}\}/g

class Application
  start:->
    @router = new window.Risk.routers.CategoriesRouter()
    console.log "about to start Backbone.History"
    Backbone.History.start()

  showView:(view)->
    if @currentView
      @currentView.close()

    @currentView = view
    @currentView.render()

    $('#main-view').html @currentView.el

jQuery ->

  Backbone.View.prototype.close = ()->
    @remove()
    @unbind()

  window.Application = new Application
  window.Application.start()