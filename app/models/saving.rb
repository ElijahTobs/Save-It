class Saving < ApplicationRecord
  belongs_to :users, foreign_key: 'user_id', class_name: 'User'
end
