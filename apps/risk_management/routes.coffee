
routes = (app)->
  app.get "/", (req, res)->
    res.render "risk_management/index", title: "Risk Management"
  
module.exports = routes