class HomeController < ApplicationController



	require 'timeout'
	status = Timeout::timeout(10) {
	}


	def upload
	##Setup File
	name = params[:file].original_filename
	directory = "public/" ; path = File.join(directory, name)
	File.open(path,"wb") { |f| f.write(params[:file].read) } 

	##Set Echoprint
	site = 'http://2789443a.ngrok.com/'
	api_key = 'PSDYDEXB3L5COAXNK'
	url = site+name
	req = HTTParty.post('http://developer.echonest.com/api/v4/track/upload',
		:body => {"url" => url,
				 "api_key" => api_key} )
	render json: req.body
	#render json: {'success' => true}
	#File.delete(Rails.root + 'public/'+name)
	logger.info url
	#search similar by genre:
	##http://developer.echonest.com/api/v4/genre/similar?api_key=Q7FGWJCFD9UYURUXR&name=acid+jazz&bucket=description
	#suggest music
	#http://developer.echonest.com/api/v4/artist/suggest?api_key=PSDYDEXB3L5COAXNK&name=rad&results=5


	end

end
