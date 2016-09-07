class Wowapi
  # Currently unused; deprecated?
  class AuthException < Exception
    def initialize(msg = 'Could not authenticate.')
      super
    end
  end
end