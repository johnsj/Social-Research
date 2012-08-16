window.app = window.app || {}
#= require models

class Categories extends Backbone.Collection
  model: window.app.Category
  url: "/api/risks/categories"

class ParentCategories extends Backbone.Collection
  model: window.app.ParentCategory
  url: "/api/risks/parent-categories"
  
window.app.categories = new Categories
window.app.parentCategories = new ParentCategories