module SessionsHelper
    def logged_in?
        return session[:user].is_a?(Hash) ? true : false
    end

    def current_user
        return session[:user]
    end

    def refresh_token

    end

    def get_token

    end
end