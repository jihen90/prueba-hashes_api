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

data = request('https://jsonplaceholder.typicode.com/photos')[0..10]
#Limitamos los resultados a 10
photos = data.map{|x| x['url']}

html = "<html>
    <head>
    </head>
    <body>
        <ul>
"

html1 = "        </ul>
    </body>
</html>"


photos.each do |photo|
    html += "            <li><img src=\"#{photo}\"></li>\n"
    end

File.write('output.html', html + html1)