class ChangeVideoGameTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :video_games, :game
  end
end
