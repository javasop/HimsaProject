class AvatarController < ApplicationController


  layout '_user'



#User library for a a fake user that consists of the all the parts except the 'eye'
  #this of course will be done within the admin panel and for testing purposes only







  def index

    @avatar = Avatar.new(:user_id => 1)

    @library = Library.find_by(team_id: 1)

    @user_id = 1


    #all the variances will be added to the user_library and Avatar
    Variance.each do |variance|
      @avatar.variances.push(variance)
    end


    @avatar.save!


   @avatar_variances =  @avatar.variances


  end


 #choose a part for avatar
  def add_part



  end

  #choose a variance
  def add_variance


  end



  def save_avatar


  end


end
