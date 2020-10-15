class CreateSavings < ActiveRecord::Migration[5.2]
  def change
    create_table :savings do |t|

      t.integer :user_id
      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end
