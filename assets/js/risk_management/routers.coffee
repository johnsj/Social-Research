#=require views
jQuery ->
  window.app = window.app || {}

  class Router extends Backbone.Router

    initialize:->
      @collection = window.app.categories

    routes:
      '': 'showCategories'
      'parents': 'showParentCategories'

    showCategories: ()->
      window.app.mainview = new window.app.CategoriesView {collection: @collection}

    showParentCategories: ()->
      #window.app.mainview = new window.app.ParentCategoriesView

  window.app.Router = Router