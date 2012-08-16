jQuery ->
  window.app = window.app || {}

  class CategoryFormView extends Backbone.View

  window.app.CategoryFormView = CategoryFormView

  class CategorySingleView extends Backbone.View

    initialize:->
      @el = $('tbody#category-content')
      @template = _.template $('category-single-template')
      @render

    render:->
      $(@el).append @template

  class CategoryView extends Backbone.View
    template: _.template $('#category-template').html()
    
    initialize:->
      @el = $('#category-container')
      @render()

    render:->
      $(@el).html @template
      console.log @collection.models
      @

  window.app.CategoryView = CategoryView

  class CategoriesView extends Backbone.View
    el: $('#container')
    template: _.template $('#categories-template').html()

    initialize:->
      @collection.fetch
        success: ->
          @categoryView = new window.app.CategoryView {collection: @collection}      
      @render()

    render:->
      $(@el).html @template
      @


  window.app.CategoriesView = CategoriesView