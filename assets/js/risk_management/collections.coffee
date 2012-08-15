@app = @app || {}
class Categories extends Backbone.Collection
  model: app.Category
  url: "/api/risks/categories"
  
@app.Categories = new Categories