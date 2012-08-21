Text = require "./../models/text_model"

routes = (app)->

  app.namespace "/api/risks", ()->
    app.get "/texts", (req, res)->
      Text.find({}).populate('category').exec (err, text)->
        if !err
          res.json text
        else
          res.send 404, err

    app.post "/texts", (req, res)->
      console.log req.body
      Text.create req.body, (err, model)->
        console.log arguments
        if !err
          res.json 200, model
        else
          res.send 404, "Error: Could not create resource"

    app.put "/texts/:id", (req, res)->
      id = req.params.id
      title = req.body.title
      description = req.body.description
      category = req.body.category

      Text.findById req.params.id, (err, text)->
        if err
          res.send 404, "Could not find the text"

        text.title = title
        text.description = description
        text.category = category

        text.save (err)->
          console.log err
          if !err
            res.json 200, text
          else
            res.send 404, "Could not update resource"

    app.del "/texts/:id", (req, res)->
      text = Text.findById req.params.id, (err, Text)->
        if err
          res.send 404, "Error: Could not find the text"

      text.remove (err, t)->
        if !err
          res.json 200, t
        else
          res.send 404, "Error: Could not delete the resource"

module.exports = routes