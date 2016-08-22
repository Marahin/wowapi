class Wowapi
  class NoCredentialsException < Exception
    def initialize(msg = 'Public and/or private key was not provided.')
      super
    end
  end
end