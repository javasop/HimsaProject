class Concept
  include Mongoid::Document


  #this holds the tree of knowledge
  has_many :child_concepts  , class_name: 'Concept' , inverse_of: :parent_concepts

  belongs_to :parent_concepts , class_name: 'Concept' , inverse_of: :child_concepts



  #every concept should have some house for it (a project , course , or a recommendation)
  #it can belong to many houses making concepts reusable (java and ruby has the concept of variables)
  has_and_belongs_to_many :houses


  #every concept has many exercises or tasks  (games , extra tasks to do ... , team tasks ? )
  has_many :tasks


  #every concept has many explanation (structured content)
  #this is the text describing the concept
  #this can be further subdivided later to more sections ....
  #we push every explanation to create the content , so pushing an explanation first will make on top
  has_many :explanations



end
