class <%= file_name.camelize %> < ActiveRecord::Base
	extend Enumerize

	validates :title, :description, presence: true

	serialize :page

	enumerize :position, in: [:banner, 
														:top_menu, 
														:bottom_menu, 
														:social, 
														:left, 
														:right, 
														:middle]

	def page_enum
    Rails.application.routes.routes.map(&:defaults).reject!(&:blank?).inject([]){|b, a| b << "#{a[:controller]}:#{a[:action]}" }.sort
   end
end