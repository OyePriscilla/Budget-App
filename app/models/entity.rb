class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :name, :amount, :user_id, presence: true
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
