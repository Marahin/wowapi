require 'open-uri'
require 'json'
require 'wowapi/core_extensions/object/try'
require 'wowapi/fail_silently'
require 'wowapi/exceptions'
require 'wowapi/version'
require 'wowapi/response_data'
require 'wowapi/modules'

class Wowapi
  # Instance variables we keep our region, public_key and secret_key in
  attr_accessor :region, :public_key, :secret_key

  # Wowapi::Modules is a namespace which we keep our
  # particular methods for different parts of Blizzard's
  # World of Warcraft Community API handling
  module Modules; end
  include Wowapi::Modules::Guild

  # Creating an instance of Wowapi class
  def initialize
    self.region ||= :eu
    yield self if block_given?
  end

  # Method to handle all requests, properly
  # interpreting HTTP answer & returning it's response
  def get(path, params = {})
    res = make_request(path, params)
    if !(res.status.include?('200') or res.status.include?(200)) && ! Wowapi.fail_silently
      raise Wowapi::ApiException.new, "Did not receive status 200, but #{res.try(:status).try(:first)} (#{res.class})."
    end
    res.read
  end

  private

  # Making open-uri request, catching exceptions
  # and returning data back to #get method
  def make_request(path, params)
    begin
      raise Wowapi::NoCredentialsException unless public_key
      req_uri = URI.encode("https://#{base_url}#{path}#{params}&apikey=#{self.public_key}")
      open(req_uri)
    rescue OpenURI::HTTPError => e
      raise Wowapi::ApiException.new, "Could not make a request:\n#{e.inspect}" unless Wowapi.fail_silently
    end
  end

  # Returns URL for particular region
  # or throws an exception if region is nonexistent
  def base_url
    case self.region
    when :eu
      'eu.api.battle.net/wow/'
    when :us
      'us.api.battle.net/wow/'
    else
      raise Wowapi::RegionException
    end
  end
end
