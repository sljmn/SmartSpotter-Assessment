class AddEndTimeToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :end_time, :integer
  end
end
