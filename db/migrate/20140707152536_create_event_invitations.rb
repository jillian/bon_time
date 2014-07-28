class CreateEventInvitations < ActiveRecord::Migration
  def change
    create_table :event_invitations do |t|
      t.references :user, index: true
      t.references :event, index: true
      t.boolean :accepted

      t.timestamps
    end
  end
end
