class GamesChannel < ApplicationCable::Channel
	def subscribed
		user = User.find(params[:user_id])
		game = Game.find(params[:game_id])
		stream_from "games_channel_#{game.id}"
		
		canChoose = !game.teams.find {|team| !team.users.empty?}
		byebug
		GamesChannel.broadcast_to user, canChoose
		ActionCable.server.broadcast "games_channel_#{game.id}", canChoose
	end

	def place_user_in_team
		user = User.find params[:user_id]
		team = Team.find params[:team_id]
		team.users << user 
		if team.save 
			byebug
		end 

	end 

	def unsubscribed
		# Any cleanup needed when channel is unsubscribed
	end
end
