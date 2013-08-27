# encoding: UTF-8
class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new( params[:team] )

    if @team.save
      redirect_to teams_path
      flash[:success] = "Анкета новой бригады успешно сохранена!"
    else
      render 'new'
    end
  end
end
