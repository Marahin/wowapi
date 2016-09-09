class Wowapi
  # Metaprogramming!
  class << self
    # Raise exceptions on error responses from API endpoint?
    attr_accessor :fail_silently
  end

  # Defaults to false
  @fail_silently = false
end

