class User
  include Mongoid::Document

  field :name, type:String
  field :age,  type:Integer
  field :hobby, type:Hobby

  embeds_many :hobbies




  belongs_to :positioning , class_name: 'Hobby' , inverse_of: :parent


end
