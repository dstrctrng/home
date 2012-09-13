unless ENV['_AO_THIS_POD'].nil? || ENV['_AO_THIS_POD'].empty?
  module ::Net
    module SSH
      class Config
        def self.default_files
          [ ENV['_AO_SSH'] ]
        end
      end
    end
  end
end
