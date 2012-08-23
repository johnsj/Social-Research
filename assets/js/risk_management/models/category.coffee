window.Risk = window.Risk || {}
window.Risk.models = window.Risk.models || {}

class Category extends Backbone.Model
  validate:(attrs)->
    if typeof attrs.title is "undefined" then return "Title cannot be blank"

  idAttribute: '_id'

  initialize:->
    @FormSchema =
      title: 
        type: "text"
      description: 
        type: "textarea"
      parent: 
        type: "select"
        ref: @get "parent"
        collection: window.Risk.collections.MetaCategories
        key: "_id"

  getParent:->
    if @get("parent")
      return @get "parent"
    else
      return {_id:"null"}



window.Risk.models.Category = Category
