class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :event, index: true
      t.integer :starting_location_id, index: true
      t.boolean :accepted
      t.integer :trip_duration
      t.integer :attendee_id
      t.integer :creator_id

      t.timestamps
    end
  end
end
