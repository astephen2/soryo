require 'yaml'

module Email
    class Config < Hash
        def initialize
            config = {
                # Output
                'output_location' => Dir.pwd,
                'output_name' => nil,

                # Testing
                'test_type' => 'browser',
                'test_apikey' => nil,
                'test_username' => nil,
                'test_password' => nil,

                # Sending
                'mail_send' => 'local',
                'mail_smtpserver' => nil,
                'mail_username' => nil,
                'mail_password' => nil,
                'mail_fromaddress' => nil,
                'mail_subject' => nil
            }
            super()
            initialize_config(config)
        end

        def initialize_config(config)
            config.each do |k,v|
                self[k] = v
            end
        end

        # Takes in settings file path, merges yaml with settings
        def read_yaml(settings)
            if Pathname.exists(settings)
                file = File.open(settings, 'r')
                configfile = YAML.load(file.read)
                initialize_config(configfile)
                file.close
            end
        end

    end
end
