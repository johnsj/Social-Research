
routes = (app) ->
	app.get '/', (req, res)->
		res.render 'index',
			title: "Welcome to the Social Research Network"

module.exports = routes