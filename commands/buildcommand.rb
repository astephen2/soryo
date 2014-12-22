class BuildCommand
    
    def initialize(template, email)
        @template = FileInstance.new template
        @email = FileInstance.new email
    end
        
    def build
        template_builder = Template.new(@template.to_s, @email.to_hash)
        save template_builder.compile
    end


    def save(email)
        filename = @email.shortname + '.html'
        final_email = FileInstance.new(filename)
        final_email.write(email)
    end
end
