module Soryo
    require 'classes/fileinstance'
    require 'classes/template'
    require 'classes/config'

    # Commands
    require 'commands/command'
    require 'commands/buildcommand'
    require 'commands/testcommand'

    # Plugins
    require 'classes/plugin'
    require 'plugins/premailer'

    # Testers
    require 'testers/tester'
    require 'testers/preview'
end
