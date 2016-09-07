class Wowapi
  module Modules
    # Guild module which handles all guild API actions
    # note: this _probably_ should be handled with
    # some kind of GuildClass, see:
    # https://git.3lab.re/marahin/wowapi/issues/1
    module Guild
      # Asks Blizzard API for Guild resource
      # with (any) given fields
      # Example:
      # ```
      # api.guild 'Argent Dawn', 'The Aspects', :members, :news, ...
      # ```
      # Currently returns Hash
      def guild(realm, name, *args)
        args = args.map{|n| n.to_s if n.is_a?(Symbol) }
        res = get 'guild/', "#{realm}/#{name}?fields=#{args.join('%2C')}"
        JSON.parse(res)
      end
    end
  end
end