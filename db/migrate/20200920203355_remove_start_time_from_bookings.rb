class RemoveStartTimeFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :start_time, :time
  end
end
