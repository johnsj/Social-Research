Category = require "./models/category_model"
ParentCategory = require "./models/parent_category_model"

routes = (app)->
  app.namespace "/risk_management", ()->
    app.get "/", (req, res)->
      res.render "risk_management/categories/index", title: "Risk Management"
  
  app.namespace "/api/risks", ()->
    app.get "/meta-categories", (req, res)->
      ParentCategory.find (err, categories)->
        if !err
          res.json categories
        else
          res.send 404, err
    app.post "/meta-categories", (req, res)->
      console.log req.body
      ParentCategory.create req.body, (err, model)->
        if !err
          res.json 200, model
        else
          res.send 404, "Error: Could not create resource"
    app.put "/meta-categories/:id", (req, res)->
      id = req.params.id
      title = req.body.title
      description = req.body.description

      ParentCategory.findById req.params.id, (err, cat)->
        if err
          res.send 404, "Could not find the category"

        cat.title = title
        cat.description = description

        cat.save (err)->
          console.log err
          if !err
            res.json 200, cat
          else
            res.send 404, "Could not update resource"
    app.del "/meta-categories/:id", (req, res)->
      metaCat = ParentCategory.findById req.params.id, (err, parentCategory)->
        if err
          res.send 404, "Error: Could not find the Meta-category"

      metaCat.remove (err, parentCategory)->
        if !err
          res.json 200, parentCategory
        else
          res.send 404, "Error: Could not delete the resource"

    app.get "/categories", (req, res)->
      Category.find({}).populate('parent').exec (err, categories)->
        if !err
          res.json categories
        else
          res.send 404, err

    app.post "/categories", (req, res)->
      console.log req.body
      Category.create req.body, (err, model)->
        console.log arguments
        if !err
          res.json 200, model
        else
          res.send 404, "Error: Could not create resource"

    app.put "/categories/:id", (req, res)->
      id = req.params.id
      title = req.body.title
      description = req.body.description
      parent = req.body.parent

      Category.findById req.params.id, (err, cat)->
        if err
          res.send 404, "Could not find the category"

        cat.title = title
        cat.description = description
        cat.parent = parent

        cat.save (err)->
          console.log err
          if !err
            res.json 200, cat
          else
            res.send 404, "Could not update resource"
      
    app.del "/categories/:id", (req, res)->
      Cat = Category.findById req.params.id, (err, Category)->
        if err
          res.send 404, "Error: Could not find the category"

      Cat.remove (err, category)->
        if !err
          res.json 200, category
        else
          res.send 404, "Error: Could not delete the resource"

module.exports = routes