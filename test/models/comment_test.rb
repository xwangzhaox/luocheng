# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  phone      :string(255)
#  wechat     :string(255)
#  message    :text(65535)
#  ip         :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
