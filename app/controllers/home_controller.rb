class HomeController < ApplicationController

	def index

	api_key = 'Q7FGWJCFD9UYURUXR'
	url = 'http://41cc9a70.ngrok.com/guessthissong.mp3'
	req = HTTParty.post('http://developer.echonest.com/api/v4/track/upload',
		:body => {"url" => url,
				 "api_key" => api_key} )
	#render json: req.body
	#render json: {'success' => true}

	end

end
