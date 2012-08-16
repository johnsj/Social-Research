mongoose = require "mongoose"

CategorySchema = new mongoose.Schema
  title: 
    type: String
    required: true
  description: String
  parent: {type:mongoose.Schema.ObjectId, ref: 'ParentCategory', default: null}
  
Category = mongoose.model "Category", CategorySchema, "Categories"

module.exports = Category