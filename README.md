# Clan Discord Bot

To use the clan discord bot, you must have Ruby 2.2 or higher. Install the gem using [Bundler](http://bundler.io/):

```
bundle /path/to/clan-discord-bot
```

The project makes use of several ruby gems, including:
 * [discordrb](https://github.com/meew0/discordrb) - Ruby Discord bot API
 * [mongo-ruby-driver](https://github.com/mongodb/mongo-ruby-driver) - MongoDB API
 * [partyhat](https://github.com/clooth/Partyhat) - RuneScape API accessor

__NOTE:__ The above gems have the following dependencies, which will need to be installed separately:
 * [Ruby Development Kit](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit) (if on Windows)
 * [libcurl](https://curl.haxx.se/download.html) (needed for 'curb' ruby gem, a dependency of 'partyhat')
    * On Windows, I had some trouble getting the 'curb' gem to install. When running:
      ```
      gem install curb -- --with-curl-include C:/dev/libs/curl-7.54.0-win32-mingw/include --with-curl-lib C:/dev/libs/curl-7.54.0-win32-mingw/bin
      ```
      I was getting this error:
      ```
      C:/Ruby23/lib/ruby/2.3.0/mkmf.rb:1746:in `dir_config': undefined method `split' for true:TrueClass (NoMethodError)
          from extconf.rb:3:in `<main>'
      ```
      I'm not sure why the code was calling string methods on a boolean value, but I was able to work around it by hard-coding my curl include/lib paths inside the `dir_config` method in `mkmf.rb`:
      ```
      ## HACK - Hard-coding idir, ldir paths to work around a bug in the code...
      idir = "C:/dev/libs/curl-7.54.0-win32-mingw/include"
      ldir = "C:/dev/libs/curl-7.54.0-win32-mingw/bin"
      ```
      
After that, modify `src/config.rb` to point to the correct values and run the bot:
```
ruby src/main.rb
```

-----
