class Hobby
  include Mongoid::Document

  field :name,   type:String
  #key :started, Time




  has_one :parent  , class_name: 'User' , inverse_of: :positioning


  embedded_in :user


end
