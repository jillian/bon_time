class LocationsController < ApplicationController
  before_filter :load_addressable, except: :create

  def index
    @locations = @addressable.locations
  end

  # currently fine as only use create for user
  def create
    filtered_params = params.require(:location).permit(:location_label, :address, :city, :postcode, :addressable_id, :addressable_type)
    l = current_user.locations.build(filtered_params)
    if l.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

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

private
  def load_addressable
    resource, id = request.path.split('/')[1, 2]
    @addressable = resource.singularize.classify.constantize.find(id)
  end
end

