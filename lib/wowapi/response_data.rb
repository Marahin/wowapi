class Wowapi
  # Every ModuleClass inherits from this object,
  # so GuildClass, AchievementClass etc.
  # ResponseData class inherits from OpenStruct which makes it easy to
  # define arbitrary fields, using a Hash (so a default response object)
  # http://www.ruby-doc.org/stdlib-2.0/libdoc/ostruct/rdoc/OpenStruct.html
  class ResponseData < OpenStruct
    def initialize(data={})
      unless data.is_a?(Hash)
        raise ArgumentError, 'Data has to be passed as a Hash object.'
      end
      super
    end
  end
end
