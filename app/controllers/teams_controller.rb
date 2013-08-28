# encoding: UTF-8
class TeamsController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_filter :set_gon_tags, :except => [:index, :destroy]

  def index
    case
      # Table tags and their variants.
      when params[:table_tags] && params[:country_id]
        @teams = Team.tagged_with( params[:table_tags] ).where( "country_id = ?", params[:country_id] ).order(sort_column + " " + sort_direction)
      when params[:table_tags] && params[:sort]
        @teams = Team.tagged_with( params[:table_tags] ).order(sort_column + " " + sort_direction)
      when params[:table_tags]
        @teams = Team.tagged_with( params[:table_tags] )
        @teams = sorted_table_tags( @teams, params[:table_tags] )

      # Other variants.
      when params[:country_id] && params[:tag]
        @teams = Team.tagged_with( params[:tag] ).where( "country_id = ?", params[:country_id] ).order(sort_column + " " + sort_direction)    # Team, who has the tag AND the country.
      when params[:country_id] && !params[:tag]
        @teams = Team.where( "country_id = ?", params[:country_id] ).order(sort_column + " " + sort_direction)
      when params[:tag] && !params[:country_id]
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

  # Sorting teams via tags (who has less tags will be on top of table).
  def sorted_table_tags(team, table_tags)
    sorted = team.collect{ |t| [t, t.tag_list.size - table_tags.size]  }.sort_by { |obj, tags_count| tags_count } # Create array [[Obj, tags_diff], ..]. Idea is that array with tags_diff == 0 should be on the top (because they are most closest to seeking tags).
    sorted.collect{ |e| e[0] }                                                                      # Extract objects in array.
  end

  def set_gon_tags
    gon.tags = ActsAsTaggableOn::Tag.all.map( &:name )
  end
end
