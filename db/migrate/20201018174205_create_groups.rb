class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :creator_id
      t.string :name
      t.string :icon

      t.timestamps
    end
  end
end
