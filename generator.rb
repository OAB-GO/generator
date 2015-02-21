#!/usr/bin ruby

require 'optparse'
require 'yaml'
require File.expand_path("../lib/setup", __FILE__)
# require File.expand_path("../lib/parser", __FILE__)

if(ARGV[0] == "setup")
	@s = Setup.new()
end

# options = {}
# OptionParser.new do |opts|
#   opts.banner = "Usage: generator.rb [options]"

#   opts.on("-d {path}", "--dir {path}", "Set the path where files will be generated") do |v|
#     options[:dir] = ARGV
#   end

#   opts.on("-u {username}", "--username {username}", "Set a static username") do |v|
#     options[:username] = ARGV
#   end

#   opts.on("-a", "--author {author}", "Set a static author") do |v|
#     options[:author] = v
#   end

#   opts.on("-h", "--help", "Show valid arguments") do
#     puts opts
#     exit
#   end
# end.parse!

# puts options
# puts ARGV

# parser = Parser.new({ :username => 'oab2_user', :author => 'Wender Freese' })
# puts parser.render('migration.rb.erb')