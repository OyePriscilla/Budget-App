class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, dependent: :delete_all
  has_many :entities, dependent: :delete_all

  validates :name, presence: true, length: { maximum: 250 }
end
