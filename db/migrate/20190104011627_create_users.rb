class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :usertype
      t.timestamps
    end
  end
  def down
    drop_table :users
  end
end
