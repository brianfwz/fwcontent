module <%= class_name %>Helper
  def get_content_for
    <%= class_name %>.where("page like ?", "%#{params[:controller]}:#{params[:action]}\n%")
  end
end
