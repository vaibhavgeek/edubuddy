class FeedsController < ApplicationController
client = HODClient.new(apikey, version)

	def index
		@feed = Feed.new
		@showfeeds = Feed.where(:channel_id => params[:channel_id])
	end 
	def create
		@feed = Feed.new(feeds_params)
		@feed.channel_id = params[:channel_id]
		@feed.user_id = current_user.id
		@feed.save	
		redirect_to channel_feeds_path(:channel_id => params[:channel_id])
	end
private
	def feeds_params 
	params.require(:feed).permit(:content, :image)
	end
end
