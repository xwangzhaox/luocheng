require 'chinese_pinyin'

class Article < ApplicationRecord
  belongs_to :category
  before_save :save_en_title

  def save_en_title
    self.en_title = Pinyin.t(self.title, splitter: '-') if self.attribute_changed?(:title)
  end

  def categories_id_enum
      Category.all.map{|c|[c.name, c.id]}
  end

  rails_admin do
    # edit do
    #   field :category_id, :select
    #   field :content, :ck_editor
    #   field :title, :string
    #   field :en_title, :string
    # end
  end
end
