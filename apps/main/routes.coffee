
routes = (app) ->
  app.get '/', (req, res)->

    res.render "#{__dirname}/views/main",
      title: "Social Research Portal"
      newTitle: res.locals.newTitle

module.exports = routes