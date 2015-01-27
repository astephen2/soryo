# Soryo
Soryo is a utility designed to help you build template-driven emails. Emails can now be separated into templates and JSON/YAMLbased information. This is designed for newsletters or other areas where an emails look rarely changes but the content does.

## Installation
You can install Soryo through RubyGems. Simply enter the following
    gem install soryo
This will install the latest stable version of Soryo.

## Usage
Soryo currently has one command
    $ soryo build <email template> <email info>
Substitute in a valid HTML file for a template and a valid JSON or YAML file for the email information.
