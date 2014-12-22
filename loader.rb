#!/usr/bin/env ruby

require 'mercenary'
require_relative 'email'

Mercenary.program(:email) do |p|
    p.version '0.1'
    p.description 'This will be a program to generate emails Jekyll style'
    p.syntax "email <subcommand> [options]"

    p.command(:build) do |c|
        c.syntax "build <template> <email json> [options]"
        c.description "Build an email using a template"
        
        c.action do |args, _|
            if args.length != 2
                abort('Please enter both a ')
            end
            
            Email::BuildCommand.new(args[0], args[1]).build
        end
    end

    p.command(:test) do |c|
        c.syntax "test email"
        c.description "Test an email using a browser"

        c.action do |args, _|

        end
    end
end


