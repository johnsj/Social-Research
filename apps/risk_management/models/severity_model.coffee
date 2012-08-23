mongoose = require "mongoose"

SeveritySchema = new mongoose.Schema
  title: 
    type: String
    required: true
  value:
    type: Number
    required: true
  
Severity = mongoose.model "Severity", SeveritySchema, "Severities"

module.exports = Severity