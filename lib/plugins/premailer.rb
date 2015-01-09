require 'premailer'

module Email
    class PremailerPlugin < Email::Plugin

        def run(email)
            Premailer.new(email, :with_html_string => true)
        end

    end
end
