module Email
    class Command

        attr_reader :config
        def initialize
            @config = Email::Config.new
        end

    end
end
