require 'chinese_pinyin'

class Category < ApplicationRecord
  has_many :articles
  before_save :save_en_name

  def save_en_name
    self.en_name = Pinyin.t(self.name, splitter: '-') if self.attribute_changed?(:name) and self.en_name.nil?
  end
end
