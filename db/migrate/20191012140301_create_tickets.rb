class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.references :booking, null: false, foreign_key: true
      t.string :seat_no
      t.integer :total_seat
      t.float :base_fare
      t.float :discount
      t.float :gst_percent
      t.float :gst_amount
      t.float :net_amount
      t.float :total_amount
      t.float :cancel_percent
      t.boolean  :is_canceled
      t.float :canceled_amount
      t.float :refund_amount
      t.date :issued_date
      t.date :travel_date
      t.integer :booked_seat_count
      t.integer :canceled_seat_count
      t.string :pnr_no
      t.integer :route_id
      t.integer :user_id

      t.timestamps
    end
  end
end
