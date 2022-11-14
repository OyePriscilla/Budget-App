class Group < ApplicationRecord
  belongs_to :user
  has_many :groups

  validates :name, :icon, presence: true
end
