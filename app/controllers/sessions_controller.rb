class SessionsController < ApplicationController
    require 'faraday'
    require 'uri'
    def new
        redirect_to "https://discordapp.com/api/oauth2/authorize?client_id=" + ENV["CLIENT_ID"] + "&redirect_uri=http%3A%2F%2Flocalhost%3A3000%2Flogin&response_type=token&scope=identify%20email%20connections%20guilds" 
    end

    def create
        session[:user_token] = params[:code]
        data = {
                'client_id': ENV["CLIENT_ID"],
                'client_secret': ENV["CLIENT_SECRET"],
                'grant_type': 'client_credentials',
                'code': session[:user_token],
                'redirect_uri': ENV["REDIRECT_URI"],
                'scope': 'identify email connections guilds'
            }
        url = 'https://discordapp.com/api/oauth2/token'
        token_info = Faraday.post(url) do |token_req|
            token_req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
            token_req.body = data
        end
        user_token_info = JSON.parse token_info.body
        session[:user_token_info] = user_token_info
        user_url = "https://discordapp.com/api/users/@me"
        user_info = Faraday.get(user_url) do |user_req|
            user_req.headers['Authorization'] = 'Bearer ' + user_token_info["access_token"]
        end 
        user_info = JSON.parse user_info.body
        session[:user] = User.where(_id: user_info["id"]).first_or_create(user_info.except("id"))
        redirect_to user_path(session[:user])
    end

    def destroy
        session[:user_token_info] = nil
        session[:user_token] = nil
        session[:user] = nil
        redirect_to root_path
    end
end