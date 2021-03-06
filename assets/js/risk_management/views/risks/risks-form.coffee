window.Risk = window.Risk || {}
window.Risk.views = window.Risk.views || {}


class RiskFormView extends Backbone.View
  
  tagName: "div"

  initialize:->
    _.extend @, Backbone.FormView
    _.bindAll @
    @collection = window.Risk.collections.Risks
    @model = new window.Risk.models.Risk
    @template = _.template $('#form-template').html()
    @parentCollection = window.Risk.collections.Categories
    @parentCollection.fetch()
    @parentCollection.bind 'reset', @render, @

  render:->
    input=
      header: "New Risk"
    $(@el).html @template {input:input}
    formConfig=
      identifier: "risk"
      submitText: "Add new Risk"
    @renderForm(formConfig)

  events:
    "click button.form_submit": "save"
    "click a#error-item-close": "hideError"

  save:(event)->
    title = $('input#risk_title').val() unless $('input#risk_name').val() is ""
    description = $('textarea#risk_description').val()
    category = $('select#risk_category option:selected').val()
    impact = $('textarea#risk_impact').val()
    severity = $('select#risk_severity option:selected').val()
    probability = $('select#risk_probability option:selected').val()
    prior_detection = $("textarea#risk_prior_detection").val()
    mitigation_approach = $("textarea#risk_mitigation_approach").val()
    proposed_solutions = $("textarea#risk_proposed_solutions").val()



    saveData =
      title: title
      description: description
      category: category
      impact: impact
      severity: severity
      probability: probability
      prior_detection: prior_detection
      mitigation_approach: mitigation_approach
      proposed_solutions: proposed_solutions

    #@collection.create saveData
    newModel = new @collection.model

    newModel.collection = @collection

    newModel.on "error", (model, response)=>
      if response.status isnt 200
        @showErrorBox response
      if response.status is 200
        console.log "got 200"

    saveOptions =
      wait: true
      error:(model, response)->
        if response.status is 200
          window.location.hash = "/risks"
      success:(model, response)->
        window.location.hash = "/risks"

    newModel.save saveData, saveOptions

  showErrorBox:(msg)->
    errorTemplate = _.template $('#error-item-template').html()
    $('#errorlist').append errorTemplate {msg: msg}

  hideError:(event)->
    $(event.target.parentElement).remove()
    

window.Risk.views.RiskFormView = RiskFormView