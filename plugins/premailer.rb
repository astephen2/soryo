require 'premailer'

module Email
    class PremailerPlugin < Email::Plugin

        def run(email)
            Premailer.new(email)
        end

    end
end
