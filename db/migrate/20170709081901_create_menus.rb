class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.integer :menu_type
      t.integer :type_value
      t.string :name
      t.string :en_name
      t.string :icon

      t.timestamps
    end
  end
end
