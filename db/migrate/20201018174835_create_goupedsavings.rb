class CreateGoupedsavings < ActiveRecord::Migration[5.2]
  def change
    create_table :goupedsavings do |t|

      t.timestamps
    end
  end
end
