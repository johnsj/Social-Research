Risk = require "./../models/risk_model"

routes = (app)->

  app.namespace "/api/risks", ()->
    app.get "/risks", (req, res)->
      Risk
        .find({})
        .populate('category')
        .populate('probability')
        .populate('severity')
        .sort('_id')
        .exec (err, risk)->
          if !err
            res.json risk
          else
            res.send 404, err

    app.post "/risks", (req, res)->
      console.log req.body
      Risk.create req.body, (err, model)->
        if !err
          res.json 200, model
        else
          console.log err
          res.send 404, "Error: Could not create resource"

    app.put "/risks/:id", (req, res)->
      id = req.params.id
      title = req.body.title
      description = req.body.description
      category = req.body.category
      impact = req.body.impact
      severity = req.body.severity
      probability = req.body.probability
      prior_detection = req.body.prior_detection
      mitigation_approach = req.body.mitigation_approach
      proposed_solutions = req.body.proposed_solutions

      Risk.findById req.params.id, (err, risk)->
        if err
          res.send 404, "Could not find the text"

        risk.title = title
        risk.description = description
        risk.category = category
        risk.impact = impact
        risk.severity = severity
        risk.probability = probability
        risk.prior_detection = prior_detection
        risk.mitigation_approach = mitigation_approach
        risk.proposed_solutions = proposed_solutions

        console.log risk

        risk.save (err)->
          console.log err
          if !err
            res.json 200, risk
          else
            res.send 404, "Could not update resource"

    app.del "/risks/:id", (req, res)->
      risk = Risk.findById req.params.id, (err, Risk)->
        if err
          res.send 404, "Error: Could not find the text"

      risk.remove (err, r)->
        if !err
          res.json 200, r
        else
          res.send 404, "Error: Could not delete the resource"

module.exports = routes