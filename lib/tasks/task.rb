require File.expand_path("../../setup", __FILE__)

namespace :gen do
	task :setup, [ :username ] do |t, args|
		puts t
		puts args
	  # Setup.new(args)
	end
end