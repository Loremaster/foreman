module TeamsHelper
  def table_tags(tag)
    if !params[:table_tags]                                                                         # if there is no array of tags.
      link_to "#{tag} ", :table_tags => [tag]
    else
      tt = params[:table_tags].clone                                                                # Make clone (to avoid strange adding of another tags).
      tt.push( tag ) unless tt.include? tag                                                         # Push only new tags.
      link_to "#{tag} ", :table_tags => tt                                                          # Link to path with new array.
    end
  end
end
