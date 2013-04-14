class Explanation
  include Mongoid::Document

  #we stack explanations to represent a concept ...


  #this is the text
  field :description , type: String

  #type of content stacked (is it code or something else? this is basically the sections that describe the concept)
  field :type , type: String

  #this explanation has to have a concept
  belongs_to :concept

  #lvl of this explanation according to the user's level


  #this makes the explanation tied to one house (javascript has a different explanation of variables then java)
  #if it's empty it means that the explanation is common in all
  has_and_belongs_to_many :houses


end
