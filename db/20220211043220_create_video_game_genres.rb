class CreateVideoGameGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :video_game_genres do |t|
      t.string :name
      t.references :videogame, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
