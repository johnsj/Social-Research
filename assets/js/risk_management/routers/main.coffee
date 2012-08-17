window.Risk = window.Risk || {}
window.Risk.routers = window.Risk.routers || {}

class MainRouter extends Backbone.Router

  routes:
    "categories": "categories"
    "categories/new": "formCategory"
    "categories/:id": "category"
    "categories/edit/:id": "editFormCategory"
    "categories/:id/delete": "deleteCategory"
    "metacategories": "metacategories"
    "metacategories/new": "metaFormCategory"
    "metacategories/:id": "metacategory"
    "metacategories/edit/:id": "editMetaFormCategory"
    "metacategories/delete/:id": "deleteMetaCategory"

  initialize:->
    @collection = window.Risk.collections.Categories
    @metacollection = window.Risk.collections.MetaCategories

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

window.Risk.routers.MainRouter = MainRouter