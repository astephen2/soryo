module Email
    require_relative 'classes/fileinstance'
    require_relative 'classes/template'
    require_relative 'commands/command'
    require_relative 'commands/buildcommand'
    require_relative 'classes/config'

    # Plugins
    require_relative 'classes/plugin'
    require_relative 'plugins/premailer'
end
