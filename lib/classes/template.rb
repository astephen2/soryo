require 'liquid'
module Soryo
    class Template
        attr_reader :template, :hash

        def initialize(template, hash)
            @template = template
            @hash = hash
        end

        def compile
            compiled_template = Liquid::Template.parse(@template)
            email = compiled_template.render(@hash)
            run_plugins email
        end

        def run_plugins(email)
            Soryo::Plugin.descendants.each do |c|
                c.new.run(email)
            end
            email
        end

    end
end
