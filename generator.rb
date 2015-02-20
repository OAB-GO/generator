require 'optparse'
require 'erb'
require 'yaml'
require 'ostruct'

templates = File.expand_path("../templates", __FILE__)
file_name = Time.now.to_i
#file = YAML.load_file("#{root}/config/directory.yml")
#file.inspect

# ARGV.each do|param|
#   if (param == 'migration')
#   	File.open("#{root}/migration.rb", "w")
#   end
# end

# options = {}
# OptionParser.new do |opts|
#   opts.banner = "Usage: example.rb [options]"

#   opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
#     options[:verbose] = v
#   end
# end.parse!

# p options
# p ARGV

# a = ERB.new(File.read("#{templates}/migration.rb.erb"))



# puts YAML.load a.result()

class Params < OpenStruct
  def render()
    ERB.new(File.read("#{File.expand_path("../templates", __FILE__)}/migration.rb.erb")).result(binding)
  end
end

et = Params.new({ :username => 'oab2_user', :author => 'Wender Freese' })
puts et.render()