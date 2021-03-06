window.Risk = window.Risk || {}
window.Risk.views = window.Risk.views || {}


class MetaCategoriesView extends Backbone.View
  tagName: 'div'
  table_el: '#table-container'

  initialize:->
    _.bindAll @
    @template = _.template $('#main-template').html()
    @table_template = _.template $('#meta-category-list-table-template').html()

    @collection = window.Risk.collections.MetaCategories
    @collection.bind "remove", @render, @

  render:->
    $(@el).html @template
    $(@el).find(@table_el).html @table_template
    _.each @collection.models, (model)=>
      itemView = new window.Risk.views.MetaCategoryView({model: model})
      $(@el).find("tbody#meta_category_list_content").append itemView.render().el
    @

window.Risk.views.MetaCategoriesView = MetaCategoriesView