require 'kaminari'
class GamesController < ApplicationController
  def index
    @games = Game.includes(:platform, :employee).search(params[:search]).order("name")
    @games = Kaminari.paginate_array(@games).page(params[:page]).per(10)
  end

  def show
    @game = Game.includes(:genres).find(params[:id])
    @gamegenres = Genre.select('games.id, genres.id, genres.name').joins(:games).where('game_id = ?', "#{@game.id}")
  end

  def game_params
    params.require(:game).permit(:name, :id, :description, :publisher, :release_year, :employee_id, :search)
  end
end
