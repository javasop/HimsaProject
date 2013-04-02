class Part
  include Mongoid::Document

  # part name, ex: eye , should be unique
  field :name, type:String


  #position, default is center , this position is relative to the parent
  #suggested positions: center , top-right, top-left, bottom-right, bottom-left , top , bottom , left , right
  #I can implement those using enums
  field :position , type:String  , default: 'center'


  #offset from the parent , default is 0,0
  #we can create a point class to store these values?
  field :offset , type:String  , default: '0,0'


  #name of the parent part
  #I deleted it because now all parts share the same ID
  #field :parent_name,type:String



  #this the size relative to the parent ? so 1 means the same , 2 means double the parent , 1/2 ... etc
  #No need , there's already a size for the variances which suffices , we only need position here
  #field :size , type:Integer





  #User IDs eligible for this part , -1 means all
  field :user_ids , type:Array   , default: [-1]






  #this relationship is for rendering this object to avatar
  #it could have many renderings according to the purpose (avatar , library ) in the future
  #the default scale for displaying it in THE LIBRARY is the image size
  #belongs_to :render



  has_and_belongs_to_many :libraries



  #all parts are positioned to something , this is mainly for the structure of the avatar
  has_many :relative_children  , class_name: 'Part' , inverse_of: :relative_parent

  belongs_to :relative_parent , class_name: 'Part' , inverse_of: :relative_child



  #this is for the structure of the library that the user choose from
  has_many :child_parts  , class_name: 'Part' , inverse_of: :parent_part

  belongs_to :parent_part , class_name: 'Part' , inverse_of: :child_parts



  has_many :variances










end
