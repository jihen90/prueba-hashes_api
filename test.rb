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

data = request('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10&api_key=pmONMroT1f8kX54M9Pc1fOMB2KxXl5BBrfecCrOH')

def buid_web_page(hash)

    array = hash.to_a

# HASTA AQUÍ TODO OK

    final_array = array[0][1][0].to_a
    
    photos = final_array[3][1].to_s

    html = "<html>
    <head>
    </head>
    <body>
        <ul>
            <li><img src=\"#{photos}\"></li>"
    html1 = "
        </ul>
    </body>
</html>"

    File.write('nasa.html', html + html1)

end

buid_web_page(data)


