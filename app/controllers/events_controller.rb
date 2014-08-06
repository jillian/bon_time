class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = current_user.events
    # @events = current_user.attendances.where("accepted IS TRUE").map(&:event).compact
    # @events = Event.all

    @pending_attendances = Attendance.where('attendee_id = current_user.id AND accepted IS NULL')
  end

  def attendances
    @pending_attendances = Attendance.where('attendee_id = current_user.id AND accepted IS NULL')
  end

  # GET /events/1
  # GET /events/1.json
  def show
    # @event = current_user.events.find(params[:id])
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.build_location
    # 5.times do
    @event.attendances.build
    # end
    @event.build_creator
  end

  # GET /events/1/edit
  def edit

  end

  # POST /events
  # POST /events.json
  def create
    @event = current_user.events.new(event_params)
    @event.creator = current_user
    # @event.address = params[:event][:location_attributes][:address]
    binding.pry

    respond_to do |format|
      if @event.save
        attendance = Attendance.new(
          transport_mode: params[:event][:attendances_attributes]["0"][:transport_mode],

          event_id: @event.id,
          starting_location_id: params[:event][:attendances_attributes]["1"][:location_id],
          accepted: 'TRUE',
          creator_id: current_user.id)
        attendance.save!

        pending_attendance = Attendance.new(
          event_id: @event.id,
          creator_id: @event.creator_id,
          attendee_id: params[:attendances][:attendee_id]
          )
        pending_attendance.save!

        flash[:notice] = "Invite sent"

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
      params.require(:event).permit(:name, :start_time, :date, :time, :creator, :attendances["attendee_id"], {location_attributes:[:address, :city, :postcode, :latitude, :longitude]}, {attendances_attributes:[:transport_mode, :attendee_id, :host_id, :name, :starting_location_id]})
    end
end
