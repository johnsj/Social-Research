mongoose = require "mongoose"

ParentCategorySchema = new mongoose.Schema
  title: String
  description:String

CategorySchema = new mongoose.Schema
  title: 
    type: String
    required: true
  description: String
  parent:
    type:mongoose.Schema.ObjectId
    ref: 'ParentCategory'
    required: true
  
Category = mongoose.model "Category", CategorySchema, "Categories"

Category.schema.path('parent').validate (value)->
  if value is null
    return false
  return true

module.exports = Category