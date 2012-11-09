class CreateLuvings < ActiveRecord::Migration
  def change
    create_table :luvings do |t|
      t.integer :luver_id
      t.integer :luved_id
      t.text :comment

      t.timestamps
    end
  end
end
