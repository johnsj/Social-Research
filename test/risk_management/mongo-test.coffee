require "should"
Category = require "../../models/risk_management/categories"

describe "Risk Management", ()->
  record = null
  beforeEach ()->
    Category.remove {name: "Trygdarútgerð"}, (err)->
      if err
        return new Error "SOMETHING WENT WRONG"

    record = new Category 
      name: "Trygdarútgerð"

    record.save()

  it "should be the same document", ()->
    record.name.should.eql "Trygdarútgerð"