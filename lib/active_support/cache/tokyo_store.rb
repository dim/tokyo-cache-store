gem 'actsasflinn-ruby-tokyotyrant', '>= 0.2.0'
require 'tokyo_tyrant'

module ActiveSupport
  module Cache
    class TokyoStore < Store
    
      def initialize(host = 'localhost', port = 1978)
        super()
        @data = ::TokyoTyrant::DB.new(host, port)
      end
      
      def read(key, options = nil)
        super
        @data[key]
      rescue TokyoTyrantError 
        nil
      end
  
      def write(key, value, options = nil)
        super
        @data[key] = value
      rescue TokyoTyrantError 
        nil
      end
  
      def delete(key, options = nil)
        super
        @data.delete(key)
      end
  
      def delete_matched(matcher, options = nil)
        super
        @data.each_key { |k| @data.delete(k) if k =~ matcher }
      end
  
      def exist?(key, options = nil)
        super
        @data.key?(key)
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