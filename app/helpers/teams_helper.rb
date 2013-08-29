# encoding: UTF-8
module TeamsHelper
  # Adding new tags in array in params after clicking on chosen tag.
  def table_tags(tag)
    if !params[:table_tags]                                                                         # if there is no array of tags.
      link_to "#{tag} ", :table_tags => [tag]
    else
      tt = params[:table_tags].clone                                                                # Make clone (to avoid strange adding of another tags).
      tt.push( tag ) unless tt.include? tag                                                         # Push only new tags.
      link_to "#{tag} ", :table_tags => tt                                                          # Link to path with new array.
    end
  end

  def link_to_all_teams(*args)
    default_val = nil

    args.compact.each do |val|
      if params.has_key? val
        return link_to "← К полному спиcку", teams_path, :class => "all-teams-link"
      end
    end

    default_val
  end
end
