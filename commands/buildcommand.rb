class BuildCommand
    
    def initialize(template, email)
        @template = FileInstance.new template
        @email = FileInstance.new email
    end
        
    def build
        template_builder = Template.new(@template.to_s, @email.to_hash)
        final_email = template_builder.compile
        # Run the plugins
        save final_email
    end


    def save(email)
        filename = @email.shortname + '.html'
        final_email = FileInstance.new(filename)
        final_email.write(email)
    end
end
