module Email
    require_relative 'classes/fileinstance'
    require_relative 'classes/template'
    require_relative 'classes/config'

    # Commands
    require_relative 'commands/command'
    require_relative 'commands/buildcommand'
    require_relative 'commands/testcommand'

    # Plugins
    require_relative 'classes/plugin'
    require_relative 'plugins/premailer'

    # Testers
    require_relative 'testers/tester'
    require_relative 'testers/preview'
end
