require 'kaminari'
class GamesController < ApplicationController
  def index
    @games = Game.includes(:platform, :genres).search(params[:search]).order("name")
    @games = Kaminari.paginate_array(@games).page(params[:page]).per(20)
  end

  def show
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :id, :description, :publisher, :release_year, :employee_id, :search)
  end
end
