require 'mercenary' 
module Email
    class TestCommand < Email::Command
        
        def initialize(template, email, options)
            super(options)
            @template = Email::FileInstance.new template
            @email = Email::FileInstance.new email
        end
            
        def build
            template_builder = Email::Template.new(@template.to_s, @email.to_hash)
            final_email = template_builder.compile
            # Run the plugins
            test final_email
        end


        def test(email)
            Email::Tester.descendants.each do |c|
                if c.tester_name == @config["test_type"]
                    tester = c.new
                    tester.run(email, @config)
                end
            end
        end
        
        def self.add_command(program)
            program.command(:test) do |c|
                c.syntax "test <template> <json> [options]"
                c.description "Build an email using a template"

                c.option "test_type", "--test_type", "choose the type of testing you want"

                c.action do |args, options|
                    if args.length != 2
                        abort('Please enter both a template and email')
                    end
                    command = Email::TestCommand.new(args[0], args[1], options)
                    command.build
                end

                self.add_options(c)
            end
        end

    end
end
