require 'vcr'
require 'net/http'
require 'webmock'

VCR.configure do |c|
  c.cassette_library_dir = 'cassettes'
  c.default_cassette_options = { :serialize_with => :json }
  c.hook_into :webmock
end

VCR.use_cassette('example') do
  puts Net::HTTP.get(URI("http://google.com/index.html"))
end