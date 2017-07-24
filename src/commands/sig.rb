require_relative '../clanbot/clanbot'
require_relative '../config'

# Handles the 'sig' command
# This attaches the clan forum banner signature (see https://github.com/chronic-demise/clan-signature)
def do_sig(event, command, args)
    usage = "`" + command + " {username}` or `" + command + " {username}, {theme}`"
    
    username = nil
    theme = 0
    
    if (args.length < 1 || args.length > 2)
        raise ClanBot::InvalidArgumentError.new("Invalid number of arguments. Must be 1 or 2.", usage)
    elsif args.length >= 1
        # These will be 0 if conversion fails.
        # TODO show a better message than "max must be >= min" if conversion fails...
        username = args[0]
        
        # Validate username
        # TODO move into a common utility
        if /[0-9a-zA-Z ]{1,12}/.match(username).nil?
            ClanBot::InvalidArgumentError.new("Invalid character name.", usage)
        end
        username = username.sub(/ /, '%20')
    end
    if args.length == 2
        theme = args[1].to_i
    end
    
    event.respond(Config::COMMAND[:"sig_banner_url"] + "?user=" + username + "&theme=" + theme.to_s)
end

# Register the command.
ClanBot::ClanBot.instance().register_cmd("sig", method(:do_sig))
