class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, null: false
      t.text :bio, null: false
      t.string :genre, null: false
      t.boolean :private, default: false, null: false
      t.timestamps
    end
  end
end
