Probability = require "./../models/probability_model"

routes = (app)->

  app.namespace "/api/risks", ()->
    app.get "/probabilities", (req, res)->
      Probability.find (err, text)->
        if !err
          res.json text
        else
          res.send 404, err

    app.post "/probabilities", (req, res)->
      console.log req.body
      Probability.create req.body, (err, model)->
        console.log arguments
        if !err
          res.json 200, model
        else
          res.send 404, "Error: Could not create resource"

    app.put "/probabilities/:id", (req, res)->
      id = req.params.id
      title = req.body.title
      value = req.body.value

      Probability.findById req.params.id, (err, probability)->
        if err
          res.send 404, "Could not find the probability"

        probability.title = title
        probability.value = value

        probability.save (err)->
          console.log err
          if !err
            res.json 200, probability
          else
            res.send 404, "Could not update resource"

    app.del "/probabilities/:id", (req, res)->
      probability = Probability.findById req.params.id, (err, Probability)->
        if err
          res.send 404, "Error: Could not find the probability"

      probability.remove (err, t)->
        if !err
          res.json 200, t
        else
          res.send 404, "Error: Could not delete the resource"

module.exports = routes