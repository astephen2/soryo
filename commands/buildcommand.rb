module Email
    class BuildCommand < Email::Command
        
        def initialize(template, email)
            super()
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
    end
end
