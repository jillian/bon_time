class ChangeTripDurationToInteger < ActiveRecord::Migration
  def change
    remove_column(:attendances, :trip_duration)
    add_column(:attendances, :trip_duration, :integer)
  end
end
