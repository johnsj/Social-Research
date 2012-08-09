people = require "../../models/people"

routes = (app) ->
  app.namespace '/people', (req, res) ->
    app.get '/', (req, res)->
      console.log people.getAll()
      res.render "#{__dirname}/views/list", 
        title: "List of people"
        newTitle: "Social Research | People"
        people: people.getAll()

module.exports = routes