class Game < ApplicationRecord
  belongs_to :employee
  belongs_to :platform
  has_many :game_genres
  has_many :genres, through: :game_genres

  validates :name, :release_year, presence: true
  validates :name, uniqueness: true
end
