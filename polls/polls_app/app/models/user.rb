# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates :username, uniqueness: true
  validates :username, presence: true

  has_many :authored_polls,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Poll,
    dependent: :destroy

  has_many :responses,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Response,
    dependent: :destroy
end
