window.app = window.app || {}
#= require models
jQuery ->
  class Categories extends Backbone.Collection
    model: window.app.Category
    url: "/api/risks/categories"
    
  window.app.Categories = Categories

  class CategoryParents extends Backbone.Collection
    model: window.app.Category
    url: "/api/risks/categories/parents"

  window.app.CategoryParents = CategoryParents