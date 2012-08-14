mongoose = require "mongoose"

CategorySchema = new mongoose.Schema
  title: String,
  description: String,
  parent: mongoose.Schema.ObjectId
  
Category = mongoose.model "todo", CategorySchema, "Categories"

module.exports = Category