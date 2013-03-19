class TaskController < ApplicationController

  layout '_user'

  def index

    @tasks = Task.where(:user_id => 1 )


    submit

  end

  def submit


    @outp = params[:username]


  end


end
