
routes = (app)->
    app.get "/", (req, res)->
        res.render "index", title:"Express: Main '/'"

module.exports = routes