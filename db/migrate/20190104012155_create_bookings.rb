class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :room_id
      t.integer :booker_id
      t.text :reason
      t.time :time_start
      t.time :time_end
      t.timestamps
    end
  end
  def down
    drop_table :bookings
  end
end
