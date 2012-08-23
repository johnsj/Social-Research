window.Risk = window.Risk || {}
window.Risk.views = window.Risk.views || {}

class RiskDetailView extends Backbone.View

  tagName: 'div'
  className: 'risk-detail'

  initialize:->
    @template = _.template $('#risk-detail-template').html()

  render:->
    $(@el).html @template {model: @model}
    @


window.Risk.views.RiskDetailView = RiskDetailView