class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :building_name
      t.integer :room_id
      t.string :roomtype
      t.text :description
      t.boolean :booked
      t.string :booker
      t.time :operate_start
      t.time :operate_end
      t.timestamps
    end
  end
  def down
    drop_table :rooms
  end
end
