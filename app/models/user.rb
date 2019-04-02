class User < ApplicationRecord
  has_many :subscribes, dependent: :destroy


  def self.find_or_create_user(auth_user_hash)
    self.find_or_create_by(:id => auth_user_hash.id) do |user|
      user.email = auth_user_hash.email
      # user.team_id = auth_user_hash.team_id
      # user.grade_id = auth_user_hash.grade_id
      # user.user_type_id = auth_user_hash.user_type_id
    end
  end
end
