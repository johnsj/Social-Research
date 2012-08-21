window.Risk = window.Risk || {}
window.Risk.views = window.Risk.views || {}


class TextsView extends Backbone.View
  tagName: 'div'
  table_el: '#table-container'

  initialize:->
    _.bindAll @
    @template = _.template $('#text-main-template').html()
    @table_template = _.template $('#text-list-table-template').html()

    @collection = window.Risk.collections.Texts
    @collection.bind 'remove', @render, @

  render:->
    $(@el).html @template
    $(@el).find(@table_el).html @table_template
    _.each @collection.models, (model)=>
      itemView = new window.Risk.views.TextView({model: model})
      $(@el).find("tbody#text_list_content").append itemView.render().el
    @

window.Risk.views.TextsView = TextsView