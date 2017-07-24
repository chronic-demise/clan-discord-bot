
module Config
    
    # DiscordApp details
    CLIENT = {
        id: your-client-id-here
    }

    # Bot Details
    BOT = {
        token: "your-token-here",
        username: "your-username-here",
        id: your-bot-id-here
    }
    
    # Command configuration
    COMMAND = {
        # Prefix used to issue commands: ~{prefix} {command}
        # default: ~cd (for either Clan Discord or Chronic Demise)
        prefix: "~cd",
        
        # URL pointing at banner.png (dynamically served via Banner.php) for the 'sig' command
        # See: https://github.com/chronic-demise/clan-signature
        # It should include the filename, such as: http://example.com/clan-sig/banner.png
        # Leave blank to disable the 'sig' command.
        sig_banner_url: ""
    }
    
end
