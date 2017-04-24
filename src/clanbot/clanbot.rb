require 'discordrb'

# A clan-specific Bot implementation, which can read from a config
# and have custom chat commands registered to it.
class ClanBot < Discordrb::Bot
    
    def initialize()
        @config = load_config("../config/config.properties")
        
        super(token: @config["bot-token"], client_id: @config["client-id"])
    end
    
    public
        # Register a command, in the form ~{cmd-prefix} {cmd}
        # TODO add command args support
        def register_cmd(cmd, handler)
            message(content: "~" + @config["cmd-prefix"] + " " + cmd) do |event|
                handler.call(event)
            end
        end
        
    protected
        # Load the config from the given path
        def load_config(path)
            config_dict = {}
            file = File.open(path, "r")
            contents = file.readlines.each do |line|
                if line["="] != nil
                    parts = line.split("=", 2)
                    config_dict[parts[0].strip] = parts[1].strip
                end
            end
            config_dict
        end
        
end
