require 'json'
require 'httparty'

API_BASE_URI ="http://nbapaydynamo.herokuapp.com/"
API_VER = '/api/v1/'

def api_url(resource)
  URI.join(API_BASE_URI, API_VER, resource).to_s
end

puts "Worker started"
puts "My task_id is #{{@iron_task_id}}"
puts "Paramters: '#{params}'"

saved_incomes = HTTParty.get api_url("incomes")
saved_incomes.each do |income|
  incomes_url = api_url("incomes/#{income['id']}")
  results =HTTParty.get incomes_url
  puts "Updated: #{income['id']}"
end
