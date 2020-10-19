class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :creator_id
      t.string :name
      t.string :icon

      t.timestamps precision: 6
    end
  end
end
