class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.text :caption
      t.integer :place_id
      t.integer :user_id
      t.string :picture
      t.timestamps
    end
      # add_index :photos, [:caption, :place_id]
  end
end
