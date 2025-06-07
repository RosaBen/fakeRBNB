class CreateReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
    end
  end
end
