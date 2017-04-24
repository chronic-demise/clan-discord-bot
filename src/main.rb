require_relative 'clanbot/clanbot'
require_relative 'commands'

# Start the bot
bot = ClanBot.new()

# Print the invite URL (for the bot to join the channel)
puts("This bot's invite URL is: #{bot.invite_url}")

# Register custom commands
bot.register_cmd("events", method(:do_events))

# And finally, start it
bot.run()
