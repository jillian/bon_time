class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :user, index: true
      t.references :event, index: true
      t.references :location, index: true
      t.boolean :accepted
      t.integer :trip_duration

      t.timestamps
    end
  end
end
