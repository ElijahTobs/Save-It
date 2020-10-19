class CreateGoupedsavings < ActiveRecord::Migration[5.2]
  def change
    create_table :goupedsavings do |t|
      t.integer :group_id
      t.integer :expense_id

      t.timestamps precision: 6
    end
  end
end
