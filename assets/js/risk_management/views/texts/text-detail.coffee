window.Risk = window.Risk || {}
window.Risk.views = window.Risk.views || {}

class TextDetailView extends Backbone.View

  tagName: 'div'
  className: 'category-detail'

  initialize:->
    @template = _.template $('#text-detail-template').html()

  render:->
    $(@el).html @template {model: @model}
    @


window.Risk.views.TextDetailView = TextDetailView