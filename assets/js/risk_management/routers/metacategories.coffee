window.Risk = window.Risk || {}
window.Risk.routers = window.Risk.routers || {}

class MetaCategoryRouter extends Backbone.Router

  routes:
    "metacategories": "metacategories"
    "metacategories/new": "metaFormCategory"
    "metacategories/:id": "metacategory"
    "metacategories/edit/:id": "editMetaFormCategory"

  initialize:->
    @metacollection = window.Risk.collections.MetaCategories
    @metacollection.fetch()

  metaFormCategory:()->
    formView = window.Risk.views.MetaCategoryFormView
    window.Application.showView formView

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

  metacategory:(id)->
    @metacollection.fetch
      success:(collection, response)->
        model = collection.where({_id:id})[0]
        formView = window.Risk.views.MetaCategoryDetailView
        window.Application.showView formView, {model: model}

window.Risk.routers.MetaCategoryRouter = MetaCategoryRouter