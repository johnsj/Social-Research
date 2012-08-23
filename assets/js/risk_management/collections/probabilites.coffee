window.Risk = window.Risk || {}
window.Risk.collections = window.Risk.collections || {}

class Probabilities extends Backbone.Collection
  model: Risk.models.Probability
  url: "/api/risks/probabilities"


window.Risk.collections.Probabilities = new Probabilities