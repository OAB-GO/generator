class Template
    def self.located_at
      "./templates/"
    end

    def self.availables
      { :migration => "migration.rb.erb" }
    end

    def self.get(template)
      raise "Template #{template} not found" if availables[template] == nil
      %Q{#{located_at}#{availables[template]}}
    end
end
