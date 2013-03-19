class Render
  include Mongoid::Document

  #this render object is for the purpose of positioning both parts and variances
  #it contains the position the part or variance must adhere to as well as any size changes


  #position : center , top , custom?  relative to the parent , the default is center
  #i could make it that we use numbers or both ?
  field :position , type:String


  # X,Y offset to the position already given , it will be applied after the element is positioned
  field :offset , type:Integer



  #scale : is a number relative to the parent ? so 2 means twice as big .. etc
   field :scale , type:Integer



  #this element is positioned according to
  has_many :relative_parent , class_name: 'Part' ,


  #has many parts and many variances
  #parent relative to this position ?  variance or part?
  has_many :parts
  has_many :variances


end
