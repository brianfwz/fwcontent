class Content < ActiveRecord::Base
	validates :title, :description, presence: true

	serialize :page

	def page_enum
    Rails.application.routes.routes.map(&:defaults).reject!(&:blank?).inject([]){|b, a| b << "#{a[:controller]}:#{a[:action]}" }.sort
   end
end