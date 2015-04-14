class Setup < Generator::Base
  attr_accessor :dir, :username, :author

  def initialize(parameters = {})
    @dir = parameters.dir
    @username = parameters.username
    @author = parameters.author
  end

  def save
    switch_existent_value
    File.open(Setup.config, "w") do |file|
      file.puts serialize(file)
    end
  end

  def self.load
    YAML.load File.open(Setup.config, "r")
  end

  def self.exists?
    File.exist? Setup.config
  end

  private

  def switch_existent_value
    if Setup.exists?
      previous = Setup.load
      self.dir ||= previous.dir
      self.username ||= previous.username
      self.author ||= previous.author
    end
  end

  def serialize(file)
    YAML.dump self
  end

  def to_s
    %Q{ Directory: #{dir}, Username: #{username}, Author: #{author} }
  end
end
