window.Risk = window.Risk || {}
window.Risk.views = window.Risk.views || {}


class CategoryView extends Backbone.View
  el: '#risk_list_content'
  

  initialize:->
    _.bindAll @
    @template = _.template $('#risk-list-tablerow-template').html()

  render:->
    _.each @collection.models, (model)=>
      @appendItemToView model

  appendItemToView:(model)->
    $(@el).append @template {model: model}

window.Risk.views.CategoryView = CategoryView