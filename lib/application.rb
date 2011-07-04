

class Application
attr_accessor :ip

def initialize(ip)
 @ip = ip
 @url = "http://www.geody.com/"
end

def request
   uri = URI.parse( "http://www.geody.com/geoip.php" ); params = {'ip'=> @ip}

   http = Net::HTTP.new(uri.host, uri.port) 
   request = Net::HTTP::Get.new(uri.path) 
   request.set_form_data( params )

   # instantiate a new Request object
   request = Net::HTTP::Get.new( uri.path+ '?' + request.body ) 
   
   response = http.request(request)
   #puts response.body
   
   if response.code == "200"
    	location = response.body[%r{Location: (.*)"}i, 1]
   end

   puts Sanitize.clean(location)
  # puts /(.*?)<\/a>/.match(location);
   #@url = URI.parse(@url)
   #url = URI::HTTP.build({:host => @url.host, :port => @url.port, :path => @url.path + 'geoip.php?ip=#{@ip}'}) 
   #response = Net::HTTP.get_response(url)
   
   #puts response.body

   #puts @ip
end

end

#def request

#@url = "http://www.geody.com/"
 #url = URI::HTTP.build({:host => @url.host, :port => @url.port, :path => @url.path + 'geoip.php?ip='}) 
 #response = Net::HTTP.get_response(url)

 #return response.body

#end
