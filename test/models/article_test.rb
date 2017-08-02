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

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
