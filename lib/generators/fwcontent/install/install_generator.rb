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
        @class_name = class_name
        copy_file "content.rb", "app/models/#{file_name}.rb"
        copy_file "_get_content_for.html.erb", "app/views/_get_content_for.html.erb"
        copy_file "content_helper.rb", "app/helpers/#{file_name}_helper.rb"
      end
    end
  end
end