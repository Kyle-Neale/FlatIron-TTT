class GamesController < ApplicationController

  def index
    games = Games.all
    render json: games
  end

  def show
    game = Game.find(params[:id])

    render json: game
  end

  def create
    game = Game.new
    if game.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        GameSerializer.new(game)
      ).serializable_hash

      ActionCable.server.broadcast 'games_channel', serialized_data
    end
  end

end
