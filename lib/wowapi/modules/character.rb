class Wowapi
  module Modules
    # Character module containing methods for character data retrieval & definition of
    # CharacterClass
    module Character
      # todo: issue-13
      class CharacterClass < Wowapi::ResponseData
        def initialize(res)
          super

          # Likely requires refactoring. This reassigns unsufficient thumbnail address
          # returned by World of Warcraft API and sets it to proper thumbnail URL
          # that you can use to download / display image from Blizzards' servers
          if @table
            if @table.key?(:character) && @table[:character].key?('thumbnail')
              @table[:character]['thumbnail'] = "http://render-api-#{Wowapi.region}.worldofwarcraft.com/static-render/#{Wowapi.region}/#{@table[:character]['thumbnail']}"
            elsif @table.key?(:thumbnail)
              @table[:thumbnail] = "http://render-api-#{Wowapi.region}.worldofwarcraft.com/static-render/#{Wowapi.region}/#{@table[:thumbnail]}"
            end
          end
        end

        ## Character avatar image
        def avatar
          @table[:character]['thumbnail']
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