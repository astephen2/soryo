require 'mercenary' 
module Soryo
    class BuildCommand < Soryo::Command
        
        def initialize(template, email, options)
            super(options)
            @template = Soryo::FileInstance.new template
            @email = Soryo::FileInstance.new email
        end
            
        def build
            template_builder = Soryo::Template.new(@template.to_s, @email.to_hash)
            final_email = template_builder.compile
            # Run the plugins
            save final_email
        end


        def save(email)
            filename = @email.shortname + '.html'
            final_email = Soryo::FileInstance.new(filename)
            final_email.write(email)
        end
        
        def self.add_command(program)
            program.command(:build) do |c|
                c.syntax "build <template> <email> <json> [options]"
                c.description "Build an email using a template"

                c.action do |args, options|
                    if args.length != 2
                        abort('Please enter both a template and email')
                    end
                    command = Soryo::BuildCommand.new(args[0], args[1], options)
                    command.build
                end

                self.add_options(c)
            end
        end

    end
end
