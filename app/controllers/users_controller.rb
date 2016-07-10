class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@showfeeds = Feed.where(:user_id => @user.id).order("created_at DESC")
  end
  def edit
  	@user = current_user
  end
  def update
  	@user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
  private
  def user_params
  		params.require(:user).permit(:first_name, :last_name, :image , :description)

  end
end
