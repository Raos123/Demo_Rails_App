class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_filter :store_location, only: [:show, :following, :followers, :index]
  load_and_authorize_resource only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @users = User.paginate(page: params[:page])
    respond_with @users
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    respond_with @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
    end
    respond_with @user
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
    end
    respond_with @user
  end

  def destroy
    @user.destroy
    flash[:success] = "User destroyed"
    redirect_back_or users_path
  end

  def following
    @title = "Following"
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
end