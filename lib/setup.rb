require 'yaml'

class Setup

	@@file = File.expand_path("../../config/configuration.yml", __FILE__)

	def initialize(options = {})
		OptionParser.new do |opts|
		  opts.banner = "Usage: generator.rb [options]"

		  opts.on("-d", "--dir {dir}", "Set the path where files will be generated") do |value|
		    options[:dir] = value
		  end

		  opts.on("-u", "--username {username}", "Set a static username") do |value|
		    options[:username] = value
		  end

		  opts.on("-a", "--author {author}", "Set a static author") do |value|
		    options[:author] = value
		  end

		  opts.on("-h", "--help", "Show valid arguments") do
		    puts opts
		    exit
		  end
		end.parse!

		parse(options)
	end

	def parse(attributes)
		@config_file = YAML.load_file(@@file)
		@config_file['config'] = @config_file['config'].merge(attributes.inject({}) { |hash, (k, v)|
			hash[k.to_s] = v
			hash	
		})
		
		File.open(@@file, 'w') do |o|
			o.write @config_file.to_yaml
		end
	end
end