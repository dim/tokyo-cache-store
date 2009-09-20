begin
  gem 'actsasflinn-ruby-tokyotyrant', '>= 0.2.0'
  require 'tokyo_tyrant'
rescue LoadError
  begin
    require 'rufus/tokyo/tyrant'
  rescue LoadError
    warn "\n  WARNING: Unable to find required tokyo tyrant libraries."
    warn "  Please install the rufus-tokyo GEM - sudo gem install rufus-tokyo\n"
    raise
  end
end

module ActiveSupport
  module Cache
    class TokyoStore < Store
    
      def initialize(host = '127.0.0.1', port = 1978)
        super()
        @data = if Object.const_defined?(:TokyoTyrant)
          TokyoTyrant::DB.new(host, port)
        else        
          Rufus::Tokyo::Tyrant.new(host, port)
        end
      end
      
      def read(key, options = nil)
        super
        @data[key]
      rescue 
        nil
      end
  
      def write(key, value, options = nil)
        super
        @data[key] = value
      rescue 
        nil
      end
  
      def delete(key, options = nil)
        super
        @data.delete(key)
      end
  
      def delete_matched(matcher, options = nil)
        super
        @data.keys.each { |k| @data.delete(k) if k =~ matcher }
      end
  
      def exist?(key, options = nil)
        super
        not @data[key].nil?
      end
      
      def clear
        log("clear", @data.keys.size, nil)
        @data.clear
      end

      def keys
        @data.keys
      end
      
    end    
  end
end