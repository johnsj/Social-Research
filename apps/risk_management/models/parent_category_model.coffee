mongoose = require "mongoose"

ParentCategorySchema = new mongoose.Schema
  title: String
  description:String
  
ParentCategory = mongoose.model "ParentCategory", ParentCategorySchema, "ParentCategories"

module.exports = ParentCategory