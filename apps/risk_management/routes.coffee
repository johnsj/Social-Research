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

module.exports = routes