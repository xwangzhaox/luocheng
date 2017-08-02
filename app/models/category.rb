# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  en_name     :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string(255)
#  content     :text(65535)
#
# Indexes
#
#  index_categories_on_en_name  (en_name)
#  index_categories_on_name     (name)
#

require 'chinese_pinyin'

class Category < ApplicationRecord
  has_many :articles
  before_save :save_en_name

  def save_en_name
    self.en_name = Pinyin.t(self.name, splitter: '-') if self.attribute_changed?(:name) and self.en_name.nil?
  end
end
