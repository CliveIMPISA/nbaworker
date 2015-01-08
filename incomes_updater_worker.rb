require 'json'
require 'httparty'


API_BASE_URI ="http://nbapaydynamo.herokuapp.com/"
API_VER = '/api/v1/'

def api_url(resource)
  URI.join(API_BASE_URI, API_VER, resource).to_s
end

puts "Worker started"
puts "My task_id is #{@iron_task_id}"
puts "Parameters: '#{params}'"

# saved_singles = HTTParty.get api_url("single")
# saved_singles.each do |single|
#   single_url = api_url("playertotal/#{single['id']}")
#   results = HTTParty.get single_url
#   puts "Updated: #{single['id']}"
#
# end
#
# saved_doubles = HTTParty.get api_url("double")
# saved_doubles.each do |double|
#   double_url = api_url("comparisons/#{double['id']}")
#   results = HTTParty.get double_url
#   puts "Updated: #{double['id']}"
#
# end

#Populate dataBase
saved_results = HTTParty.get api_url("result")
  if saved_results.nil? || saved_results.empty?
    populate = HTTParty.get api_url("populateresults")
    puts "DataBase Populated"
  else
    saved_results.each do |result|
      result_url = api_url("result/#{result['id']}")
      results = HTTParty.get result_url
      puts "Updated: #{result['id']}"
    end
  end
