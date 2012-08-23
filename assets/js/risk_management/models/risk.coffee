window.Risk = window.Risk || {}
window.Risk.models = window.Risk.models || {}

class Risk extends Backbone.Model
  validate:(attrs)->
    if typeof attrs.title is "undefined" then return "Title cannot be blank"

  idAttribute: '_id'

  assesment_level:->
    prob = @get("probability").value
    sev = @get("severity").value
    return prob * sev

  assesment_level_color:->
    level = @assesment_level()

    switch level
      when 100, 50
        return "red"
      when 25, 10
        return "yellow"
      when 5, 1
        return "green"

  initialize:->
    @FormSchema =
      title: 
        type: "text"
      description:
        type: "textarea"
      category: 
        type: "select"
        ref: @get "category"
        key: "_id"
        collection: window.Risk.collections.Categories
      impact: 
        type: "textarea"
      severity: 
        type: "select"
        ref: @get "severity"
        key: "_id"
        collection: window.Risk.collections.Severities
      probability: 
        type: "select"
        ref: @get "probability"
        key: "_id"
        collection: window.Risk.collections.Probabilities
      prior_detection: 
        type: "textarea"
      mitigation_approach: 
        type: "textarea"
      proposed_solutions: 
        type: "textarea"



window.Risk.models.Risk = Risk
