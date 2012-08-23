Severity = require "./../models/severity_model"

routes = (app)->

  app.namespace "/api/risks", ()->
    app.get "/severities", (req, res)->
      Severity.find (err, text)->
        if !err
          res.json text
        else
          res.send 404, err

    app.post "/severities", (req, res)->
      console.log req.body
      Severity.create req.body, (err, model)->
        console.log arguments
        if !err
          res.json 200, model
        else
          res.send 404, "Error: Could not create resource"

    app.put "/severities/:id", (req, res)->
      id = req.params.id
      title = req.body.title
      value = req.body.value

      Severity.findById req.params.id, (err, severity)->
        if err
          res.send 404, "Could not find the severity"

        severity.title = title
        severity.value = value

        severity.save (err)->
          console.log err
          if !err
            res.json 200, severity
          else
            res.send 404, "Could not update resource"

    app.del "/severities/:id", (req, res)->
      severity = Severity.findById req.params.id, (err, Severity)->
        if err
          res.send 404, "Error: Could not find the severity"

      severity.remove (err, t)->
        if !err
          res.json 200, t
        else
          res.send 404, "Error: Could not delete the resource"

module.exports = routes