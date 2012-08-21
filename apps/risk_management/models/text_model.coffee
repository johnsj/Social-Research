mongoose = require "mongoose"

TextSchema = new mongoose.Schema
  title: 
    type: String
    required: true
  description: String
  category: {type:mongoose.Schema.ObjectId, ref: 'Category', required: true}
  
Text = mongoose.model "Text", TextSchema, "Texts"

module.exports = Text