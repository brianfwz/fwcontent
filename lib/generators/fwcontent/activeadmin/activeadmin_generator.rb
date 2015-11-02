require 'rails/generators/migration'

module Fwcontent
  module Generators
    class ActiveadminGenerator < ::Rails::Generators::NamedBase
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      

      def copy_initializer_file
        if active.include? "activeadmin"
          template "activeadmin/content.rb", "app/admin/#{file_name}.rb"
          template "activeadmin/position.rb", "app/admin/position.rb"
        end
      end
    end
  end
end