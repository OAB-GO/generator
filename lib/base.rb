require 'yaml'

module Generator
  class Base
    def self.config
      "./config/configuration.yml"
    end

    def self.templates
      %w{ migration.rb.erb }
    end
	end
end
