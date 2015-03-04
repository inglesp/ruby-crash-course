# examples/in_the_news.rb
require "httparty"

query = ARGV[0]

response = HTTParty.get("http://www.bbc.co.uk")

if response.body.include?(query)
  puts "There is a story about #{query} on the BBC homepage today"
else
  puts "There is no story about #{query} on the BBC homepage today"
end

