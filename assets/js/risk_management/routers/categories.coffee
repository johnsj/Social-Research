window.Risk = window.Risk || {}
window.Risk.routers = window.Risk.routers || {}

class CategoriesRouter extends Backbone.Router

  root: '/risks/categoriesView'

  routes:
    '/': 'home'

  home: ()->
    @collection = window.Risk.collections.Categories
    @collection.fetch
      success:->  
        categoriesView = new window.Risk.views.CategoriesView
        @app.showView categoriesView

  showView:(view)->
    if @currentView
      @currentView.close()

    @currentView = view
    @currentView.render()

    $('#main-view').html @currentView.el

window.Risk.routers.CategoriesRouter = CategoriesRouter