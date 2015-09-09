module ContentHelper
  def get_content_for
    Content.where("page like ?", "%#{params[:controller]}:#{params[:action]}\n%")
  end
end
