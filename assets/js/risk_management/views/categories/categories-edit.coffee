window.Risk = window.Risk || {}
window.Risk.views = window.Risk.views || {}


class CategoryEditView extends Backbone.View
  
  tagName: "div"

  initialize:->
    _.bindAll @
    @collection = window.Risk.collections.Categories
    @collection.bind "change", @render, @
    @template = _.template $('#risk-edit-template').html()
    @metaCollection = window.Risk.collections.MetaCategories
    @metaCollection.bind 'reset', @addOptions

  render:->
    $(@el).html @template {model: @model}
    @renderMetaOptions()


  renderMetaOptions:->
    @metaCollection.fetch()

  addOptions:->
    _.each @metaCollection.models, (model)=>
      @addOption model

  addOption:(model)->
    if @model.attributes.parent._id is model.get('_id')
      $(@el).find('select#category_parent').append $('<option>').prop('value', model.get('_id')).prop('selected', true).text(model.get('title'))
    else
      $(@el).find('select#category_parent').append $('<option>').prop('value', model.get('_id')).text(model.get('title'))

  events:
    "click button#save_category": "save"
    "click a#error-item-close": "hideError"

  save:(event)->
    title = $('input#category_name').val() unless $('input#category_name').val() is ""
    description = $('textarea#category_description').val()
    parent = $('select#category_parent option:selected').val()
    saveData =
      title: title
      description: description
      parent: parent
    #@collection.create saveData

    @model.on "error", (model, response)=>
      if response.status isnt 200
        @showErrorBox response

    console.log @model.url()

    saveOptions =
      wait: true
      error:(model, response)->
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