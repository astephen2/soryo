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
            compiled_template.render(@hash)
        end
    end
end
