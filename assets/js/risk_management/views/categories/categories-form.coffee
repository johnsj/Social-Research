window.Risk = window.Risk || {}
window.Risk.views = window.Risk.views || {}


class CategoryFormView extends Backbone.View
  
  tagName: "div"

  initialize:->
    _.extend @, Backbone.FormView
    _.bindAll @
    @collection = window.Risk.collections.Categories
    @model = new window.Risk.models.Category
    @template = _.template $('#form-template').html()
    @parentCollection = window.Risk.collections.MetaCategories
    @parentCollection.fetch()
    @parentCollection.bind 'reset', @render, @

  render:->
    input=
      header: "New Category"
    $(@el).html @template {input:input}
    formConfig=
      identifier: "category"
      submitText: "Add new Category"
    @renderForm(formConfig)


  events:
    "click button.form_submit": "save"
    "click a#error-item-close": "hideError"

  save:(event)->
    title = $('input#category_title').val() unless $('input#category_title').val() is ""
    description = $('textarea#category_description').val()
    parent = $('select#category_metacategory option:selected').val()
    saveData =
      title: title
      description: description
      parent: parent
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
          window.location.hash = "/categories"
      success:(model, response)->
        window.location.hash = "/categories"

    newModel.save saveData, saveOptions

  showErrorBox:(msg)->
    errorTemplate = _.template $('#error-item-template').html()
    $('#errorlist').append errorTemplate {msg: msg}

  hideError:(event)->
    $(event.target.parentElement).remove()
    

window.Risk.views.CategoryFormView = CategoryFormView