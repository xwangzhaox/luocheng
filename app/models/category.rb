require 'chinese_pinyin'

class Category < ApplicationRecord
  after_save :save_en_name

  def save_en_title
    if self.title.changed?
      self.update_attributes(en_name: Pinyin.t(self.name))
    end
  end
end
