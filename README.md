# Clan Discord Bot

## Setup

To use the clan discord bot, you must have Ruby 2.2 or higher. Install the gem using [Bundler](http://bundler.io/):

```
bundle /path/to/clan-discord-bot
```

The project makes use the following Ruby gems:
 * [discordrb](https://github.com/meew0/discordrb) - Ruby Discord bot API

After that, modify `src/config.rb` to point to the correct values and run the bot:
```
ruby src/main.rb
```

## Other

You may want to edit `src/commands.rb` to fit your needs (see `src/main.rb` to see which functions bind to which commands)

If you add any useful commands, please send a pull request if you wish!

## Planned features

Some features I'd like to add:
 * Personal timers. Set a timer for an upcoming date/time, or set a countdown timer for reminders.
 * Event scheduling. Ability to add/edit/remove events (date/time, description, location). Anyone can query for a list of upcoming events.
 * Clan leaderboards. Queries hiscores API for member rankings and provides commands for viewing various leaderboard categories.
 * Member bios. Members can set a bio that is shown if others run a command to show that user's bio.
 * ...other stuff like group-based permissions, ability to link discord user to character, and so on

## License

This project is freely available under the MIT License (MIT). See "LICENSE" for details.