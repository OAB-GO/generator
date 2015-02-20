require 'erb'
require 'ostruct'

class Parser < OpenStruct
  def render()
    ERB.new(File.read("#{File.expand_path("../../templates", __FILE__)}/migration.rb.erb")).result(binding)
  end
end