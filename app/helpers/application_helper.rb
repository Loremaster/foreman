module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = ( column == sort_column && ( params[:sort] && params[:table_tags] || !params[:table_tags]  ) ? "current #{sort_direction}" : nil )
    direction = ( column == sort_column && sort_direction == "asc" ? "desc" : "asc" )
    link_to title, {:sort => column, :direction => direction, :country_id => params[:country_id], :tag => params[:tag], :table_tags => params[:table_tags]},
                   {:class => css_class}
  end
end
