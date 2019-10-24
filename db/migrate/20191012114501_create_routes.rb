class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.string :service_name
      t.string :service_num
      t.string :origin
      t.string :destination
      t.integer :total_seats
      t.time :duration
      t.string :bording_point
      t.string :dropping_point
      t.time :departure_time
      t.time :arrival_time

      t.timestamps
    end
  end
end
