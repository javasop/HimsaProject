class Explanation
  include Mongoid::Document

  #we stack explanations to represent sections of a concept
  #for example : in introduction to java, we have : history , development ... etc



  #this is the text
  field :description , type: String

  #type of content stacked (is it code or something else? this is basically the sections that describe the concept)
  field :type , type: String

  #this explanation has to have a concept
  belongs_to :concept

  #LVL of this concept , say you want to talk about that java is a static language,
  # you will add an explanation, nesting explanation suggests the same thing, but this solves the current problem




  #this makes the explanation tied to one house (javascript has a different explanation of variables then java)
  #if it's empty it means that the explanation is common in all
  has_and_belongs_to_many :houses

  #if explanation is nested that means they have a further level (Starting from lvl 1 ... etc)
  has_many :child_explanations  , class_name: 'Concept' , inverse_of: :parent_concepts

  belongs_to :parent_explanation , class_name: 'Concept' , inverse_of: :child_concepts


end
