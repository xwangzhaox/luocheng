class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.name :String
      t.en_name :String

      t.timestamps
    end

    add_index :categories, :name
    add_index :categories, :en_name
  end
end
