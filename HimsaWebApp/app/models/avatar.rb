class Avatar
  include Mongoid::Document

  #this is the link to Relational Database
  field :user_id, type: Integer


  #relationship
  has_and_belongs_to_many :variances

  #relationship
  has_and_belongs_to_many :parts




end
