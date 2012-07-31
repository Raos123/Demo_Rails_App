class MicropostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  load_and_authorize_resource through: :current_user, only: :destroy

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost destroyed"
    redirect_back_or root_path
  end

end