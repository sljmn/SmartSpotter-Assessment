class RemoveEndTimeFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :end_time, :integer
  end
end
