window.Risk = window.Risk || {}
window.Risk.views = window.Risk.views || {}


class TextFormView extends Backbone.View
  
  tagName: "div"

  initialize:->
    _.extend @, Backbone.FormView
    _.bindAll @
    @collection = window.Risk.collections.Texts
    @model = new window.Risk.models.Text
    @template = _.template $('#form-template').html()
    @parentCollection = window.Risk.collections.Categories
    @parentCollection.bind 'reset', @render, @

  render:->
    input=
      header: "New Text"
    $(@el).html @template {input:input}
    formConfig=
      identifier: "text"
      submitText: "Add new Text"
    @renderForm(formConfig)

  events:
    "click button.form_submit": "save"
    "click a#error-item-close": "hideError"

  save:(event)->
    title = $('input#text_title').val() unless $('input#text_name').val() is ""
    description = $('textarea#text_description').val()
    category = $('select#text_category option:selected').val()
    saveData =
      title: title
      description: description
      category: category

    #@collection.create saveData
    newModel = new @collection.model

    newModel.collection = @collection

    newModel.on "error", (model, response)=>
      if response.status isnt 200
        @showErrorBox response
      if response.status is 200
        console.log "got 200"

    saveOptions =
      wait: true
      error:(model, response)->
        if response.status is 200
          window.location.hash = "/texts"
      success:(model, response)->
        window.location.hash = "/texts"

    newModel.save saveData, saveOptions

  showErrorBox:(msg)->
    errorTemplate = _.template $('#error-item-template').html()
    $('#errorlist').append errorTemplate {msg: msg}

  hideError:(event)->
    $(event.target.parentElement).remove()
    

window.Risk.views.TextFormView = TextFormView