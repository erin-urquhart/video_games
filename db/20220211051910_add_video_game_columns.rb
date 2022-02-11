class AddVideoGameColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :video_games, :description, :string
    add_column :video_games, :publisher, :string
  end
end
