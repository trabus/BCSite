class RegisterController < ApplicationController
  before_filter :load_current_event

  respond_to :html, :json

  # GET /register
  # GET /register.json
  def index
    @attendees = Attendee.all
    respond_with(@attendees)
  end

  # GET /register/1
  # GET /register/1.json
  def show
    @attendee = Attendee.find(params[:id])
    respond_with(@attendee)
  end

  # GET /register/new
  # GET /register/new.json
  def new
    @attendee = Attendee.new
    respond_with(@attendee)
  end

  # GET /register/1/edit
  def edit
    @attendee = Attendee.find(params[:id])
  end

  # POST /register
  # POST /register.json
  def create
    # if we've got an unpaid existing username
    @attendee = Attendee.where(:username => params[:attendee][:username], :paid => false).first
    if @attendee
      redirect_to edit_register_path(@attendee), :notice => 'Previous registration for '+@attendee.username+' was not completed, please re-check registration info and complete payment to secure registration.' and return
    end
    @attendee = @current_event.attendees.create(params[:attendee])

    flash[:notice] = 'Attendee was successfully created.' if @attendee.save
    respond_with(@attendee, :location => register_path)

  end

  # PUT /attendees/1
  # PUT /attendees/1.json
  def update

    @attendee = Attendee.find(params[:id])

    flash[:notice] = 'Attendee was successfully updated.' if @attendee.update_attributes(params[:attendee])
    respond_with(@attendee, :location => register_path)
  end

  # DELETE /attendees/1
  # DELETE /attendees/1.json
  def destroy
    @attendee = Attendee.find(params[:id])
    @attendee.destroy

    respond_with(@attendee)
  end
end
