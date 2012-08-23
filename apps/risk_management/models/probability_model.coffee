mongoose = require "mongoose"

ProbabilitySchema = new mongoose.Schema
  title: 
    type: String
    required: true
  value:
    type: Number
    required: true
  
Probability = mongoose.model "Probability", ProbabilitySchema, "Probabilities"

module.exports = Probability