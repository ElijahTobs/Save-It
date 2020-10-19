class Saving < ApplicationRecord
  validates :name, :amount, presence: true
  belongs_to :author, class_name: 'User'
  # belongs_to :author, foreign_key: 'user_id', class_name: 'User'
  has_many :groupedsavings
  has_many :groups, through: :groupedsavings
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
