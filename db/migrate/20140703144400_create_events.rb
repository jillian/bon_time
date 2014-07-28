class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.datetime :start_time
      t.references :user, index: true

      t.timestamps
    end
  end
end


      # t.string :address
      # t.string :city
      # t.string :zipcode
      # t.float :latitude
      # t.float :longitude