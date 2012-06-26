module Bundler
  class Dsl
    unless $gex
      alias :gex :gem
      $gex = true
    end

    def gem(nm_gem, opt_gem = {})
      shome = File.expand_path('../..', __FILE__)
      gem_info = File.join(shome, ".local", nm_gem)
      if File.exists? gem_info
        source "http://localhost:9292"
        local_opt = { :path => File.read(gem_info).strip }

        unless local_opt[:path].empty?
          gex nm_gem, local_opt
        else
          gex nm_gem, opt_gem.clone
        end
      else
        gex nm_gem, opt_gem.clone
      end
    end
  end
end
