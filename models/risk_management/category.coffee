mongoose = require "mongoose"

ParentCategorySchema = new mongoose.Schema
  title: String
  description:String

CategorySchema = new mongoose.Schema
  title: 
    type: String
    required: true
  description: String
  parent: {type:mongoose.Schema.ObjectId, ref: 'ParentCategory', default: null}
  
Category = mongoose.model "Category", CategorySchema, "Categories"

module.exports = Category