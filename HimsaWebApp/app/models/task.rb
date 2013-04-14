class Task
  include Mongoid::Document

  #this can be a generic class to more specific task types
  #or we can just embed different task types to concepts
  #or Both


 #the name that appears for this task (Exercise)
 field  :name  , type: String

 #we have : main , extra , game ...
 field :task_type , type: String


 belongs_to :concept

end
