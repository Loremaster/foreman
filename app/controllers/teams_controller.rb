# encoding: UTF-8
class TeamsController < ApplicationController
  def index
    if params[:country_id]
      @teams = Country.where("id = ?", params[:country_id]).first.teams
    else
      @teams = Team.all
    end
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

  def edit
    @team = Team.find( params[:id] )
  end

  def update
    @team = Team.find( params[:id] )

    if @team.update_attributes( params[:team] )
      redirect_to teams_path
      flash[:info] = "Анкета бригады изменена."
    else
      render 'edit'
    end
  end

  def destroy
    team = Team.find( params[:id] )

    if team.destroy
      flash[:info] = "Анкета бригады была удалена."
    end

    redirect_to teams_path
  end
end
