class Topic < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :subscribes, dependent: :destroy
  validates :topic_name, presence: true

  before_destroy :ensure_not_referenced_by_any_subscribe

  private

  # 确保没有订阅仍在引用该主题
  def ensure_not_referenced_by_any_subscribe
    unless subscribes.empty?
      errors.add(:base, 'Subscribes present')
      throw :abort
    end
  end
end
