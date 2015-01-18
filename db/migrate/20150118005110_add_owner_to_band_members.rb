class AddOwnerToBandMembers < ActiveRecord::Migration
  def change
    add_column :band_members, :owner, :boolean, null: false
  end
end
