class CreateBandMembers < ActiveRecord::Migration
  def change
    create_table :band_members do |t|
      t.integer :user_id, null: false
      t.integer :band_id, null: false
      t.timestamps
    end
  end
end
