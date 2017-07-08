class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.references :category
      t.string :title
      t.string :en_title
      t.string :description
      t.text :content
      t.integer :view_count

      t.timestamps
    end
  end
end
