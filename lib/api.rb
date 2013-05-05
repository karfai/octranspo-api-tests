require 'faraday'
require 'json'

def make_request(path)
  conn = Faraday.new('http://localhost:4567')
  resp = conn.get(path)
  return JSON.parse(resp.body)
end
