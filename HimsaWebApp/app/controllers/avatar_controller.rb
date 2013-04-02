class AvatarController < ApplicationController


  layout '_user'



#this handles all the operation coming from the user avatar change page







  def index

    @avatar = Avatar.new(:user_id => 1)

    @library = Library.find_by(team_id: 1)


    @avatar.save!

    @user_id = 1


    #all the variances will be added to the Avatar for testing purposes
    Variance.each do |variance|
      @avatar.variances.push(variance)
    end





   @avatar_variances =  @avatar.variances


  end


  #choose a variance
  #def add_variance


  #end


  #this will take the variances and update their reference to the avatar whether it's an addition or deletion
  def save_avatar


  end


end
