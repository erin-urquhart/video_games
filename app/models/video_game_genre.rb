class VideoGameGenre < ApplicationRecord
  belongs_to :videogame
  belongs_to :genre
end
