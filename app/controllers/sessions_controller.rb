class SessionsController < ApplicationController
  def new
  	#hogehoge
	end

  def create
		user = User.authenticate(params[:session][:name],params[:session][:password])
		if user.nil?
			#flash.now[:error] = "Couldn't Sign In."
			redirect_to root_path
		else
			session[:user] = user.id
			session[:name] = user.name
			redirect_to root_path
		end
  end

  def destroy
		reset_session
		redirect_to root_path 
  end

end
