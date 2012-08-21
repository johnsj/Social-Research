window.Risk = window.Risk || {}
window.Risk.collections = window.Risk.collections || {}

class Texts extends Backbone.Collection
  model: Risk.models.Text
  url: "/api/risks/texts"

  defaults:
    description: "No description"

window.Risk.collections.Texts = new Texts