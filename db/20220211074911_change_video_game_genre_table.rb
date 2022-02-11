class ChangeVideoGameGenreTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :video_game_genres, :game_genre
  end
end
