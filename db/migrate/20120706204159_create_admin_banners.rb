class CreateAdminBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.attachment :banner

      t.timestamps
    end
  end
end
