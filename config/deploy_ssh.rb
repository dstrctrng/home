if ENV['_AO_ENV'] == 'development'
  module ::Net
    module SSH
      class Config
        def self.default_files
          ENV['_AO_SSH'].split(/\W+/)
        end
      end
    end
  end
end
