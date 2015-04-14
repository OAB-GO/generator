class Migration < Generator::Base

  attr_reader :name, :columns

  def initialize(name, columns)
    @name = name
    @columns = columns
  end

  def self.create(columns)
    self.new columns.shift, columns
  end
end
