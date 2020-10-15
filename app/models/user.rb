class User < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true

  has_many :savings, foreign_key: 'user_id', class_name: 'Saving'
end
