mongoose = require "mongoose"

ParentCategorySchema = new mongoose.Schema
  title:
    type: String
    required: true
  description:String
  
ParentCategory = mongoose.model "ParentCategory", ParentCategorySchema, "ParentCategories"

module.exports = ParentCategory