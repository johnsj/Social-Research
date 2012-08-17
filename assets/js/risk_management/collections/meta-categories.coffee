window.Risk = window.Risk || {}
window.Risk.collections = window.Risk.collections || {}

class MetaCategories extends Backbone.Collection
  model: Risk.models.MetaCategory
  url: "/api/risks/meta-categories"

window.Risk.collections.MetaCategories = new MetaCategories