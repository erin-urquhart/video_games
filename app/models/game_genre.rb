class GameGenre < ApplicationRecord
  belongs_to :game
  belongs_to :genre

  validates :game_id, :genre_id, presence: true
end
