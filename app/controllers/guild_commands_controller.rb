class GuildCommandsController < ApplicationController
    def create
        @guild_command = GuildCommand.new(guild_command_params)
        @real_guild = Guild.find(params[:guild_id])
        @guild_command.guild = @real_guild
        if @guild_command.save
            redirect_to guild_url(params[:guild_id])
        else
            redirect_to guild_url(params[:guild_id])
        end
    end

    private
    def guild_command_params
        params.require(:guild_command).permit(:enabled, :guild_id, :command, :default_command_id)
    end
end