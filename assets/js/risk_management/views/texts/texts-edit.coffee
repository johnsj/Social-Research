window.Risk = window.Risk || {}
window.Risk.views = window.Risk.views || {}


class TextEditView extends Backbone.View
  
  tagName: "div"

  initialize:->
    _.bindAll @
    @collection = window.Risk.collections.Texts
    @collection.bind "change", @render, @
    @template = _.template $('#text-edit-template').html()
    @metaCollection = window.Risk.collections.Categories
    @metaCollection.bind 'reset', @addOptions

  render:->
    $(@el).html @template {model: @model}
    @renderMetaOptions()


  renderMetaOptions:->
    @metaCollection.fetch()

  addOptions:->
    $(@el).find('select#text_category').empty()
    _.each @metaCollection.models, (model)=>
      @addOption model

  addOption:(model)->
    if @model.attributes.category._id is model.get('_id')
      $(@el).find('select#text_category').append $('<option>').prop('value', model.get('_id')).prop('selected', true).text(model.get('title'))
    else
      $(@el).find('select#text_category').append $('<option>').prop('value', model.get('_id')).text(model.get('title'))

  events:
    "click button#save_text": "save"
    "click a#error-item-close": "hideError"

  save:(event)->
    title = $('input#text_name').val() unless $('input#text_name').val() is ""
    description = $('textarea#text_description').val()
    category = $('select#text_category option:selected').val()
    saveData =
      title: title
      description: description
      category: category
    #@collection.create saveData

    @model.on "error", (model, response)=>
      if response.status isnt 200
        @showErrorBox response

    saveOptions =
      wait: true
      error:(model, response)->
        if response.status is 200
          window.location.hash = "/texts"
      success:(model, response)->
        window.location.hash = "/texts"

    @model.save saveData, saveOptions

  showErrorBox:(msg)->
    console.log msg
    errorTemplate = _.template $('#error-item-template').html()
    $('#errorlist').append errorTemplate {msg: msg}

  hideError:(event)->
    $(event.target.parentElement).remove()
    

window.Risk.views.TextEditView = TextEditView