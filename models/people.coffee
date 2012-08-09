class people_model
  @people =[
      {
        name: "John Schwartz Jacobsen"
        address: "Dalslandsgade"
      }
      {
        name: "Súni Schwartz Jacobsen"
        address: "Heygstún"
      }
  ]

  @getAll: ()=>
    @people

module.exports = people_model