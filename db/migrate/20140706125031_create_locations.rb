class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.string :city
      t.string :postcode
      t.float :latitude
      t.float :longitude
      t.string :location_label
      t.belongs_to :addressable, polymorphic: true

      t.timestamps
    end
    add_index :locations, [:addressable_id, :addressable_type]
  end
end
