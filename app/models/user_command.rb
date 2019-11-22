class UserCommand < ApplicationRecord
  validates :user_id, :class, :method, :prefix, presence: true
  belongs_to :user
end
