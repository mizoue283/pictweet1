class AddProfImgToUsers < ActiveRecord::Migration
  def change
    add_column :users, :prof_img, :text
  end
end
