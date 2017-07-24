require_relative '../clanbot/clanbot'
require_relative '../config'

# Handles the 'code' command
# Returns our clan's Github URL :)
def do_code(event, command, args)
    event.respond("Chronic Demise Github URL: https://github.com/chronic-demise/")
end

# Register the command.
ClanBot::ClanBot.instance().register_cmd("code", method(:do_code))
