class Wowapi
  # Thrown when API does not return any data / something goes wrong
  class ApiException < Exception
    def initialize(msg = 'API request failed.')
      super
    end
  end
end
