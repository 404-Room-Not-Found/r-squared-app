class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :building_name
      t.integer :room_id
      t.integer :booker_id
      t.string :booker_name
      t.text :reason
      t.datetime :time_start
      t.datetime :time_end
      t.timestamps
    end
  end
  def down
    drop_table :bookings
  end
end
