class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :phone_number, null: false
      t.text :description
      t.integer :user_type, default: 1, null: false
    end
    add_index :users, :email, unique: true
  end
end
