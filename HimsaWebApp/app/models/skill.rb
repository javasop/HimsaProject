class Skill
  include Mongoid::Document

  field :description , type: String



  #this holds the tree of knowledge
  has_many :child_skills  , class_name: 'Skill' , inverse_of: :parent_skills

  belongs_to :parent_skills , class_name: 'Skill' , inverse_of: :child_skills




  #every skill has many exercises or tasks
  has_many :tasks



end
