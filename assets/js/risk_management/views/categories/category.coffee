window.Risk = window.Risk || {}
window.Risk.views = window.Risk.views || {}


class CategoryView extends Backbone.View
  
  tagName: "tr"

  initialize:->
    _.bindAll @
    @template = _.template $('#category-list-tablerow-template').html()

  render:->
    $(@el).html @template {model: @model}
    @

  events:
    'click #delete': 'deleteModel'

  deleteModel:(event)->
    event.preventDefault()

    comfirmation = confirm("Are you sure you want to delete?")

    if comfirmation is true
      destroyOptions = 
        wait: true
      @model.destroy()

window.Risk.views.CategoryView = CategoryView