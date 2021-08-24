class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :num_row
      t.integer :num_column
      t.integer :num_mine
      t.boolean :is_active

      t.timestamps
    end
  end
end
