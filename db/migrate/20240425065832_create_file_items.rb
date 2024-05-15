class CreateFileItems < ActiveRecord::Migration[7.1]
  def change
    create_table :file_items do |t|
      t.string :name
      t.binary :data

      t.timestamps
    end
  end
end
