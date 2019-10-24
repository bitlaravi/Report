class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :route, null: false, foreign_key: true
      t.string :origin
      t.string :destination
      t.time :departure_time
      t.time :arraival_time
      t.time :duration
      t.string :boarding_point
      t.string :dropping_point
      t.date :travel_date
      t.integer :total_seats
      t.timestamps
    end
  end
end
