class GuildsController < ApplicationController

    def create
        @guild = Guild.where(guild_id: params[:guild_id]).first_or_create(guild_params)

        redirect_to guild_path(@guild)
    end

    def show
        if request.xhr?
            render json: DefaultCommand.find_by(id: params[:default_command_id])
        else
            @fake_command = DefaultCommand.new
            @guild_command = GuildCommand.new
            @select_options = DefaultCommand.includes(:command_params).all
                .map {|dc| [dc.class_name + "." + dc.method_name + (!dc.command_params.empty? ? " {" + dc.command_params.map {|param| "#{param.param_key}:#{param.param_value}"}
                .join("}, {") + "}" : ""), dc.id]}.unshift(["Select Bot Command", ""])
            @real_guild = Guild.includes(:guild_commands).includes(:default_commands).includes(:command_params).find_by(id: params[:id])
            @guild_commands = @real_guild.guild_commands
            @guild = self.class.get_cur_guilds(session)["#{@real_guild.guild_id}"]
            @guild_image = Guild.generate_image_url(@guild)
        end
    end
        
    private

    def guild_params
        params.permit(:guild_id, :permissions).merge({user_id: session[:user]["id"]})
    end
end