require 'mercenary' 
module Soryo
    class SendCommand < Soryo::Command
        
        def initialize(template, email, options, instructions)
            super(options)
            @template = Soryo::FileInstance.new template
            @email = Soryo::FileInstance.new email
            @instructions = Soryo::FileInstance.new instructions
        end
            
        def build
            template_builder = Soryo::Template.new(@template.to_s, @email.to_hash)
            final_email = template_builder.compile
            # Run the plugins
            send final_email
        end


        def send(email)
            Soryo::Sender.descendants.each do |c|
                if c.sender_name == @config["send_type"]
                    sender = c.new
                    sender.run(email, @config)
                end
            end
        end
        
        def self.add_command(program)
            program.command(:send) do |c|
                c.syntax "send <template> <json> <email instructions> [options]"
                c.description "Build an email using a template and send it to the world"

                c.option "test_type", "--test_type", "choose the type of testing you want"

                c.action do |args, options|
                    if args.length != 3
                        abort('Please enter a template, email, and instructions')
                    end
                    command = Soryo::SendCommand.new(args[0], args[1], options, args[2])
                    command.build
                end

                self.add_options(c)
            end
        end

    end
end
