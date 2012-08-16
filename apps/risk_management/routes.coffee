Category = require "./models/category_model"
ParentCategory = require "./models/parent_category_model"

routes = (app)->
  app.namespace "/risks", ()->
    
    app.get "/categories", (req, res)->
      res.render "risk_management/categories/index", title: "Risk Management - Categories"
  
  app.namespace "/api/risks", ()->
    app.get "/parent-categories", (req, res)->
      ParentCategory.find (err, categories)->
        if !err
          res.json categories
        else
          res.send 404, err
    app.get "/categories", (req, res)->
      Category.find({}).populate('parent').exec (err, categories)->
        if !err
          res.json categories
        else
          res.send 404, err
    app.post "/categories", (req, res)->
      console.log req.body
      Category.create req.body, (err)->
        if !err
          res.send 200, "OK"
        else
          res.send 404, "Error: Could not create resource"

module.exports = routes