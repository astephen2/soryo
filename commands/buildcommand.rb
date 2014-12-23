require 'mercenary' 
module Email
    class BuildCommand < Email::Command
        
        def initialize(template, email, options)
            super(options)
            @template = Email::FileInstance.new template
            @email = Email::FileInstance.new email
        end
            
        def build
            template_builder = Email::Template.new(@template.to_s, @email.to_hash)
            final_email = template_builder.compile
            # Run the plugins
            save final_email
        end


        def save(email)
            filename = @email.shortname + '.html'
            final_email = Email::FileInstance.new(filename)
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
                    command = Email::BuildCommand.new(args[0], args[1], options)
                    command.build
                end
            end
        end

    end
end
