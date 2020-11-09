class Saving < ApplicationRecord
  validates :name, :amount, presence: true
  validates :name, format: { with: /[a-zA-Z0-9]/ }
  validates :amount, numericality: true

  belongs_to :author, class_name: 'User'
  has_many :groupedsavings, dependent: :destroy
  has_many :groups, through: :groupedsavings
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  scope :stand_alone_savings, -> { where('savings.id NOT IN (?)', Groupedsaving.distinct.pluck(:saving_id)) }
  scope :total_amount, -> { sum(:amount) }
  scope :for_the_month, -> { where('extract(year from savings.created_at) = ? and extract(month from savings.created_at)= ?', Date.today.year, Date.today.month) }
end
