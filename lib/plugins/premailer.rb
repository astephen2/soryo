require 'premailer'

module Soryo
    class PremailerPlugin < Soryo::Plugin

        def run(email)
            Premailer.new(email, :with_html_string => true)
        end

    end
end
