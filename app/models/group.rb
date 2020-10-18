class Group < ApplicationRecord
  has_many :groupedsavings
  has_many :savings, through: :groupedsavings
  belongs_to :creator, class_name: 'User'
end