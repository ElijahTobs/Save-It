class CreateSavings < ActiveRecord::Migration[5.2]
  def change
    create_table :savings do |t|
      t.integer :author_id
      t.string :name
      t.float :amount

      t.timestamps precision: 6
    end
  end
end
