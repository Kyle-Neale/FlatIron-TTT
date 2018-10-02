class GamesChannel < ApplicationCable::Channel
  def subscribed
    user = User.find(params[:user_id])
    game = "games_#{params[:game_id]}"
    stream_from game

    # GamesChannel.broadcast_to user, "Sup sexy"
    ActionCable.server.broadcast game, {damn: "boi"}
  end

  # def
  #
  # end


  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
