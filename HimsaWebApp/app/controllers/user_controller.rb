class UserController < ApplicationController

     def index
          user = User.new(:name => 'Osama')
          hobby = Hobby.new(:name => 'programming' , :started => 11.years.ago)
          user.hobbies.push(hobby)

         @selected_user = user.hobbies.class

          hobby.parent = user

          @positioning = hobby.parent.to_json


          task = Task.new(:name => 'hello')

          @skill = Skill.new(:description => 'say what')

          @skill.tasks.push(task)




       render('user')
     end

end
