class UsersController < ApplicationController
    before_action :find_user, only:[:show, :edit, :update, :destroy]
    skip_before_action :required_login, only:[:new,:create]
    def index 
        #redirect_to '/' if !@logged_in_user
        @users = User.all
    end

    def new #creating new account
        if session[:user_id]
            redirect_to home_path
        else
            @user = User.new
        end
    end

    def show
        
    end

    def create 
            @user = User.new(user_params)
            if @user.mood == nil || @user.mood.empty?
                emotions = ["happy","sad","hungry","excited","depressed","cool","chill","relaxed"]
                @user.mood = emotions.sample 
            end
            @user.img_url = Scraper.search(@user.username,@user.mood)
            if @user.save
                session[:user_id] = @user.id
                redirect_to edit_user_path(@user)
            else
                redirect_to sign_up_path
            end 
    end

    def edit
        if @user != @logged_in_user
            redirect_to @user
        end
    end

    def update
        old_mood = @user.mood
        old_username = @user.username
        @user.update(user_params)
        if @user.mood != old_mood || @user.username != old_username
            @user.update(img_url: Scraper.search(@user.username,@user.mood))
        end
        redirect_to user_path(@user)
    end

    def destroy
        @user.destroy
        session[:user_id] = nil
        redirect_to users_path
    end

    private
    
    def user_params
    params.require(:user).permit(:username, :mood, :hobby, :job, :food, :music, :password, :password_confirmation)
    end

    def find_user
        @user = User.find(params[:id])
    end

end

