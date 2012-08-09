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
        

module.exports = routes