mongoose = require "mongoose"

CategorySchema = new mongoose.Schema
  title: String,
  description: String,
  parent: mongoose.Schema.ObjectId,
  isParent: Boolean
  
Category = mongoose.model "Category", CategorySchema, "Categories"

module.exports = Category