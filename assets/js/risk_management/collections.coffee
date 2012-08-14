#= require models
jQuery ->
  class Categories extends Backbone.Collection
    model: window.app.Category
    url: "/api/risks/categories"
    
  window.app = window.app || {}
  window.app.Categories = Categories