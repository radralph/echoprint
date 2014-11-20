class HomeController < ApplicationController



	require 'timeout'
	status = Timeout::timeout(10) {
	}


	def upload

	##Set Echoprint
	site = 'http://2789443a.ngrok.com/'
	api_key = 'PSDYDEXB3L5COAXNK'
	url = site+name

	##Setup File
	name = params[:file].original_filename
	directory = "public/" ; path = File.join(directory, name)
	File.open(path,"wb") { |f| f.write(params[:file].read) } 

	logger.info url
		req = HTTParty.post('http://developer.echonest.com/api/v4/track/upload',
		:body => {"url" => url,
				 "api_key" => api_key} )



	
	#render json: req.body
	render json: {'success' => true}
	#File.delete(Rails.root + 'public/'+name)
	
	#search similar by genre:
	##http://developer.echonest.com/api/v4/genre/similar?api_key=Q7FGWJCFD9UYURUXR&name=acid+jazz&bucket=description
	#suggest music
	#http://developer.echonest.com/api/v4/artist/suggest?api_key=PSDYDEXB3L5COAXNK&name=rad&results=5
	#http://developer.echonest.com/api/v4/artist/search?api_key=PSDYDEXB3L5COAXNK&format=json&name=radiohead&results=1
	#list artists' genre
	#http://developer.echonest.com/api/v4/artist/terms?api_key=PSDYDEXB3L5COAXNK&name=radiohead&format=json

	end

end
