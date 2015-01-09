require 'yaml'
require 'pathname'

module Email
    class Command

        attr_reader :config

        def self.descendants
            descendants = []
            ObjectSpace.each_object(singleton_class) do |k|
                descendants.unshift k unless k == self
            end
            descendants
        end

        def initialize(options)
            @config = Email::Config.new
            unless options.nil?
                @config.merge_with(options)
            end

            get_settings_file
        end

        def get_settings_file
            if @config[:settings_file]
                @config.read_yaml(@config[:settings_file])
            elsif Pathname.new('settings.yaml').exist?
                @config.read_yaml('settings.yaml')
            end
        end 

        def self.add_options(c)
            c.option 'config_file', '--config', 'choose a different config file'
        end

        def self.add_command(program)
            abort('Command.self.add_command should not be called on their own')
        end

    end
end
