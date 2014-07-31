class AddNameToEvents < ActiveRecord::Migration
  def change
    add_column :events, :name, :string
    add_column :events, :location_id, :integer
  end
end
