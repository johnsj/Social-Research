mongoose = require "mongoose"
db = mongoose.createConnection 'localhost', 'risk_management'

Category_Schema = new mongoose.Schema
  name: String
  description:String
  parent:
    type: mongoose.Schema.ObjectId


Category = db.model 'Category', Category_Schema, "Categories"

module.exports = Category