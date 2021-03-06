class CreateGameGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :game_genres do |t|
      t.string :name
      t.references :game, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
