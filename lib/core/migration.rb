require 'erb'
require 'fileutils'

class Migration
  include Generator::Configuration
  attr_reader :id, :name, :columns

  def initialize(name, columns)
    @name = name.downcase!
    @columns = columns
    @id = next_id
    load_setup_attr
  end

  def self.create(parameters)
    name = parameters.shift
    columns = parameters.map do |value|
      value =~ /(.*):(.*)/
      { :name => $1, :type => $2 }
    end
    self.new name, columns
  end

  def next_id
    id = (Dir.glob("#{dir}/*.yml").size + 1).to_s.rjust(3, "0")
    %Q{#{id}_create_table_#{name}}
  end

  def generate
    template_file = File.read Template.get :migration
    File.open("#{dir}/#{id}.yml", "w") do |file|
      file.puts ERB.new(template_file).result binding
    end
  end

  def to_s
    %Q{ Name: #{name}, Columns: #{columns.to_s} }
  end
end
