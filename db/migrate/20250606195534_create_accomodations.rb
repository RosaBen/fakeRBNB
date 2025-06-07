class CreateAccomodations < ActiveRecord::Migration[8.0]
  def change
    create_table :accomodations do |t|
      t.integer :available_beds, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.boolean :has_wifi
      t.text :welcome_message, null: false
    end
  end
end
