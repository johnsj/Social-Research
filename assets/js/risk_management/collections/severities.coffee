window.Risk = window.Risk || {}
window.Risk.collections = window.Risk.collections || {}

class Severities extends Backbone.Collection
  model: Risk.models.Severity
  url: "/api/risks/severities"


window.Risk.collections.Severities = new Severities