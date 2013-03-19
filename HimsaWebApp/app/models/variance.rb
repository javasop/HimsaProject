class Variance
  include Mongoid::Document

  #name
  field :name, type:String

  #resource link
  field :res, type:String

  #part_name
  field :part_name , type:String


  #scale this variance , increase its size from the normal size ?
  field :size , type: Integer


  #position , ex: top right , center ...etc
  field :position , type: String


  #offset of this variance from the part it belongs to (this will change the bitmap's position), if empty it means that it will follow the parent's posiiton
  field :offset , type: Integer

  #users ids eligible
  field :user_ids , type: Array



  #this is also used in the positioning stuff
  belongs_to :part


  has_and_belongs_to_many :avatar





end
