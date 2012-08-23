window.Risk = window.Risk || {}
window.Risk.models = window.Risk.models || {}

class Text extends Backbone.Model
  validate:(attrs)->
    if typeof attrs.title is "undefined" then return "Title cannot be blank"

  idAttribute: '_id'

  initialize:->
    @FormSchema =
      title: 
        type: "text"
      description: 
        type: "textarea"
      category: 
        type: "select"
        ref: @get "category"
        collection: window.Risk.collections.Categories
        key: "_id"




window.Risk.models.Text = Text
