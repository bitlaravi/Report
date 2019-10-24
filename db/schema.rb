# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_14_060301) do

  create_table "bookings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "pnr_no"
    t.string "origin"
    t.string "destination"
    t.date "issued_date"
    t.date "travel_date"
    t.string "issued_by"
    t.boolean "is_canceled"
    t.integer "route_id"
    t.integer "reservation_id"
    t.float "total_fare"
    t.integer "no_of_seats"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "cities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "city_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "route_id", null: false
    t.string "origin"
    t.string "destination"
    t.time "departure_time"
    t.time "arraival_time"
    t.time "duration"
    t.string "boarding_point"
    t.string "dropping_point"
    t.date "travel_date"
    t.integer "total_seats"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["route_id"], name: "index_reservations_on_route_id"
  end

  create_table "routes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "service_name"
    t.string "service_num"
    t.string "origin"
    t.string "destination"
    t.integer "total_seats"
    t.time "duration"
    t.string "bording_point"
    t.string "dropping_point"
    t.time "departure_time"
    t.time "arrival_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tickets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.string "seat_no"
    t.integer "total_seat"
    t.float "base_fare"
    t.float "discount"
    t.float "gst_percent"
    t.float "gst_amount"
    t.float "net_amount"
    t.float "total_amount"
    t.float "cancel_percent"
    t.boolean "is_canceled"
    t.float "canceled_amount"
    t.float "refund_amount"
    t.date "issued_date"
    t.date "travel_date"
    t.integer "booked_seat_count"
    t.integer "canceled_seat_count"
    t.string "pnr_no"
    t.integer "route_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_tickets_on_booking_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "user_emp_id"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bookings", "users"
  add_foreign_key "reservations", "routes"
  add_foreign_key "tickets", "bookings"
end
