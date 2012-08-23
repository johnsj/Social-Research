window.Risk = window.Risk || {}
window.Risk.views = window.Risk.views || {}


class CategoryEditView extends Backbone.View
  
  tagName: "div"

  initialize:->
    _.extend @, Backbone.FormView
    _.bindAll @
    @collection = window.Risk.collections.Categories
    @collection.bind "change", @render, @
    @template = _.template $('#form-template').html()
    @parentCollection = window.Risk.collections.MetaCategories
    @parentCollection.bind 'reset', @render, @
    @parentCollection.fetch()

  render:->
    input=
      header: "Edit Category"
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
    parent = $('select#category_parent option:selected').val()
    saveData =
      title: title
      description: description
      parent: parent
    #@collection.create saveData

    @model.on "error", (model, response)=>
      console.log response
      if response.status isnt 200
        @showErrorBox response

    saveOptions =
      wait: true
      error:(model, response)->
        console.log response
        if response.status is 200
          window.location.hash = "/categories"
      success:(model, response)->
        window.location.hash = "/categories"

    @model.save saveData, saveOptions

  showErrorBox:(msg)->
    console.log msg
    errorTemplate = _.template $('#error-item-template').html()
    $('#errorlist').append errorTemplate {msg: msg}

  hideError:(event)->
    $(event.target.parentElement).remove()

window.Risk.views.CategoryEditView = CategoryEditView