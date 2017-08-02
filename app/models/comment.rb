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

class Comment < ApplicationRecord
  scope :requests_on_same_ip, ->(ip) {where("ip = ? and created_at > ?", ip, Time.now-300)}

  validates_presence_of :name, :phone, :wechat, :message

  def self.verify_request?(ip)
    Comment.requests_on_same_ip(ip).count < 4
  end
end
