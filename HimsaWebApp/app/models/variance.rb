class Variance
  include Mongoid::Document

  #create a constructor to initialize the default values

  #name
  field :name, type:String

  #resource link
  field :res, type:String


  #this the size relative to the parent ? so 1 means the same , 2 means double the parent , 1/2 ... etc
  #default is the image original width and height
  field :size , type:Fixnum , default: 1


  #position , ex: top right , center ...etc
  #default is that it follows the parent part position
  field :position , type: String  , default: 'center'


  #offset of this variance from the part it belongs to (this will change the bitmap's position), if empty it means that it will follow the parent's posiiton
  field :offset , type:String , default: '0,0'

  #users ids eligible  , -1 means all users are eligible
  field :user_ids , type: Array , default: [-1]



  #this is also used in the positioning stuff
  belongs_to :part


  #we only store variances in the Avatar Document, it's unnecessary to store parts in avatar
  #we get the variances of the avatar and attach them to the appropriate container.
  belongs_to :avatar





end
