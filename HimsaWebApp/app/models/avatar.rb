class Avatar
  include Mongoid::Document

  #this is the link to Relational Database
  field :user_id, type: Integer


  #relationship
  has_many :variances

  #relationship
  has_many :parts




end
