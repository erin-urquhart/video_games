class Game < ApplicationRecord
  belongs_to :employee
  belongs_to :platform
  has_many :game_genres
  has_many :genres, through: :game_genres

  validates :name, :release_year, presence: true
  validates :name, uniqueness: true

  def self.search(search)
    if search
      name = Game.where('name LIKE ?', "%#{search}%")
      if name
        self.where(id: name)
      else
        Game.all
      end
    else
      Game.all
    end
  end

end
