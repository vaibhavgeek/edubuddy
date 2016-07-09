class FeedsController < ApplicationController
	def index
		@feed = Feed.new 
		@showfeeds = Feed.where(:channel_id => params[:channel_id])
	end 
	def create
		@feed = Feed.new(feeds_params)
		@feed.channel_id = params[:channel_id]
		@feed.save	
	end
private
	def feeds_params 
	params.require(:feed).permit(:name, :content)
	end
end
