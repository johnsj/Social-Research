#= require collections
#= require models

jQuery ->
  
  class NewCategoryView extends Backbone.View
    tagname: 'div'
    
    template: _.template $('#category-form-template').html()
    
    initialize: ->
      _.bindAll @

      @collection = new window.app.CategoryParents
      @collection.fetch()

      @collection.bind 'reset', @render
      
    render: ->
      $(@el).html @template {models: @collection.models}
      @
  
  class CategoryView extends Backbone.View
    tagName: 'div'

    template: _.template $('#category-template').html()
    
    initialize: ->
      _.bindAll @
      
    render: ->
      $(@el).html @template @model.toJSON()
      #$(@el).append $ "<span>#{@model.get 'title'} - #{@model.get 'description'}</span>"
      @
  
  class CategoriesView extends Backbone.View
  
    el: $ "div#container"
  
    render:->
      window.app.NewCategoryView = new NewCategoryView
      $('#category-form-container').html window.app.NewCategoryView.render().el
      $(@el).append '<button>Add List Item</button>'
      $(@el).append '<ul class="categories"></ul>'
  
    initialize:->
      _.bindAll @
      
      @collection = new window.app.Categories
      @collection.fetch()
      
      @collection.bind 'add', @appendItem
      @collection.bind 'reset', @repopulate
      
      @counter = 0
      @render()
    
    addItem: ->
      @counter++
      item = new window.app.Category
      item.set title: "Title number #{@counter}"
      @collection.add item
      
    appendItem: (item)->
      item_view = new CategoryView {model: item}
      $('ul.categories').append item_view.render().el
      
    repopulate: ()->
      $('ul.categories').empty()
      @appendItem model for model in @collection.models
      
      
    events: 
      "click button": "addItem"
      
  window.app = window.app || {}
  window.app.CategoriesView = CategoriesView
  new window.app.CategoriesView