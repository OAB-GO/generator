module Generator
  module Configuration
    def self.included(base)
      base.class_eval do
        attr_accessor :dir, :username, :author
      end

      def load_setup_attr
        previous = Setup.load
        @dir = previous.dir
        @username = previous.username
        @author = previous.author
      end
    end
  end
end
