require 'wowapi/modules/character'
require 'wowapi/modules/guild'

class Wowapi
  # Wowapi::Modules is a namespace which we keep our
  # particular methods for different parts of Blizzard's
  # World of Warcraft Community API handling
  module Modules; end
  include Wowapi::Modules::Character
  include Wowapi::Modules::Guild
end