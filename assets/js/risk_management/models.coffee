jQuery ->
  class Category extends Backbone.Model
    
    defaults:
      title: "Some title",
      description: "Some description"
  
  window.app = window.app || {}
  window.app.Category = Category