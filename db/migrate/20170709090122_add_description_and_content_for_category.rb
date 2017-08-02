class AddDescriptionAndContentForCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :description, :string
    add_column :categories, :content, :text
  end
end
