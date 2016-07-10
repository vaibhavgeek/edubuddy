class HomeController < ApplicationController
  def index
  	@allstudygrps = Channel.all
  end
end
