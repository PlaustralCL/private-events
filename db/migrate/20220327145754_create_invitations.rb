class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.references :event
      t.references :attendee, references: :users, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
