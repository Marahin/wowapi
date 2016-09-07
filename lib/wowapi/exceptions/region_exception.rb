class Wowapi
  # Thrown when supplied Region is unsupported
  class RegionException < Exception
    def initialize(msg = 'Provided unsupported region.')
      super
    end
  end
end