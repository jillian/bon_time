class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = Attendance.all
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @event = Event.find(params[:event_id])
    @attendance = @event.attendances.build attendance_params

    respond_to do |format|
      if @attendance.save
        # send_invite
        format.html { redirect_to @attendance, notice: 'Attendance was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attendance }
      else
        format.html { render action: 'new' }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def accept_invite
    @attendance = Attendance.find(params[:id])
    @attendance.accept!
    redirect_to :back
  end

  def decline_invite
    @attendance = Attendance.find(params[:id])
    @attendance.reject!
    redirect_to :back
  end

  def send_invite
    if user_signed_in?
    @user = User.find params[:id]
    Attendance.create!(user: current_user, friend: @user)
    flash[:notice] = "Invite sent"
  else 
    redirect_to new_user_session_path, notice: "You need to sign in or sign up before continuing."
    end
  end

  DELETE /attendances/1
  def destroy
    @attendance.destroy
    redirect_to event_path, notice: 'No longer attending'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      # params.require(:attendance).permit(:user_id, :event_id, :location_id)
      params.require(:attendance).permit(:invitee)
    end
end
