class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new( params[:new] )

    if @team.save
      redirect_to teams_path
    else
      render 'new'
    end
  end
end
