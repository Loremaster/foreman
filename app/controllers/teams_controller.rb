# encoding: UTF-8
class TeamsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    if params[:country_id]
      @teams = Team.where( "country_id = ?", params[:country_id] ).order(sort_column + " " + sort_direction)
    elsif params[:tag]
      @teams = Team.tagged_with( params[:tag] ).order(sort_column + " " + sort_direction)
    else
      @teams = Team.order(sort_column + " " + sort_direction)
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

  private

  def sort_column
    Team.column_names.include?(params[:sort]) ? params[:sort] : "price"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
