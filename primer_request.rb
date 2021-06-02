require "uri"
require "net/http"
require "json"

def request(adress)
    url = URI(adress)
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    JSON.parse response.read_body
end

body = request('https://jsonplaceholder.typicode.com/posts')

body.each do |post|
    puts post['title']
end