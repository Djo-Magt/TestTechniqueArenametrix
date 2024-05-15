class AddFileItemIdToReservations < ActiveRecord::Migration[7.1]
  def change
    add_reference :reservations, :file_item, null: false, foreign_key: true, default: 1
  end
end
