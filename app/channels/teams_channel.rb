class TeamsChannel < ApplicationCable::Channel
  def subscribed
    byebug
    
    game = Game.find(params[:game_id])
    stream_for game
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
