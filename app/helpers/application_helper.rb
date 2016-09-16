module ApplicationHelper
     def setnotificasion(mensaje,id,tile,iddevices)

         require 'uri'
         require 'net/http'
         url = URI("https://fcm.googleapis.com/fcm/send")
         http = Net::HTTP.new(url.host, url.port)
         http.use_ssl = true
         http.verify_mode = OpenSSL::SSL::VERIFY_NONE
         @request = Net::HTTP::Post.new(url)
         @request["authorization"] = 'key=AIzaSyANUQUCECwwwPY2WDv9qw3Bw9VA84a9Sac'
         @request["content-type"] = 'application/json'
         @request.body = "{ \"data\": 
                  {\"title\":\""+tile.to_s+"\",
                    \"message\":\""+mensaje.to_s+"\",
                    \"type\":\"2\",
                   \"idcampaigns\": \""+ id.to_s+"\"},
                   \"to\" : \""+ iddevices.to_s+"\"}"
         @response = http.request(@request)
         @response.read_body   	

     end 

end
