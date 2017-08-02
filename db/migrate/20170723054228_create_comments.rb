class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :name
      t.string :phone
      t.string :wechat
      t.text :message
      t.string :ip

      t.timestamps
    end
  end
end
