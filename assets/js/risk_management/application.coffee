#= require ../jquery-1.8.0.min
#= require ../underscore-min
#= require ../backbone-min
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./routers
# Application namespace: Risk

window.Application =
  start:->

    Backbone.View.prototype.close = ()->
      @remove()
      @unbind()

    Backbone.Model.prototype.isNew = ()->
      id = @get('_id')

      if typeof id is "undefined"
        return true
      
      if id isnt 0 or not id
        return false
      else
        return true

    @router = new window.Risk.routers.MainRouter
    
    Backbone.history.start()


  showView:(view, data = {})->
    if @currentView
      @currentView.close()


    @currentView = new view data
    @currentView.render()

    $('#main-view').html @currentView.el

jQuery ->

  window.Application.start()