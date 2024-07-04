class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :flat, null: false, foreign_key: true
      t.date :booked_from
      t.date :booked_until

      t.timestamps
    end
  end
end
