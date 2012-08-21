window.Risk = window.Risk || {}
window.Risk.routers = window.Risk.routers || {}

class MainRouter extends Backbone.Router

  routes:
    "categories": "categories"
    "categories/new": "formCategory"
    "categories/:id": "category"
    "categories/edit/:id": "editFormCategory"
    "metacategories": "metacategories"
    "metacategories/new": "metaFormCategory"
    "metacategories/:id": "metacategory"
    "metacategories/edit/:id": "editMetaFormCategory"
    "texts": "texts"
    "texts/new": "formText"
    "texts/:id": "text"
    "texts/edit/:id": "editText"
    "probabilities": "probabilities"
    "probabilities/new": "formProbability"
    "probabilities/:id": "probability"
    "probabilities/edit/:id": "editProbability"

  initialize:->
    @collection = window.Risk.collections.Categories
    @collection.fetch()
    @metacollection = window.Risk.collections.MetaCategories
    @textcollection = window.Risk.collections.Texts
    @probabilitycollection = window.Risk.collections.Probabilities

  categories:()->
    @collection.fetch
      success:->  
        categoriesView = window.Risk.views.CategoriesView
        window.Application.showView categoriesView

  formCategory:()->
    formView = window.Risk.views.CategoryFormView
    window.Application.showView formView  

  metaFormCategory:()->
    formView = window.Risk.views.MetaCategoryFormView
    window.Application.showView formView

  editFormCategory:(id)->
    @collection.fetch
      success:(collection, response)=>
        model = collection.where({_id: id})[0]
        editView = window.Risk.views.CategoryEditView
        window.Application.showView editView, {model:model}

  editMetaFormCategory:(id)->
    @metacollection.fetch
      success:(collection, response)=>
        model = collection.where({_id: id})[0]
        editView = window.Risk.views.MetaCategoryEditView
        window.Application.showView editView, {model:model}


  metacategories:()->
    @metacollection.fetch
      success:->  
        metaCategoriesView = window.Risk.views.MetaCategoriesView
        window.Application.showView metaCategoriesView

  category:(id)->
    @collection.fetch
      success:(collection, response)->
        model = collection.where({_id:id})[0]
        formView = window.Risk.views.CategoryDetailView
        window.Application.showView formView, {model: model}

  metacategory:(id)->
    @metacollection.fetch
      success:(collection, response)->
        model = collection.where({_id:id})[0]
        formView = window.Risk.views.MetaCategoryDetailView
        window.Application.showView formView, {model: model}

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

  probabilities:()->
    @probabilitycollection.fetch
      success:->  
        newView = window.Risk.views.ProbabilitiesView
        window.Application.showView newView

  probability:(id)->
    @probabilitycollection.fetch
      success:(collection, response)->
        model = collection.where({_id:id})[0]
        formView = window.Risk.views.ProbabilityDetailView
        window.Application.showView formView, {model: model}

  formProbability:()->
    formView = window.Risk.views.ProbabilityFormView
    window.Application.showView formView 

  editProbability:(id)->
    @probabilitycollection.fetch
      success:(collection, response)=>
        model = collection.where({_id: id})[0]
        editView = window.Risk.views.ProbabilityEditView
        window.Application.showView editView, {model:model}

window.Risk.routers.MainRouter = MainRouter