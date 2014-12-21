#!/usr/bin/env ruby

require 'mercenary'

Mercenary.program(:email) do |p|
    p.version '0.1'
    p.description 'This will be a program to generate emails Jekyll style'
    p.syntax "email <subcommand> [options]"

    p.command(:build) do |c|
        c.syntax "build template email"
        c.description "Build an email using a template"
        
        c.action do |args, _|
            if args.length != 2
                abort('not enough args')
            end

        end
    end
end


