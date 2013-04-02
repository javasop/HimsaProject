class LibraryController < ApplicationController


  #the operations here except the first method are for the admin only

  #seed the mongodb document starting with a gender as a root then going to the main part.
  def populate

    @library = Library.new(:team_id => 1 , :user_ids => [-1])

    @library2 = Library.new(:team_id => 2 , :user_ids => [-1] )

    part =  Part.new(:name => 'library' ,:level => 1  , :user_ids => [-1]   )


    #every part that's duplicated will share an ID different from the object ID
    #I can creat a class called generic_part and add an ID to it all other parts are from it
    #and share the parent ID
    @part1 = Part.new(:name => 'head' ,:level => 2 , :position => 'top' )

    part2 = Part.new(:name => 'body' ,:level => 2   )

    part3 = Part.new(:name => 'left_arm' ,:level => 2  ,  :position => 'top-left' )

    part4 = Part.new(:name => 'right_arm' ,:level => 2 , :position => 'top-right' )

    part5 = Part.new(:name => 'left_leg' ,:level => 2  ,  :position => 'bottom-left' )

    part6 = Part.new(:name => 'right_leg' ,:level => 2 ,  :position => 'bottom-right' )








    #save part first to automatically save children
    part.save!









    #pushing parts to the library character for structuring purposes (displaying the selection menu)
    part.child_parts.push(@part1)
    part.child_parts.push(part2)
    part.child_parts.push(part3)
    part.child_parts.push(part4)
    part.child_parts.push(part5)
    part.child_parts.push(part6)


















    variance1 = Variance.new(:res => 'bear_head.png' )

    variance2 = Variance.new(:res => 'body.png' )

    variance3 = Variance.new(:res => 'left_Hand.png' )

    variance4 = Variance.new(:res => 'right_Hand.png' )

    variance5 = Variance.new(:res => 'right_left_leg.png' )

    #variance5 = Variance.new(:res => 'right_left_leg.png' )

    variance6 = Variance.new(:res => 'wicked_body.png'  )

   variance7 = Variance.new(:res => 'EyesPurple.png' , :size => 0.5 )





    #pushing variances
    @part1.variances.push(variance1)
    @part1.variances.push(variance7)
    part2.variances.push(variance2)
    part2.variances.push(variance6)
    part3.variances.push(variance3)
    part4.variances.push(variance4)
    part5.variances.push(variance5)
    part6.variances.push(variance5)









    #add the body to the root of everything
    part.relative_children.push(part2)

    #add the rest of the parts to the body
    part2.relative_children.push(part3)
    part2.relative_children.push(@part1)
    part2.relative_children.push(part4)
    part2.relative_children.push(part5)
    part2.relative_children.push(part6)







    @library2.save!

    @library.save!



    #push the library part to the root
    @library.parts.push(part)




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
