class UserController < ApplicationController

     def index
          user = User.new(:name => 'Osama')
          hobby = Hobby.new(:name => 'programming' , :started => 11.years.ago)
          user.hobbies.push(hobby)

         @selected_user = user.hobbies.class

          hobby.parent = user

          @positioning = hobby.parent.to_json

       render('user')
     end

end
