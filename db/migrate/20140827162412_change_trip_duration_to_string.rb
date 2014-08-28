class ChangeTripDurationToString < ActiveRecord::Migration
  def change
    change_column(:attendances, :trip_duration, :string)
  end
end
