class Avatar
  include Mongoid::Document

  #this is the link to Relational Database
  #every user has an avatar which goes directly here
  field :user_id, type: Integer


  #relationship
  has_many :variances




end
