require 'wp_roster'
require 'webmock/rspec'
require 'vcr'

RSpec.configure do |config|
  # some (optional) config here
end

VCR.configure do |c|
  c.default_cassette_options = {
    record: :new_episodes,
    re_record_interval: 60 * 24
  }
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end
