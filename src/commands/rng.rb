require_relative '../clanbot/clanbot'
require_relative '../config'

# Handles the 'rng' command
# Rolls a dice between two specified values, or between [1, 100] by default
def do_rng(event, command, args)
    usage = "`" + command + "` or `" + command + " {min}, {max}` (inclusive)"
    
    # Some sensible defaults.
    min, max = [1, 100]
    
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

# Register the command.
ClanBot::ClanBot.instance().register_cmd("rng", method(:do_rng))
