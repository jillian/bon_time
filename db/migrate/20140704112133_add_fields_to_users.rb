class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mobile_number, :string


  end
end


    # add_column :users, :home_address, :string
    # add_column :users, :home_city, :string
    # add_column :users, :home_postcode, :string
    # add_column :users, :home_latitude, :float
    # add_column :users, :home_longitude, :float
    # add_column :users, :work_address, :string
    # add_column :users, :work_city, :string
    # add_column :users, :work_postcode, :string
    # add_column :users, :work_latitude, :float
    # add_column :users, :work_longitude, :float