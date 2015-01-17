class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :song_id, null: false
      t.string :instrument, null: false
      t.string :soundcloud, null: false
      t.timestamps
    end
  end
end
