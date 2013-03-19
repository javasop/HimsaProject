class Test
   def output (part)



    if part.child_parts.nil?


      return  true




      #if the user id array is not empty the user must be eligible
    elsif   part.user_ids.include?(-1) or part.user_ids.include?@user_id


                      part.variances.each do |variance|

                             if variance.user_ids.include?@user_id or variance.user_ids.include?(-1)



                            end


                       end




                part.child_parts.each do |child|



                        output child


                end







    end


   end




end