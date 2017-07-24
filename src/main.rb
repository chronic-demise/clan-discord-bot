require_relative 'clanbot/clanbot'
require_relative 'config'

# Create the bot.
bot = ClanBot::ClanBot.instance()

# Print the invite URL (for the bot to join the channel)
puts("This bot's invite URL is: #{bot.invite_url}")

# Load all commands from the 'commands/' directory
Dir["commands/*.rb"].each {
    |file| require_relative file
}

# And finally, start it!
bot.run()
