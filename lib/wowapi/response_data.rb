require 'json'

class Wowapi
  # Every ModuleClass inherits from this object,
  # so GuildClass, AchievementClass etc.
  # ResponseData class inherits from OpenStruct which makes it easy to
  # define arbitrary fields, using a Hash (so a default response object)
  # http://www.ruby-doc.org/stdlib-2.0/libdoc/ostruct/rdoc/OpenStruct.html
  class ResponseData < OpenStruct
    # Raw holds the response Hash, untouched
    attr_accessor :raw

    def initialize(data={})
      unless data.is_a?(Hash)
        raise ArgumentError, 'Data has to be passed as a Hash object.'
      end
      @raw = data # Assign raw data to @raw instance variable
      super
    end

    # Return raw data (retrieved by Blizzard servers)
    def to_json
      @raw.to_json
    end

    # Create a object of suitable class e.g.:
    # guild = api.guild ...
    # guild = guild.from_json(data)
    def from_json(data)
      self.class.new(JSON.parse(data))
    end
  end
end
