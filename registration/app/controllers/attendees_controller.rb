class AttendeesController < ApplicationController
  before_filter :load_current_event

  #protected

  def load_current_event
    @current_event = Event.last
  end
  # GET /attendees
  # GET /attendees.json
  def index
    @attendees = Attendee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @attendees }
    end
  end

  # GET /attendees/1
  # GET /attendees/1.json
  def show
    @attendee = Attendee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @attendee }
    end
  end

  # GET /attendees/new
  # GET /attendees/new.json
  def new
    @attendee = Attendee.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @attendee }
    end
  end

  # GET /attendees/1/edit
  def edit
    @attendee = Attendee.find(params[:id])
  end

  # POST /attendees
  # POST /attendees.json
  def create
    # if we've got an unpaid existing username
    @attendee = Attendee.where(:username => params[:attendee][:username], :paid => false).first
    if @attendee
      redirect_to edit_attendee_path(@attendee), :notice => 'Previous registration for '+@attendee.username+' was not completed, please re-check registration info and complete payment to secure registration.' and return
    end
    @attendee = @current_event.attendees.create(params[:attendee])
    respond_to do |format|
      if @attendee.save
        if params[:attendee][:date] == 'mandate'
          @attendee.mandaters.create(params[:attendee])
        end
        if params[:attendee][:date] == 'damedate'
          @attendee.damedaters.create(params[:attendee])
        end
        format.html { redirect_to @attendee, :notice => 'Attendee was successfully created.' }
        format.json { render :json => @attendee, :status => :created, :location => @attendee }
      else
        format.html { render :action => "new" }
        format.json { render :json => @attendee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /attendees/1
  # PUT /attendees/1.json
  def update
    # if we've got an unpaid existing username
#    @attendee = Attendee.where(:username => params[:attendee][:username], :paid => false).first
#   if @attendee.id === params[:id]
#     redirect_to edit_attendee_path(@attendee), :notice => 'Previous registration for '+@attendee.username+' was not completed, please re-check registration info and complete payment to secure registration.' and return
#   end

    @attendee = Attendee.find(params[:id])

    respond_to do |format|
      if @attendee.update_attributes(params[:attendee])
        format.html { redirect_to @attendee, :notice => 'Attendee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @attendee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attendees/1
  # DELETE /attendees/1.json
  def destroy
    @attendee = Attendee.find(params[:id])
    @attendee.destroy

    respond_to do |format|
      format.html { redirect_to attendees_url }
      format.json { head :no_content }
    end
  end
end
