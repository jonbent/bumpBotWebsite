# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DefaultCommand.destroy_all
GuildCommand.destroy_all

dc = DefaultCommand.create(class_name: "guild", method_name: "setName", method_type: 'method', description: "Set the name of your guild", return_type: "Guild")
CommandParam.create(param_key: 'name', param_value: 'string', default_command_id: dc.id)
CommandParam.create(param_key: 'reason', param_value: 'string', default_command_id: dc.id)
# testing purposes
GuildCommand.create(guild_id: 1, default_command_id: dc.id, command: "setName")

DefaultCommand.create(class_name: "guild", method_name: "leave", method_type: "method", description: "Make bumpBot leave your guild", return_type: "Guild")

dc = DefaultCommand.create(class_name: "guild", method_name: "setAFKTimeout", method_type: "method", description: "Set the AFK Timeout for your guild.", return_type: "Guild")
CommandParam.create(param_key: 'afkTimeout', param_value: 'number', default_command_id: dc.id)
CommandParam.create(param_key: 'reason', param_value: 'string', default_command_id: dc.id)

dc = DefaultCommand.create(class_name: "guild", method_name: "setRegion", method_type: "method", description: "Edits the region of the guild.", return_type: "Guild")
CommandParam.create(param_key: 'region', param_value: 'string', default_command_id: dc.id)
CommandParam.create(param_key: 'reason', param_value: 'string', default_command_id: dc.id)

dc = DefaultCommand.create(class_name: "guild", method_name: "setVerificationLevel", method_type: "method", description: "Edits the verification level of the guild.", return_type: "Guild")
CommandParam.create(param_key: 'verificationLevel', param_value: 'number', default_command_id: dc.id)
CommandParam.create(param_key: 'reason', param_value: 'string', default_command_id: dc.id)

dc = DefaultCommand.create(class_name: "guild", method_name: "splashURL", method_type: "method", description: "The URL to this guild's splash.", return_type: "string")

dc = DefaultCommand.create(class_name: "guild", method_name: "member", method_type: "method", description: "Returns the GuildMember form of a User object, if the user is present in the guild.", return_type: "User")
CommandParam.create(param_key: 'user', param_value: 'MentionedUser', default_command_id: dc.id)

dc = DefaultCommand.create(class_name: "user", method_name: "createDM", method_type: "method", description: "Creates a DM channel between the client and the user.", return_type: "DMChannel")
CommandParam.create(param_key: 'user', param_value: 'MentionedUser', default_command_id: dc.id)