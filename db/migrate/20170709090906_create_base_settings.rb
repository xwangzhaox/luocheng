class CreateBaseSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :base_settings do |t|
      t.string :home_banner_1_title
      t.string :home_banner_1_description
      t.string :home_banner_2_title
      t.string :home_banner_2_description
      t.string :home_banner_3_title
      t.string :home_banner_3_description
      t.string :home_center_title
      t.string :home_center_description
      t.text :home_center_content
      t.string :location
      t.string :phone
      t.string :footer_text
      t.string :copyright

      t.timestamps
    end
  end
end
