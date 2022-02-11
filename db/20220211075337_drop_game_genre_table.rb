class DropGameGenreTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :game_genre
  end
end
