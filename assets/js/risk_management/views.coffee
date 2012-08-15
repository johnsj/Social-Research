@app = @app || {}

class NewCategoryView extends Backbone.View
  el: $('#category-form-container')

  tagname: 'div'
  
  template: _.template $('#category-form-template').html()
  
  initialize: ->
    _.bindAll @

    @collection = new app.Categories
    @collection.fetch()

    @collection.bind 'reset', @render
    @collection.bind 'add', @clearform
    
  render: ->
    $(@el).html @template
    _.each @collection.where({isParent:true}), (model)->
      $('select#category-parent').append '<option value="' + model.get('_id') + '">' + model.get('title') + '</option>'
    @

  events:
    "click button#add-item": 'create'

  clearform: ->
    $('input#category-title').val("")
    $('input#category-description').val("")
    $('input#category-isParent').attr('checked', false)
    $('select#category-parent option:first-child').attr('selected', 'selected')

  create: ->
    title = $('input#category-title').val()
    description = $('input#category-description').val()
    isParent = if $('input#category-isParent').attr('checked') then true else false
    parent = $('select#category-parent option:selected').val()
    parent = null if parent = 'no-parent'

    newItem = @collection.create
      title: title
      description: description
      parent: parent
      isParent: isParent

    @trigger 'add', newItem

class CategoryView extends Backbone.View
  tagName: 'tr#category-single'

  template: _.template $('#category-template').html()
  
  initialize: ->
    _.bindAll @
    
  render: ->
    $(@el).html @template @model.toJSON()
    @

class CategoriesView extends Backbone.View

  el: $ "div#category-container"

  render:->
    $(@el).append '<table class="categories"></table>'
    newView = new app.NewCategoryView()
    newView.bind 'add', @appendItem
    @repopulate

  initialize:->
    _.bindAll @
    
    @collection = new app.Categories
    @collection.fetch()
    @collection.bind 'add', @appendItem
    @collection.bind 'add reset', @repopulate

    @render()
    
  appendItem: (item)->
    item_view = new app.CategoryView {model: item}
    $('table.categories').append item_view.render().el
    
  repopulate: ()->
    $('table.categories').empty()
    @appendItem model for model in @collection.models

@app.NewCategoryView = NewCategoryView
@app.CategoryView = CategoryView
@app.CategoriesView = CategoriesView

console.log "is this run?"