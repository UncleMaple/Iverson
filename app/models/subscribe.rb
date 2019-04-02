class Subscribe < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  validates :user_id, uniqueness: {scope: :topic_id, message: "已订阅该主题"}
end
