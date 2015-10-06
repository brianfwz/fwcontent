require 'rails/generators/migration'

module Fwcontent
  module Generators
    class InstallGenerator < ::Rails::Generators::NamedBase
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      desc "add the migrations"

      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      def copy_migrations
        migration_template "create_contents.rb", "db/migrate/create_#{file_name}s.rb"
      end

      def copy_initializer_file
        # copy_file "content.rb", "app/models/#{file_name}.rb"
        copy_file "_get_content_for.html.erb", "app/views/_get_content_for.html.erb"
        # copy_file "content_helper.rb", "app/helpers/#{file_name}_helper.rb"
      end

      def create_helper_file
        create_file "app/helpers/#{file_name}_helper.rb", <<-FILE
module #{class_name}Helper
  def get_content_for
    #{class_name}.where("page like ?", "%#{params[:controller]}:#{params[:action]}\n%")
  end
end
        FILE
      end

      def create_model_file
        create_file "app/models/#{file_name}.rb", <<-FILE
class #{class_name} < ActiveRecord::Base
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
        FILE
      end
    end
  end
end