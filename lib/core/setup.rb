require 'yaml'

class Setup
  include Generator::Configuration
  CONFIGURATION_FILE = "./config/configuration.yml"

  attr_reader :teste

  def initialize(parameters = {})
    @dir = parameters.dir
    @username = parameters.username
    @author = parameters.author
    # @teste = { "dir" => '1', "register" => 2 }
  end

  def save
    switch_existent_value
    File.open(CONFIGURATION_FILE, "w") do |file|
      file.puts serialize
    end
  end

  def self.load
    YAML.load File.open(CONFIGURATION_FILE, "r")
  end

  def self.exists?
    File.exist? CONFIGURATION_FILE
  end

  def self.path
    CONFIGURATION_FILE
  end

  private

  def switch_existent_value
    if Setup.exists?
      previous = Setup.load
      instance_variables.each do |var|
        current_var = instance_variable_get "#{var}"
        previous_var = previous.instance_variable_get "#{var}"
        instance_variable_set "#{var}", previous_var if current_var == nil
      end
    end
  end

  def serialize
    YAML.dump self
  end

  def to_s
    %Q{ Directory: #{dir}, Username: #{username}, Author: #{author} }
  end
end
