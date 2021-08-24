class CreatePositions < ActiveRecord::Migration[6.1]
  def change
    create_table :positions do |t|
      t.integer :x
      t.integer :y
      t.boolean :has_mine
      t.integer :state
      t.integer :value
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
