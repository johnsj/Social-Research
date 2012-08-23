mongoose = require "mongoose"

RiskSchema = new mongoose.Schema
  title: 
    type: String
    required: true
  description: String
  category: 
    type: mongoose.Schema.ObjectId
    ref: 'Category'
    required: true
  impact: 
    type: String
    required: true
  severity:
    type: mongoose.Schema.ObjectId
    ref: 'Severity'
    required: true
  probability:
    type: mongoose.Schema.ObjectId
    ref: 'Probability'
    required: true
  prior_detection:
    type: String
    required: true
  mitigation_approach:
    type: String
    required: true
  proposed_solutions:
    type: String
    required: true

  
Risk = mongoose.model "Risk", RiskSchema, "Risks"

module.exports = Risk