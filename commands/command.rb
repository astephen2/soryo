require 'yaml'
module Email
    class Command

        attr_reader :config
        def initialize(options)
            @config = Email::Config.new
            @config.merge(options)

            if @config[:settings_file]
                merge_yaml(@config[:settings_file])
            end
        end

        def merge_yaml(settings_file)
            begin
                f= File.open(settings_file, 'r')
                yaml_settings = YAML.load(settings_file)
                @config.merge(yaml_settings)
            rescue
                puts 'Settings file does not exist'
            end
        end

    end
end
