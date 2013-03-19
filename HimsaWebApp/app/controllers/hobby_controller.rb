class HobbyController < ApplicationController


  def index

    #creating a dummy user for the hobbies to link to

    hobby = Hobby.new(:name => 'hobby' , :user_id => 111 , :new_stuff => 'no')


    @user = User.new(:name => 'os' , :new => 'yes' )

    @user.hobbies.build(hobby)

    @user.save!

    @selected_user =  User.where(:name => 'os').to_a



  end

end
