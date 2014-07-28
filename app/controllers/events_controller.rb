class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = current_user.events
    @pending_attendances = current_user.attendances.where("accepted IS NULL").order('created_at ASC')
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = current_user.events.find(params[:id])
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.build_location
    5.times do
      @event.attendances.build
    end 
    # ^^^^ should not go here
    # @event.attendances.build
  end

  # GET /events/1/edit
  def edit

  end

  # POST /events
  # POST /events.json
  def create
    attendance_params = {
      location_id: params[:starting_location][:location_id],
      user_id: current_user.id
    }.merge(params[:attendance])

    @event = current_user.events.new(event_params)
    @attendance = @event.attendances.build(attendance_params)

    respond_to do |format|
      if @event.save
        # current_user.id = @attendance.user.id
        format.html { redirect_to [@user, @event], notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:date, :time, :user_id, location_attributes:[:address, :city, :postcode, :latitude, :longitude], invitations_attributes: [:user_id])
    end
end