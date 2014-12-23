#!/usr/bin/env ruby

require 'mercenary'
require_relative 'email'

Mercenary.program(:email) do |p|
    p.version '0.1'
    p.description 'This will be a program to generate emails Jekyll style'
    p.syntax "email <subcommand> [options]"

    [Email::BuildCommand].each do |c|
        c.add_command(p)
    end
end


