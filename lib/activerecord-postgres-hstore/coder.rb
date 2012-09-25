module ActiveRecord
  module Coders
    class Hstore
      def self.load(hstore)
        new.load(hstore)
      end

      def self.dump(hstore)
        new.dump(hstore)
      end

      def initialize(default=nil)
        @default=default
      end

      def dump(obj)
        obj.nil? ? (@default.nil? ? nil : @default.to_hstore) : obj.to_hstore
      end

      def load(hstore)
        hstore.nil? ? nil : Hash[hstore.from_hstore.map{ |k, v| [k.to_sym, v] }]
      end
    end
  end
end
