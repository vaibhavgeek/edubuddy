class FeedsController < ApplicationController
require 'rest_client'
	
	def index
		@feed = Feed.new
		@showfeeds = Feed.where(:channel_id => params[:channel_id])
		@resp = nil
	end 
	def create
		#client = HODClient.new('http://api.idolondemand.com', '2b7a646b-286e-40df-bd28-7e57f8e3739c')
		#@response = client.post('detectfaces',{'file' => Paperclip.io_adapters.for(feeds_params[:image]).read })
		#filea = Paperclip.io_adapters.for(feeds_params[:image]
		#client= HODClient.new("http://api.havenondemand.com/1/api/sync/","2b7a646b-286e-40df-bd28-7e57f8e3739c")
        #source = Net::HTTP.get_response("api.havenondemand.com","&file="+filea.to_s)
		#@response = JSON.parse(open(source).read)
		@response = RestClient.post('http://api.havenondemand.com/1/api/sync/detectfaces/v1?apikey=2b7a646b-286e-40df-bd28-7e57f8e3739c', :file => feeds_params[:image] )
		@feed = Feed.new(feeds_params)
		@feed.channel_id = params[:channel_id]
		@feed.user_id = current_user.id
		@jso = JSON.parse(@response) 
			if @jso["face"].to_s == "[]"
			@feed.save	
		    else
		    flash[:alert] = "Please submit images related to educational material"
			end
		redirect_to channel_feeds_path(:channel_id => params[:channel_id] , :help => @resp)
	end
private
	def feeds_params 
	params.require(:feed).permit(:content, :image)
	end
end
