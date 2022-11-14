class User < ApplicationRecord
  has_many :groups, class_name: 'Group', foreign_key: :user_id, dependent: :delete_all
  has_many :entities, class_name: 'Entity', foreign_key: :user_id, dependent: :delete_all

  validates :name, presence: true, length: { maximum: 250 }
end
