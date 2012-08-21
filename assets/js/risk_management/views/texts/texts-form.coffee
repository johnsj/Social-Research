window.Risk = window.Risk || {}
window.Risk.views = window.Risk.views || {}


class TextFormView extends Backbone.View
  
  tagName: "div"

  initialize:->
    _.bindAll @
    @collection = window.Risk.collections.Texts
    @template = _.template $('#text-form-template').html()
    @categoryCollection = window.Risk.collections.Categories
    @categoryCollection.bind 'reset', @addOptions

  render:->
    $(@el).html @template
    @renderCategoryOptions()


  renderCategoryOptions:->
    @categoryCollection.fetch()

  addOptions:->
    $(@el).find('select#text_parent').empty()
    _.each @categoryCollection.models, (model)=>
      @addOption model

  addOption:(model)->
    $(@el).find('select#text_parent').append $('<option>').prop('value', model.get('_id')).text(model.get('title'))

  events:
    "click button#add_text": "save"
    "click a#error-item-close": "hideError"

  save:(event)->
    title = $('input#text_name').val() unless $('input#text_name').val() is ""
    description = $('textarea#text_description').val()
    category = $('select#text_parent option:selected').val()
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