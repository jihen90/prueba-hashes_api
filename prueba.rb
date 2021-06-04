require "uri"
require "net/http"
require "json"

def request(adress, apikey)
    url = URI(adress + apikey)
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    JSON.parse response.read_body
end

data = request('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10', '&api_key=pmONMroT1f8kX54M9Pc1fOMB2KxXl5BBrfecCrOH')

def buid_web_page(hash)

    hashes = {}
    hash.each_value do |v|
        hashes = v
    end

    hashes.map! do |i|
        i.to_a
    end

    hashes.map! do |x|
        x = x[3].to_a
    end

    hashes.map! do |z|
        z = z[1].to_s
    end


    html = "<html>
    <head>
    </head>
    <body>
        <ul>
"

    html1 = "        </ul>
    </body>
</html>"


    hashes.each do |photo|
        html += "            <li><img src=\"#{photo}\"></li>\n"
        end

    File.write('nasa_photos.html', html + html1)

end

buid_web_page(data)