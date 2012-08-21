window.Risk = window.Risk || {}
window.Risk.views = window.Risk.views || {}

class MetaCategoryDetailView extends Backbone.View

  tagName: 'div'
  className: 'meta-category-detail'

  initialize:->
    @template = _.template $('#meta-category-detail-template').html()

  render:->
    $(@el).html @template {model: @model}
    @


window.Risk.views.MetaCategoryDetailView = MetaCategoryDetailView