# frozen_string_literal: true

class CreateGroupedsavings < ActiveRecord::Migration[5.2]
  def change
    create_table :groupedsavings do |t|
      t.integer :group_id
      t.integer :saving_id

      t.timestamps precision: 6
    end
  end
end
