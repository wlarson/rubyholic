class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.datetime :date
      t.integer :group_id
      t.integer :location_id
      t.boolean :recurring
      t.float :duration

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
