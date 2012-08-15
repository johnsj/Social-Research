@app = @app || {}

class Category extends Backbone.Model
  
  defaults:
    title: "Some title",
    description: "Some description"

@app.Category = Category