require 'optparse'
require 'yaml'

require './lib/parser'

# templates = File.expand_path("../templates", __FILE__)
# file_name = Time.now.to_i

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
end.parse!


parser = Parser.new({ :username => 'oab2_user', :author => 'Wender Freese' })
puts parser.render('migration.rb.erb')