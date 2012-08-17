window.Risk = window.Risk || {}
window.Risk.views = window.Risk.views || {}


class MetaCategoryEditView extends Backbone.View
  
  tagName: "div"

  initialize:->
    _.bindAll @
    @collection = window.Risk.collections.MetaCategories
    @collection.bind "change", @render, @
    @template = _.template $('#risk-meta-edit-template').html()

  render:->
    $(@el).html @template {model: @model}

  events:
    "click button#save_category": "save"
    "click a#error-item-close": "hideError"

  save:(event)->
    title = $('input#category_name').val() unless $('input#category_name').val() is ""
    description = $('textarea#category_description').val()
    
    saveData =
      title: title
      description: description
    
    #@collection.create saveData

    @model.on "error", (model, response)=>
      if response.status isnt 200
        @showErrorBox response

    saveOptions =
      wait: true
      error:(model, response)->
        if response.status is 200
          window.location.hash = "/metacategories"
      success:(model, response)->
        window.location.hash = "/metacategories"

    @model.save saveData, saveOptions

  showErrorBox:(msg)->
    console.log msg
    errorTemplate = _.template $('#error-item-template').html()
    $('#errorlist').append errorTemplate {msg: msg}

  hideError:(event)->
    $(event.target.parentElement).remove()
    

window.Risk.views.MetaCategoryEditView = MetaCategoryEditView