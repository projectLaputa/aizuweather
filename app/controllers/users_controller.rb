class UsersController < ApplicationController
	before_filter :check_logined, :only => ['index', 'show', 'destroy']
  def index
		if @login_user.admin == true
			@users = User.all
			@title = "All Users"
		else
			redirect_to user_path(@login_user.id)
		end
	end
	def new
  	@user = User.new
		@title = "New User"
	end
	def create
		@user = User.new(params[:user])
		respond_to do |format|
			if @user.save
				format.html { redirect_to(new_session_path, :notice => 'User was successfully created!!') }
			else
				format.html { render :action => "new" }
			end
		end
	end
	def show
		@user = User.find(params[:id])
		if @user.id != session[:user]
			redirect_to user_path(session[:user])
		else
			if @user.admin == true 
				@instruments = Instrument.all
				@title = "All instruments(Admin)"
			else
				@instruments = @user.instruments
				@title = @user.name + "'s instruments"
			end
		end
	end
	
	#def destroy
	#	@user = User.find(params[:id])
	#	if @user.id == session[:user]
	#		@user.destroy
	#	end
	#end

	private
	def check_logined
		if session[:user].nil?
			#redirect_to :controller => 'sessions', :action => 'new'
			redirect_to root_path
		else
			@login_user = User.find(session[:user])
			if @login_user.nil?
				reset_session
			end
		end
	end
end
