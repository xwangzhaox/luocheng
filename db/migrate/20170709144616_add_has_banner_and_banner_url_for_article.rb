class AddHasBannerAndBannerUrlForArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :has_banner, :boolean, default: false
    add_column :articles, :banner_url, :string
  end
end
