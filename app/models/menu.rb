# == Schema Information
#
# Table name: menus
#
#  id         :integer          not null, primary key
#  menu_type  :integer
#  type_value :integer
#  name       :string(255)
#  en_name    :string(255)
#  icon       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Menu < ApplicationRecord
  enum menu_type: [:article, :category]

  def url
    if self.menu_type == "article"
      article = Article.find(self.type_value)
      return "/news/" + article.en_title
    else
      category = Category.find(self.type_value)
      #return Rails.application.routes.url_helpers.category_path(category)
      return "/" + category.en_name
    end
  end
end
