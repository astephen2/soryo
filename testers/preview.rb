require 'mail'
require 'tempfile'
require 'launchy'

module Email
    class BrowserTester < Email::Tester
        
        attr_reader :preview_obj
        def run(email, options)
            file = Tempfile.new(['tempemail', '.html'])
            file << email
            file.close
            `open #{file.path}`
        end

        def self.tester_name
            'preview'
        end

        def initialize
        end

   end
end

