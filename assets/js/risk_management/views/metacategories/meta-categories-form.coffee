window.Risk = window.Risk || {}
window.Risk.views = window.Risk.views || {}


class MetaCategoryFormView extends Backbone.View
  
  tagName: "div"

  initialize:->
    _.extend @, Backbone.FormView
    _.bindAll @
    @model = new window.Risk.models.MetaCategory
    @collection = window.Risk.collections.MetaCategories
    @template = _.template $('#form-template').html()

  render:->
    input=
      header: "New Metacategory"
    $(@el).html @template {input:input}
    formConfig=
      identifier: "metacategory"
      submitText: "Add new Metacategory"
    @renderForm(formConfig)

  events:
    "click button.form_submit": "save"
    "click a#error-item-close": "hideError"

  save:(event)->
    title = $('input#metacategory_title').val() unless $('input#metacategory_title').val() is ""
    description = $('textarea#metacategory_description').val()
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