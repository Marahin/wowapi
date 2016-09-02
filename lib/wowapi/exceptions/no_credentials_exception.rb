class Wowapi
  class NoCredentialsException < Exception
    def initialize(msg = 'Public and/or secret key was not provided.')
      super
    end
  end
end