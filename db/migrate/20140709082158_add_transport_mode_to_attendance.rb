class AddTransportModeToAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :transport_mode, :string
  end
end
