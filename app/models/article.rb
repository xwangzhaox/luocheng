require 'chinese_pinyin'

class Article < ApplicationRecord
  after_save :save_en_title

  def save_en_title
    if self.title.changed?
      self.update_attributes(en_title: Pinyin.t(self.title))
    end
  end

end
