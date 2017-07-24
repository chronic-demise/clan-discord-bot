require_relative 'clanbot/clanbot'

require_relative 'config'

# Handles the 'events' command
def do_events(event, command, args)
    # TODO implement
    event.respond("Clan Events:")
    event.respond("Nothing scheduled. Check back soon!")
end

# Handles the 'rng' command
def do_rng(event, command, args)
    usage = "`" + command + "` or `" + command + " {min}, {max}` (inclusive)"
    
    # Some sensible defaults.
    min, max = [0, 100]
    
    if (args.length == 1 || args.length > 2)
        raise ClanBot::InvalidArgumentError.new("Invalid number of arguments. Must be 0 or 2.", usage)
    elsif args.length == 2
        # These will be 0 if conversion fails.
        # TODO show a better message than "max must be >= min" if conversion fails...
        min = args[0].to_i
        max = args[1].to_i
    end
    
    if min >= max
        raise ClanBot::InvalidArgumentError.new("Max must be greater than min.", usage)
    end
    
    random = Random.new
    result = min + random.rand((max + 1) - min)
    event.respond("Roll Dice [" + min.to_s + ", " + max.to_s + "]: `" + result.to_s + "`")
end

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

# Handles the 'code' command
# Returns our clan's Github URL :)
def do_code(event, command, args)
    event.respond("Chronic Demise Github URL: https://github.com/chronic-demise/")
end
