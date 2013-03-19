class Library
  include Mongoid::Document


  #this library is specific to a team
  field :team_id ,type: Integer


  #relationship
  has_and_belongs_to_many :parts



end
