require 'tilt'

module 'email'
    class Builder
         
        def initialize(template, email)
            @template = email::FileInstance.initialize(template)
            @email = email::FileInstance.initialize(email)
        end
        
        def build_email
            new_template = Tilt.new(@template.to_s)
            complete_email = new_template.render(@email.to_s)
        end        
    end
end
