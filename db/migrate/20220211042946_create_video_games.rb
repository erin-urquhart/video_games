class CreateVideoGames < ActiveRecord::Migration[7.0]
  def change
    create_table :video_games do |t|
      t.string :name
      t.integer :release_year
      t.references :employee, null: false, foreign_key: true
      t.references :platform, null: false, foreign_key: true

      t.timestamps
    end
  end
end
