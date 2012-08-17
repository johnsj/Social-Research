window.Risk = window.Risk || {}
window.Risk.models = window.Risk.models || {}

class MetaCategory extends Backbone.Model
  validate:(attrs)->
    if typeof attrs.title is "undefined" then return "Title cannot be blank"

  idAttribute: '_id'


window.Risk.models.MetaCategory = MetaCategory