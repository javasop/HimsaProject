class LibraryController < ApplicationController


  #the operations here except the first method are for the admin only

  #seed the mongodb document starting with a gender as a root then going to the main part.
  def populate

    @library = Library.new(:team_id => 1 , :user_ids => [-1])

    @library2 = Library.new(:team_id => 2 , :user_ids => [-1] )

    part =  Part.new(:name => 'library' ,:level => 1  , :user_ids => [-1] , :parent_part_ids => [11,22] )

    #this is the avatar structure
    alt_part = Part.new(:name => 'avatar' , :level => 1 , :user_ids => [-1] , :parent_part_ids => [11,22] )



    @part1 = Part.new(:name => 'head' ,:level => 2 , :user_ids => [-1]  )

    part2 = Part.new(:name => 'body' ,:level => 2 , :user_ids => [-1] )

    part3 = Part.new(:name => 'left_arm' ,:level => 2 , :user_ids => [-1] )

    part4 = Part.new(:name => 'right_arm' ,:level => 2 , :user_ids => [-1] )

    part5 = Part.new(:name => 'left_leg' ,:level => 2 , :user_ids => [-1] )

    part6 = Part.new(:name => 'right_leg' ,:level => 2 , :user_ids => [-1] )


    @alt_part1 = Part.new(:name => 'head' ,:level => 2 , :user_ids => [-1]  )

    alt_part2 = Part.new(:name => 'body' ,:level => 2 , :user_ids => [-1] )

    alt_part3 = Part.new(:name => 'left_arm' ,:level => 2 , :user_ids => [-1] )

    alt_part4 = Part.new(:name => 'right_arm' ,:level => 2 , :user_ids => [-1] )

    alt_part5 = Part.new(:name => 'left_leg' ,:level => 2 , :user_ids => [-1] )

    alt_part6 = Part.new(:name => 'right_leg' ,:level => 2 , :user_ids => [-1] )





    #save part first to automatically save children
    part.save!

    alt_part.save!







    #pushing parts to the library character for structuring purposes (displaying the selection menu)
    part.child_parts.push(@part1)
    part.child_parts.push(part2)
    part.child_parts.push(part3)
    part.child_parts.push(part4)
    part.child_parts.push(part5)
    part.child_parts.push(part6)







    child_part =  Part.new(:name => 'eye' ,  :parent_name => 'head' , :level => 3  , :user_ids => [-1]   )


    #pushing second level children
    @part1.child_parts.push(child_part)


    variance1 = Variance.new(:res => 'bear_head.png' , :user_ids => [-1] )

    variance2 = Variance.new(:res => 'body.png' , :user_ids => [-1] )

    variance3 = Variance.new(:res => 'left_Hand.png' , :user_ids => [-1] )

    variance4 = Variance.new(:res => 'right_Hand.png' , :user_ids => [-1] )

    variance5 = Variance.new(:res => 'right_left_leg.png' , :user_ids => [-1]  )

    variance6 = Variance.new(:res => 'wicked_body.png' , :user_ids => [-1] )

    child_variance = Variance.new(:res => 'EyesPurple.png',  :position => 'center' , :user_ids => [-1]  )





    #pushing variances
    @part1.variances.push(variance1)
    part2.variances.push(variance2)
    part2.variances.push(variance6)
    part3.variances.push(variance3)
    part4.variances.push(variance4)
    part5.variances.push(variance5)
    part6.variances.push(variance5)




    #pushing variance for child part
    child_part.variances.push(child_variance)



    #add the body to the root of everything
    alt_part.child_parts.push(alt_part2)

    #add the rest of the parts to the body
    alt_part2.child_parts.push(@alt_part1)
    alt_part2.child_parts.push(alt_part3)
    alt_part2.child_parts.push(alt_part4)
    alt_part2.child_parts.push(alt_part5)
    alt_part2.child_parts.push(alt_part6)





    @library2.save!

    @library.save!



    #push the library part to the root
    @library.parts.push(part)

    #push the avatar part to the root
    @library.parts.push(alt_part)



    @library2.parts.push(part)




      render('show')

  end


  def index



  end

  #create a new library
  def create

  end


  #get the full library
  def list

  end


  #add a part to the library and comes the variance with it
  def add

    #create




    #render('library/show')


  end


  #delete a part, all children will be deleted
  def delelte

  end


  #update a part
  def update

  end



#----------------------------------------
  # variance handling
#----------------------------------------


  #add a variance
  #you will take the part selected and do a build
  def add_variance

  end


  #update a variance
  def update_variance

  end


  #delete a variance
  def delete_variance

  end


  #list variance
  def list_variance

  end




end
