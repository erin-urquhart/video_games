class GamesController < ApplicationController
  def index
    @games = Game.includes(:platform).all.order("name")
  end

  def show
    @game = Game.find(params[:id])
  end
end
