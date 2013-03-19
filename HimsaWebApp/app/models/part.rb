class Part
  include Mongoid::Document

  # part name, ex: eye
  field :name, type:String


  #position, default is center
  field :position , type:String


  #offset , default is 0,0
  field :offset , type:Integer


  #name of the parent part
  #Main body parts have no parents (male here)
  field :parent_name,type:String


  #How deep is this part?
  field :level , type:Integer


  #User IDs eligible for this part , empty means all
  field :user_ids , type:Array




  #this relationship is for rendering this object to avatar
  #it could have many renderings according to the purpose (avatar , library ) in the future
  #the default scale for displaying it in THE LIBRARY is the image size
  #belongs_to :render



  has_and_belongs_to_many :library


  #this determines who this element is positioned to , if it's empty the element is positioned to the parent
  #has_one :parent_relative  , class_name: 'Part' , inverse_of: :child_relative

 # belongs_to :child_relative , class_name: 'Part' , inverse_of: :parent_relative



  has_many :child_parts  , class_name: 'Part' , inverse_of: :parent_part

  belongs_to :parent_part , class_name: 'Part' , inverse_of: :child_parts




  has_many :variances


end
