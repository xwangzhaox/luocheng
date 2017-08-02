# == Schema Information
#
# Table name: base_settings
#
#  id                        :integer          not null, primary key
#  home_banner_1_title       :string(255)
#  home_banner_1_description :string(255)
#  home_banner_2_title       :string(255)
#  home_banner_2_description :string(255)
#  home_banner_3_title       :string(255)
#  home_banner_3_description :string(255)
#  home_center_title         :string(255)
#  home_center_description   :string(255)
#  home_center_content       :text(65535)
#  location                  :string(255)
#  phone                     :string(255)
#  footer_text               :string(255)
#  copyright                 :string(255)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

require 'test_helper'

class BaseSettingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
