require 'liquid'
module Email
    class Template
        attr_reader :template, :hash

        def initialize(template, hash)
            @template = template
            @hash = hash
        end

        def compile
            compiled_template = Liquid::Template.parse(@template)
            email = compiled_template.render(@hash)

            # Run plugins
            Email::Plugin.descendants.each do |c|
                c.new.run(email)
            end
            email
        end
    end
end
