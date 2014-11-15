class HomeController < ApplicationController

	def index

	file = params[:file]
	api_key = 'Q7FGWJCFD9UYURUXR'
	url = 'http://41cc9a70.ngrok.com/guessthissong.mp3'
	req = HTTParty.post('http://developer.echonest.com/api/v4/track/upload',
		:body => {"url" => url,
				 "api_key" => api_key} )
	#render json: req.body
	#render json: {'success' => true}

	##TODO:
	##file upload
	##after analyzing, delete file in directory

	end

end
