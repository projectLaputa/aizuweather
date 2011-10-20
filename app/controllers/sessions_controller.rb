class SessionsController < ApplicationController
  def new
  	#hogehoge
	end

  def create
		user = User.authenticate(params[:session][:name],params[:session][:password])
		if user.nil?
			flash.now[:error] = "Couldn't Sign In."
			render 'new'
		else
			session[:user] = user.id
			session[:name] = user.name
			redirect_to user
		end
  end

  def destroy
		reset_session
		redirect_to root_path 
  end

end
