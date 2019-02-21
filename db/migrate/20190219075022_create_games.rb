class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.belongs_to :user
      t.string :game_name
      t.string :description
      t.string :game_type
      t.integer :year_purchased
      t.integer :price
      t.timestamps
    end
  end
end
