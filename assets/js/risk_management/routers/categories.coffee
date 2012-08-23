window.Risk = window.Risk || {}
window.Risk.routers = window.Risk.routers || {}

class CategoryRouter extends Backbone.Router

  routes:
    "categories": "categories"
    "categories/new": "formCategory"
    "categories/:id": "category"
    "categories/edit/:id": "editFormCategory"

  initialize:->
    @collection = window.Risk.collections.Categories
    @collection.fetch()

  categories:()->
    @collection.fetch
      success:->  
        categoriesView = window.Risk.views.CategoriesView
        window.Application.showView categoriesView

  formCategory:()->
    formView = window.Risk.views.CategoryFormView
    window.Application.showView formView  

  editFormCategory:(id)->
    @collection.fetch
      success:(collection, response)=>
        model = collection.where({_id: id})[0]
        editView = window.Risk.views.CategoryEditView
        window.Application.showView editView, {model:model}

  category:(id)->
    @collection.fetch
      success:(collection, response)->
        model = collection.where({_id:id})[0]
        formView = window.Risk.views.CategoryDetailView
        window.Application.showView formView, {model: model}

window.Risk.routers.CategoryRouter = CategoryRouter