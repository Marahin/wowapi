class Wowapi
  module Modules
    module Guild
      # this should probably include
      # a GuildClass definition which would properly
      # handle blizzard apis' response.
      # for now it returns just a simple JSON
      # (also, written while drunk. sorry. )
      def guild(realm, name, *args)
        args = args.map{|n| n.to_s if n.is_a?(Symbol) }
        res = get 'guild/', "#{realm}/#{name}?fields=#{args.join('%2C')}"
        JSON.parse(res)
      end
    end
  end
end