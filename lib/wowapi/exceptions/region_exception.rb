class Wowapi
  class RegionException < Exception
    def initialize(msg = 'Provided unsupported region.')
      super
    end
  end
end