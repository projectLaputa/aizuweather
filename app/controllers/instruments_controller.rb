class InstrumentsController < ApplicationController
	before_filter :check_logined, :only => ['new', 'edit', 'create', 'update', 'destroy']
	# GET /instruments
  # GET /instruments.json
  def index
    	@instruments = Instrument.all

    	respond_to do |format|
    	  format.html # index.html.erb
    	  format.json { render :json => @instruments }
    	end
  end

  # GET /instruments/1
  # GET /instruments/1.json
  def show
    @instrument = Instrument.find(params[:id])
  end

  # GET /instruments/new
  # GET /instruments/new.json
  def new
    @instrument = Instrument.new
  end

  # GET /instruments/1/edit
  def edit
    @instrument = Instrument.find(params[:id])
		if (@instrument.user.id != session[:user]) && (@login_user.admin == false)
			redirect_to user_path(session[:user])
		end
  end

  # POST /instruments
  # POST /instruments.json
  def create
    @instrument = Instrument.new(params[:instrument])

    respond_to do |format|
      if @instrument.save
        format.html { redirect_to @instrument, :notice => 'Instrument was successfully created.' }
        format.json { render :json => @instrument, :status => :created, :location => @instrument }
      else
        format.html { render :action => "new" }
        format.json { render :json => @instrument.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /instruments/1
  # PUT /instruments/1.json
  def update
    @instrument = Instrument.find(params[:id])
		if (@instrument.user.id != session[:user]) && (@login_user.admin == false)
			redirect_to user_path(session[:user])
		end
    respond_to do |format|
      if @instrument.update_attributes(params[:instrument])
        format.html { redirect_to @instrument, :notice => 'Instrument was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @instrument.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /instruments/1
  # DELETE /instruments/1.json
  def destroy
    @instrument = Instrument.find(params[:id])
		if (@instrument.user.id != session[:user]) && (@login_user.admin == false)
			redirect_to user_path(session[:user])
		end
    @instrument.destroy

    respond_to do |format|
      format.html { redirect_to user_path(session[:user]) }
      format.json { head :ok }
    end
  end

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
