class AddEndTimeToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :end_time, :datetime
  end
end
