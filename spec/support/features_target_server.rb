require 'pathname'
require 'httparty'

PHOTOPORT_CMS_FEATURES_TARGET_ROOT = ENV['PHOTOPORT_CMS_FEATURES_TARGET_ROOT'] || 'http://localhost:3456/'

begin
  response = HTTParty.get(Pathname(PHOTOPORT_CMS_FEATURES_TARGET_ROOT).join('status').to_s)
  raise "Response: HTTP #{response.code}" unless response.success?
rescue => e
  raise "could not connect to #{PHOTOPORT_CMS_FEATURES_TARGET_ROOT}: #{e}"
end