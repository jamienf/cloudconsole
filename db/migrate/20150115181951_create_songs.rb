class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :band_id, null: false
      t.string :title, null: false
      t.integer :tempo, null: false
    end
  end
end
