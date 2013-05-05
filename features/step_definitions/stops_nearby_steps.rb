begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end 
require 'cucumber/formatter/unicode'
$:.unshift(File.dirname(__FILE__) + '/../../lib')

require 'api'

Given(/^I am at (\d+\.\d+) latitude$/) do |lat|
  @lat = lat
end

Given(/^I am at (\-?\d+\.\d+) longitude$/) do |lon|
  @lon = lon
end

When(/^I request stops nearby$/) do
  @data = make_request("stops_nearby/#{@lat}/#{@lon}")
end

When(/^I request stops nearby within (\d+) meters$/) do |distance|
  @data = make_request("stops_nearby/#{@lat}/#{@lon}?within=#{distance}")  
end

Then(/^the stops should be:$/) do |expected|
  formatted = @data.collect() do |r|
    [r['distance'].to_s, r['stop']['number'].to_s, r['stop']['name']]
  end
  expected.diff!(formatted)
end
