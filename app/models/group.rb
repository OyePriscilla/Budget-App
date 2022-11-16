class Group < ApplicationRecord
  belongs_to :user
  has_many :entities

  has_one_attached :icon

  validates :name, :icon, presence: true

  def total_amount
    total = 0
    entities.each do |ent|
        total += ent.amount
    end
    total
  end
end
