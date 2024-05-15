class RemoveColumnFromFile < ActiveRecord::Migration[7.1]
  def change
    remove_column :file_items, :data, :binary
  end
end
