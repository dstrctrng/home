class Hash
  alias old_keys keys

  def keys
    pinned = %w(run_list cap_group pods)

    old_keys.sort {|a,b|
      ia = pinned.index a
      ib = pinned.index b

      if ia
        ib ? ia <=> ib : -1
      else
        ib ? 1         : a.to_s <=> b.to_s
      end
    }
  end

  def each
    keys.each do |k|
      yield k, self[k]
    end
  end
end

require 'yaml'

puts YAML.load(File.read(ARGV[0])).to_hash.to_yaml
