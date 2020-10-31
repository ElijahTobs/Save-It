class Group < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :name, format: { with: /[a-zA-Z0-9]/ }

  has_many :groupedsavings
  has_many :savings, through: :groupedsavings
  belongs_to :creator, class_name: 'User'
  scope :ordered_by_name, -> { order(:name) }
end
