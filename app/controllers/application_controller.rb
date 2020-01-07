class ApplicationController < ActionController::Base
    before_action :required_login
    skip_before_action :required_login, only:[:home,:required_login] #inh... all controller so if home action in other controller it will break

    def home
        if session[:user_id]
            @logged_in_user = User.find(session[:user_id])
            @posts = Post.all.order('updated_at DESC')
        end
    end

    private

    def required_login
        @errors = flash[:errors]
        if session[:user_id]
         @logged_in_user = User.find(session[:user_id])
        else
            redirect_to '/'
        end
    end

end
