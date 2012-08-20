window.Risk = window.Risk || {}
window.Risk.views = window.Risk.views || {}

class CategoryDetailView extends Backbone.View

  tagName: 'div'
  className: 'category-detail'

  initialize:->
    @template = _.template $('#category-detail-template').html()

  render:->
    $(@el).html @template {model: @model}
    @


window.Risk.views.CategoryDetailView = CategoryDetailView