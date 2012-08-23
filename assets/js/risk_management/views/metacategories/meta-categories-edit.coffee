window.Risk = window.Risk || {}
window.Risk.views = window.Risk.views || {}


class MetaCategoryEditView extends Backbone.View
  
  tagName: "div"

  initialize:->
    _.extend @, Backbone.FormView
    _.bindAll @
    @formConfig=
      identifier: "metacategory"
      submitText: "Save Metacategory"
    @collection = window.Risk.collections.MetaCategories
    @collection.bind "change", @render, @
    @template = _.template $('#form-template').html()

  render:->
    input=
      header: "Edit Metacategory"
    $(@el).html @template {input:input}
    
    @renderForm(@formConfig)

  events:
    "click button.form_submit": "save"
    "click a#error-item-close": "hideError"

  save:(event)->
    title = $('input#metacategory_title').val() unless $('input#metacategory_title').val() is ""
    description = $('textarea#metacategory_description').val()
    
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