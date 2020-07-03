class UsersController < ApplicationController
    # before_action :set_user, only: %i[show update destroy]
  
    def index
      @users = User.all
      render json: @users
    end
  
    def show
      @user = User.find(params[:id])
      render json: @user
        end
  
    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user
      else
        render json: { error: 'Error creating an account ' }
      end
    end
  
    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
        end
    end
  
    def destroy
      @user.destroy
    end
  
    def find
      @user = User.find_by(email: params[:user][:email])
      if @user
        render json: @user
      else
        @errors = @user.errors.full_messages
        render json: @errors
      end
     end

    private
  
    # def set_user
    #   @user = User.find(params[:id])
    #   end
  
    def user_params
      params.require(:user).permit(:username, :email, :password_digest)
    end
  end
  