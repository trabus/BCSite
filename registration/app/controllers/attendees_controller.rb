class AttendeesController < ApplicationController
  before_filter :load_current_event
  before_filter :authorize

  respond_to :html, :json

  # GET /attendees
  # GET /attendees.json
  def index
    @attendees = Attendee.all
    respond_with(@attendees)
  end

  # GET /attendees/1
  # GET /attendees/1.json
  def show
    @attendee = Attendee.find(params[:id])
    respond_with(@attendee)
  end

  # GET /attendees/new
  # GET /attendees/new.json
  def new
    @attendee = Attendee.new
    respond_with(@attendee)
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

    flash[:notice] = 'Attendee was successfully created.' if @attendee.save
    respond_with(@attendee)

  end

  # PUT /attendees/1
  # PUT /attendees/1.json
  def update

    @attendee = Attendee.find(params[:id])

    flash[:notice] = 'Attendee was successfully updated.' if @attendee.update_attributes(params[:attendee])
    respond_with(@attendee)
  end

  # DELETE /attendees/1
  # DELETE /attendees/1.json
  def destroy
    @attendee = Attendee.find(params[:id])
    @attendee.destroy

    respond_with(@attendee)
  end
end
