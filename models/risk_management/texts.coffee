mongoose = require "mongoose"

TextSchema = new mongoose.Schema
  title: 
    type: String
    required: true
  description:
    type: String
    required: true
  parent:
    type:mongoose.Schema.ObjectId
    ref: 'Category'
    required: true
  
Text = mongoose.model "Text", TextSchema, "Texts"

Text.schema.path('parent').validate (value)->
  if value is null
    return false
  return true

module.exports = Text