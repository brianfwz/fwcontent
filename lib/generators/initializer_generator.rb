class InitializerGenerator < Rails::Generators::Base
  def create_initializer_file
    create_file "app/models/content.rb", <<-FILE
class Content < ActiveRecord::Base
	validates :title, :description, presence: true

	serialize :page

	def page_enum
    Rails.application.routes.routes.map(&:defaults).reject!(&:blank?).inject([]){|b, a| b << "#{a[:controller]}:#{a[:action]}" }.sort
   end
end
    FILE
  end
end