require 'erb'
require 'ostruct'

class Parser < OpenStruct
  def render(template)
    ERB.new(File.read("#{File.expand_path("../../templates", __FILE__)}/#{template}")).result(binding)
  end

end