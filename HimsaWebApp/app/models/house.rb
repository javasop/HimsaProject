class House
  include Mongoid::Document


  #this houses the concepts in one meaningful place , Ex: java is a house for loops and classes and objects


  #list of users subscribe to this house
  field :subscribers , type: Array



  has_and_belongs_to_many :concepts

  has_and_belongs_to_many :explanations



end
