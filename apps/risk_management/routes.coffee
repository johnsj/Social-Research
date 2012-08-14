<<<<<<< HEAD
Category = require "../../models/risk_management/categories"

categories = null

Category.find { parent: {"$exists":false}}, (err, cat)->
  unless err
    categories = cat

routes = (app) ->
  app.namespace '/risk', (req, res) ->
    app.get '/', (req, res)->
      res.render "#{__dirname}/views/list", 
        title: "List of Issues"
        categories: categories
        
=======
Category = require "./../../models/risk_management/category"

routes = (app)->
  app.namespace "/risks", ()->
    
    app.get "/", (req, res)->
      res.render "risk_management/index", title: "Risk Management: Dashboard"
  
  app.namespace "/api/risks", ()->
    app.get "/categories", (req, res)->
      Category.find (err, categories)->
        if !err
          res.json categories
        else
          res.send 404, err
>>>>>>> temp

module.exports = routes