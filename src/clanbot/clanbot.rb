require 'discordrb'
require 'discordrb/gateway'

require_relative '../config'

module ClanBot

    class InvalidArgumentError < ArgumentError
        attr_reader :usage
        def initialize(message = "An invalid argument was specified.", usage = nil)
            @usage = usage
            super(message)
        end
    end

    # A clan-specific Bot implementation, which can read from a config
    # and have custom chat commands registered to it.
    class ClanBot < Discordrb::Bot
        
        @@instance = nil
        
        class << self
            protected :new
        end
        
        def self.instance()
            if @@instance.nil?
                @@instance = ClanBot.new()
            end
            @@instance
        end
        
        def initialize()
            # A Hash of "cmd_name" => :cmd_handler
            @commands = {}
            
            super(token: Config::BOT[:"token"], client_id: Config::CLIENT[:"id"])
        end
        
        def run()
            # Forward anything matching the configured prefix to 'handle_command'
            message(start_with: Config::COMMAND[:"prefix"]) do |event|
                handle_command(event)
            end
            
            method(:run).super_method.call
        end
        
        public
            # Register a command, in the form ~{prefix} {cmd} {arg1}, {arg2...}
            def register_cmd(cmd, handler)
                @commands[cmd] = handler
            end
            
        protected
            
            def handle_command(event)
                input = event.content
                prefix = Config::COMMAND[:"prefix"]
                
                # Break up the input "~{prefix} {cmd} {arg1}, {arg2...}" into "{cmd}" and "{args...}"
                command, args = input[prefix.length, input.length - prefix.length].strip.split(' ', 2)
                if args.nil?
                    args = []
                else
                    args = args.split(',') # Arguments are comma-delimited
                end
                
                if @commands.has_key?(command)
                    begin
                        @commands[command].call(event, prefix + " " + command, args)
                    rescue InvalidArgumentError => error
                        if error.usage.nil?
                            event.respond(error.message)
                        else
                            event.respond(error.message + "\n        Usage: " + error.usage)
                        end
                    end
                else
                    event.respond("Command `" + command + "` doesn't exist. Try: `" + prefix + " help` for a listing.")
                end
            end
    end
end
