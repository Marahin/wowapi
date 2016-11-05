class Wowapi
  class << self
    # Wowapi.region class variable that holds
    # customer region (:eu, :us, ...)
    # DEFAULTS TO :eu
    attr_accessor :region
    Wowapi.region ||= :eu
  end

  def region=(region)
    Wowapi.region = region if region.is_a?(Symbol)
  end

  def region
    Wowapi.region
  end
end
