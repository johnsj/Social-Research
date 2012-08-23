#= require ./jquery-1.8.0.min
#= require ./underscore-min
#= require ./backbone-min
#= require_tree ./formview/
#= require_tree ./risk_management/models
#= require_tree ./risk_management/collections
#= require_tree ./risk_management/views
#= require_tree ./risk_management/routers
# Application namespace: Risk

window.Application =
  start:->

    _.mixin
      capitalize:(string)->
       string.charAt(0).toUpperCase() + string.substring(1).toLowerCase()

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

    window.Risk.routers.categoryRouter = new window.Risk.routers.CategoryRouter
    window.Risk.routers.metaCategoryRouter = new window.Risk.routers.MetaCategoryRouter
    window.Risk.routers.textRouter = new window.Risk.routers.TextRouter
    window.Risk.routers.riskRouter = new window.Risk.routers.RiskRouter
    
    Backbone.history.start()


  showView:(view, data = {})->
    if @currentView
      @currentView.close()

      $('#main-view').empty()

    @currentView = new view data
    @currentView.render()

    $('#main-view').html @currentView.el

jQuery ->

  window.Application.start()