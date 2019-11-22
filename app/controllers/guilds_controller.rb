class GuildsController < ApplicationController
    def create
        @guild = Guild.where(guild_id: params[:guild_id]).first_or_create(guild_params)

        redirect_to guild_path(@guild)
    end

    def show
        guild = Guild.find_by(id: params[:id])
        @guild = self.class.get_cur_guilds(session)["#{guild.guild_id}"]
        @guild_image = Guild.generate_image_url(@guild)
    end

    private

    def guild_params
        params.permit(:guild_id, :permissions).merge({user_id: session[:user]["id"]})
    end
end