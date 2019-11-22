class UsersController < ApplicationController
    require 'faraday'
    require 'uri'
    def show
        @guilds = self.class.get_cur_guilds(session, true)
    end
end