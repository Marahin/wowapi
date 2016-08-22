class Wowapi
  class ApiException < Exception
    def initialize(msg = 'API request failed.')
      super
    end
  end
end
