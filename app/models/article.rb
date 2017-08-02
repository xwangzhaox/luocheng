# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  category_id :integer
#  title       :string(255)
#  en_title    :string(255)
#  description :string(255)
#  content     :text(65535)
#  view_count  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  has_banner  :boolean          default(FALSE)
#  banner_url  :string(255)
#
# Indexes
#
#  index_articles_on_category_id  (category_id)
#

require 'chinese_pinyin'

class Article < ApplicationRecord
  belongs_to :category
  before_save :save_en_title, :init_description, :check_banner_exist

  scope :recommend_news, -> { where(has_banner: true).order('created_at desc').limit(4) }
  scope :except_news_list, ->(id) {where('category_id = ? and id != ?',2 ,id).limit(10)}

  def save_en_title
    self.en_title = Pinyin.t(self.title, splitter: '-') if self.attribute_changed?(:title) and (self.en_title.nil? or self.en_title.gsub(" ", "")=="")
  end

  def check_banner_exist
    self.has_banner = self.content.scan(/<img[^>]*>/).any?{|img|check_banner_size_up_to_standard(img)}
  end

  def init_description
    if self.description.nil? or self.description.gsub(" ", "") == ""
      self.description = self.no_tag_content[0..500]
    end
  end

  def categories_id_enum
    Category.all.map{|c|[c.name, c.id]}
  end

  def no_tag_content
    self.content.gsub(/<\/?.*?>/, "")
  end

  private
  def check_banner_size_up_to_standard(str)
    width, height = str.match(/width:\s(.*)px;\sheight:\s(.*)px/).to_a.last(2)
    width = width.to_i
    height = height.to_i
    binding.pry
    if(width/height.to_f >= 1.5 and width/height.to_f <= 1.8)
      self.banner_url = str.match(/(?<=src=").*?(?=".*?>)/)[0]
    end
  end
end
