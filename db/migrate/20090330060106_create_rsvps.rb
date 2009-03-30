class CreateRsvps < ActiveRecord::Migration
  def self.up
    create_table :rsvps do |t|
      t.string :email
      t.integer :event_id

      t.timestamps
    end
  end

  def self.down
    drop_table :rsvps
  end
end
