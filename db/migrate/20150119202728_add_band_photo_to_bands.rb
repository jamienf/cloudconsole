class AddBandPhotoToBands < ActiveRecord::Migration
  def change
    add_column :bands, :profile_photo, :string
  end
end
