require_relative '../clanbot/clanbot'
require_relative '../config'

# Handles the 'events' command
def do_events(event, command, args)
    # TODO implement
    event.respond("Clan Events:")
    event.respond("Nothing scheduled. Check back soon!")
end

# Register the command.
ClanBot::ClanBot.instance().register_cmd("events", method(:do_events))
