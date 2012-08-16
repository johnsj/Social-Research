window.Risk = window.Risk || {}
window.Risk.views = window.Risk.views || {}


class CategoriesView extends Backbone.View
  el: 'div'
  table_el: '#table-container'

  initialize:->
    _.bindAll @
    @template = _.template $('#risk-main-template').html()
    @table_template = _.template $('#risk-list-table-template').html()

    @collection = window.Risk.collections.Categories

    @render()

  render:->
    $(@el).html @template
    $(@table_el).html @table_template
    @collectionView = new window.Risk.views.CategoryView({collection: @collection})
    @collectionView.render()

window.Risk.views.CategoriesView = CategoriesView