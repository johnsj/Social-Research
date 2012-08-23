window.Risk = window.Risk || {}
window.Risk.routers = window.Risk.routers || {}

class TextRouter extends Backbone.Router

  routes:
    "texts": "texts"
    "texts/new": "formText"
    "texts/:id": "text"
    "texts/edit/:id": "editText"

  initialize:->
    @textcollection = window.Risk.collections.Texts
    @textcollection.fetch()

  texts:()->
    @textcollection.fetch
      success:->  
        textView = window.Risk.views.TextsView
        window.Application.showView textView

  text:(id)->
    @textcollection.fetch
      success:(collection, response)->
        model = collection.where({_id:id})[0]
        formView = window.Risk.views.TextDetailView
        window.Application.showView formView, {model: model}

  formText:()->
    formView = window.Risk.views.TextFormView
    window.Application.showView formView 

  editText:(id)->
    @textcollection.fetch
      success:(collection, response)=>
        model = collection.where({_id: id})[0]
        editView = window.Risk.views.TextEditView
        window.Application.showView editView, {model:model}

window.Risk.routers.TextRouter = TextRouter