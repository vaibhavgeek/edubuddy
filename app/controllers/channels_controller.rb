class ChannelsController < ApplicationController
	def new
		@channel = Channel.new
	end
    def create
    	@channel = Channel.new(channel_params)
    	if @channel.save
    		redirect_to root_path
    	else
    		render "new"
    	end
    end
	def index
	end
private
	def channel_params 
	params.require(:channel).permit(:name, :image , :description)
	end

end
