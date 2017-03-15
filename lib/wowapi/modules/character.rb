class Wowapi
  module Modules
    # Character module containing methods for character data retrieval & definition of
    # CharacterClass
    module Character
      # todo: issue-13
      class CharacterClass < Wowapi::ResponseData
        ## Character avatar image. Pass .avatar(https: true) for HTTPS link.
        def avatar(opts = {})
          _url = @table[:character]['thumbnail'] || @table[:thumbnail]
          _url ? ("http#{'s' if opts[:https]}://render-api-#{Wowapi.region}.worldofwarcraft.com/static-render/#{Wowapi.region}/#{_url}") : (nil)
        end
      end

      # Retrieve data about particular Character. For a list of fields visit README.md
      def character(realm, name, *args)
        args = args.map{|n| n if n.is_a?(Symbol) }
        res = get 'character/', "#{realm}/#{name}?fields=#{args.join(',')}"
        Wowapi::Modules::Character::CharacterClass.new(JSON.parse(res))
      end
    end
  end
end
