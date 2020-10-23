class User < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :name, format: { with: /[a-zA-Z0-9]/ }

  has_many :savings, foreign_key: 'author_id', class_name: 'Saving'
  has_many :groups, foreign_key: 'creator_id', class_name: 'Group'
end
