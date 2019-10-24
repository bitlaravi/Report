class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :pnr_no
      t.string :origin
      t.string :destination
      t.date :issued_date
      t.date :travel_date
      t.string :issued_by
      t.boolean :is_canceled
      t.integer :route_id
      t.integer :reservation_id
      t.float :total_fare
      t.integer :no_of_seats

      t.timestamps
    end
  end
end
