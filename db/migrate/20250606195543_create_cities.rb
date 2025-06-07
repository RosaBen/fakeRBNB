class CreateCities < ActiveRecord::Migration[8.0]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :zip_code, null: false
    end
  end
end
