window.Risk = window.Risk || {}
window.Risk.collections = window.Risk.collections || {}

class Categories extends Backbone.Collection
  model: Risk.models.Category
  url: "/api/risks/categories"

  defaults:
    description: "No description"

window.Risk.collections.Categories = new Categories