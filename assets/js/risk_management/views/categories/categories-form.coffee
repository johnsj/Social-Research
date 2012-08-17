window.Risk = window.Risk || {}
window.Risk.views = window.Risk.views || {}


class CategoryFormView extends Backbone.View
  
  tagName: "div"

  initialize:->
    _.bindAll @
    @collection = window.Risk.collections.Categories
    @template = _.template $('#risk-form-template').html()
    @metaCollection = window.Risk.collections.MetaCategories
    @metaCollection.bind 'reset', @addOptions

  render:->
    $(@el).html @template
    @renderMetaOptions()


  renderMetaOptions:->
    @metaCollection.fetch()

  addOptions:->
    _.each @metaCollection.models, (model)=>
      @addOption model

  addOption:(model)->
    $(@el).find('select#category_parent').append $('<option>').prop('value', model.get('_id')).text(model.get('title'))

  events:
    "click button#add_category": "save"
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