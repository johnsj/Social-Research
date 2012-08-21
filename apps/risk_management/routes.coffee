
routes = (app)->
  app.get "/risk_management", (req, res)->
    res.render "risk_management/index", title: "Risk Management"
  
module.exports = routes