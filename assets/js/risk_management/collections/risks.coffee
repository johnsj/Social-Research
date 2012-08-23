window.Risk = window.Risk || {}
window.Risk.collections = window.Risk.collections || {}

class Risks extends Backbone.Collection
  model: Risk.models.Risk
  url: "/api/risks/risks"

window.Risk.collections.Risks = new Risks