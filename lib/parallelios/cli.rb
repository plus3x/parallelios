# frozen_string_literal: true

require 'thor'
require_relative '../parallelios'

module Parallelios
  # Command-Line Interfaces of project
  class CLI < Thor
    # Command-Line Interface help.
    #
    # shell - String command name
    # subcommand - Optional Boolian(defaults to false)
    #
    # Examples
    #
    #   help # => Information about all command in CLI
    #
    #   help('start') # => Information about command 'start'
    #
    # Returns String.
    def self.help(shell, subcommand = false)
      super
      command_help(shell, default_task)
    end

    default_task :start

    desc 'start', 'Start tests'

    long_desc <<-LONGDESC
    `parallelios start` run tests with options

    Example:

    > $ parallelios start

    Tests running...
    LONGDESC

    method_option :config,
                  type: :string,
                  default: 'config/parallelios.yml',
                  aliases: '-c',
                  banner: 'Specify a configuration file(parallelios.yml)'

    # Start tests.
    #
    # Examples
    #
    #   start # => Run tests
    #
    # Returns Integer.
    def start
      puts options
      config = Configuration.new(options)
      puts config.build
      exit(0)
    end

    desc 'devices', 'show all connected devices'

    long_desc <<-LONGDESC
    `parallelios devices` will print connected devices

    Example:

    > $ parallelios devices

    > Known Devices:
    \x5> MacBook Pro [505FA61D-D7F6-5150-8E3D-ASSFS899CBCB]
    LONGDESC

    # Print connected devices.
    #
    # Examples
    #
    #   devices # => "Known Devices:\nMacBook Pro [505FA61D-D7F6-5150-8E3D-ASSFS899CBCB]"
    #
    # Returns String.
    def devices
      puts `instruments -s devices | grep -v '(Simulator)'`
    end
  end
end
