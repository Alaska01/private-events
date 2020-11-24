class UsersController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
    def index
        @users = User.all
    end

    def show 
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to root_url, notice: 'User successfully created.'
        else
          render :new
        end
    end

    protected
    def user_params
      params.require(:user).permit(:name)
    end


end
