class UsersController < ApplicationController

    def index
        @users = User.all

        # controller actions must render OR redirect
        render json: @users, status: 200
    end

    def show
        @user = User.find_by(id: params[:id])
        
        if @user #if the user exists
            render json: @user, status: 200
        else 
            render json: "No user found.", status: 404
        end 
    end 

    def create
        # @user = User.new(params[:user][:username] ... etc)
        @user = User.new(user_params)
        
        if @user.save
            render json: @user, status: 200
        else 
            # rails will add error messages corresponding to the model validations
            render json: @user.errors.full_messages, status: 422
        end 
    end 

    private

    def user_params
        params.require(:user).permit(:username, :email, :age)
        # expects params to have inside of it
        # params = { user: {username: "name", email: "email", age: "age"} ... other stuff in here too}
    end 
end
