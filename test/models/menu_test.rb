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

require 'test_helper'

class MenuTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
