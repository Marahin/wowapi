class Wowapi
  module Modules
    module Guild
      def guild(realm, name, *args)
        args = args.map{|n| n.to_s if n.is_a?(Symbol) }
        get 'guild/', "#{realm}/#{name}?fields=#{args.join('%2C')}"
      end
    end
  end
end