class Wowapi
  module Modules
    # Guild module which handles all guild API actions
    # note: this _probably_ should be handled with
    # some kind of GuildClass, see:
    # https://git.3lab.re/marahin/wowapi/issues/1
    module Guild

      # GuildClass - represents the Guild resource
      class GuildClass < Wowapi::ResponseData

        # This _MIGHT_ require refactorization
        # tested with 588 members with no hickups,
        # but potentially unoptimal
        # (perhaps we should store it in memory
        # as instance variable?)
        def members
          @table[:members].map{ |player_hash|
            Wowapi::Modules::Character::CharacterClass.new(player_hash)
          } if @table[:members]
        end
      end

      # Asks Blizzard API for Guild resource
      # for list of fields visit README.md
      def guild(realm, name, *args)
        args = args.map{|n| n if n.is_a?(Symbol) }
        res = get 'guild/', "#{realm}/#{name}?fields=#{args.join(',')}"
        Wowapi::Modules::Guild::GuildClass.new(JSON.parse(res))
      end
    end
  end
end