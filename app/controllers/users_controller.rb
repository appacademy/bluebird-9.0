class UsersController < ApplicationController

    def new
        @user = User.new
        render :new 
    end 

    def edit
        #but who? we have their id in params!
        @user = User.find(params[:id])
        render :edit
    end

    def index
        @users = User.all

        # controller actions must render OR redirect
        # render json: @users, status: 200
        render :index # could comment this out
    end

    def show
        @user = User.find_by(id: params[:id])
        # @user = User.find_by(username: params[:username]) #just an example
        
        if @user #if the user exists
            # render json: @user, status: 200
            render :show
        else 
            render json: "No user found.", status: 404
        end 
    end 

    def create
        # @user = User.new(params[:user][:username] ... etc)
        @user = User.new(user_params)
        
        if @user.save
            # render json: @user, status: 200
            redirect_to user_url(@user)
        else 
            # rails will add error messages corresponding to the model validations
            render json: @user.errors.full_messages, status: 422
        end 
    end 

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status: 422
        end
    end 

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url
    end 

    private

    def user_params
        params.require(:user).permit(:username, :email, :age)
        # expects params to have inside of it
        # params = { user: {username: "name", email: "email", age: "age"} ... other stuff in here too}
    end 
end
