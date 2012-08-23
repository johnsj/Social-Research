window.Risk = window.Risk || {}
window.Risk.routers = window.Risk.routers || {}

class RiskRouter extends Backbone.Router

  routes:
    "risks": "risks"
    "risks/new": "formRisk"
    "risks/:id": "risk"
    "risks/edit/:id": "editRisk"

  initialize:->
    @collection = window.Risk.collections.Risks
    @probabilities = window.Risk.collections.Probabilities
    @severities = window.Risk.collections.Severities
    @collection.fetch()
    @probabilities.fetch()
    @severities.fetch()

  risks:()->
    @collection.fetch
      success:->  
        riskView = window.Risk.views.RisksView
        window.Application.showView riskView

  risk:(id)->
    @collection.fetch
      success:(collection, response)->
        model = collection.where({_id:id})[0]
        formView = window.Risk.views.RiskDetailView
        window.Application.showView formView, {model: model}

  formRisk:()->
    formView = window.Risk.views.RiskFormView
    window.Application.showView formView 

  editRisk:(id)->
    @collection.fetch
      success:(collection, response)=>
        model = collection.where({_id: id})[0]
        editView = window.Risk.views.RiskEditView
        window.Application.showView editView, {model:model}

window.Risk.routers.RiskRouter = RiskRouter