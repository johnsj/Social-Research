window.Risk = window.Risk || {}
window.Risk.views = window.Risk.views || {}


class MetaCategoryFormView extends Backbone.View
  
  tagName: "div"

  initialize:->
    _.bindAll @
    @collection = window.Risk.collections.MetaCategories
    @template = _.template $('#risk-meta-form-template').html()

  render:->
    $(@el).html @template

  events:
    "click button#add_category": "save"
    "click a#error-item-close": "hideError"

  save:(event)->
    title = $('input#category_name').val() unless $('input#category_name').val() is ""
    description = $('textarea#category_description').val()
    saveData =
      title: title 
      description: description

    newModel = new @collection.model

    newModel.collection = @collection

    newModel.on "error", (model, response)=>
      @showErrorBox response

    saveOptions =
      wait: true
      success:->
        window.location.hash = "/metacategories"
      error: ->
        console.log "error", arguments

    newModel.save saveData, saveOptions

  showErrorBox:(msg)->
    errorTemplate = _.template $('#error-item-template').html()
    $('#errorlist').append errorTemplate {msg: msg}

  hideError:(event)->
    $(event.target.parentElement).remove()
  

window.Risk.views.MetaCategoryFormView = MetaCategoryFormView