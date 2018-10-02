class TeamsController < ApplicationController

  def index
    teams = Team.all
    render json: teams
  end

  def show
    team = Team.find(params[:id])

    render json: team
  end

  def create
    team = Team.new
    if team.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        TeamSerializer.new(team)
      ).serializable_hash

      ActionCable.server.broadcast_to 'games_channel', serialized_data
    end
  end

end
