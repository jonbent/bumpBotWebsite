class ApplicationController < ActionController::Base
    protected

    def self.get_cur_guilds(session, check_db = false)
        guilds_url = "https://discordapp.com/api/users/@me/guilds"
        guilds_info = Faraday.get(guilds_url) do |user_req|
            user_req.headers['Authorization'] = 'Bearer ' + session[:user_token_info]["access_token"]
        end
        guilds = JSON.parse guilds_info.body
        res = {}
        # cant get inject to work for some reason. each works.
        guilds.each do |el| 
            if (el["permissions"] & 0x8) == 0x8
                el["in_database"] = false
                if check_db && Guild.exists?(id: el["id"])
                    el["in_database"] = true
                end
                res[el["id"]] = el
            end
        end
        res
    end
    private

    def require_online
        redirect_to(:root) && return if !logged_in?
    end
end
