require 'yaml'

module Email
    DEFAULTS = {
                # Output
                'output_location' => Dir.pwd,
                'output_name' => nil,

                # Testing
                'test_type' => 'preview',
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

    class Config < Hash
        def initialize
            super()
            merge_with(DEFAULTS)
        end

        def merge_with(config)
            new_self = self.merge(config)
            new_self.each do |k,v|
                self[k] = v
            end
        end

        # Takes in settings file path, merges yaml with settings
        def read_yaml(settings)
            settings_instance = Email::FileInstance.new(settings)
            if settings_instance.existance?
                self.merge_with(settings_instance.to_hash)
            else
                raise 'NoFileFound'
            end
        end

    end
end
