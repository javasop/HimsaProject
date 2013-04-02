class Task
  include Mongoid::Document

 field  :name  , type: String



  field :task_type , type: String



  belongs_to :skill

end
