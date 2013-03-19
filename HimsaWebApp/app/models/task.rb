class Task < ActiveRecord::Base

  attr_accessible :name , :task_type

  set_table_name :task

end
