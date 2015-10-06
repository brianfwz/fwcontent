module <%= file_name.camelize %>Helper
  def get_content_for
    <%= file_name.camelize %>.where("page like ?", "%#{params[:controller]}:#{params[:action]}\n%")
  end
end
