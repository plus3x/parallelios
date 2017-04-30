# frozen_string_literal: true

require 'thor'

module Parallelios
  # Command-Line Interfaces of project
  class CLI < Thor
    desc 'devices', 'show all connected devices'

    long_desc <<-LONGDESC
    `parallelios devices` will print connected devices

    Example:

    > $ parallelios devices

    > Known Devices:
    \x5> MacBook Pro [505FA61D-D7F6-5150-8E3D-ASSFS899CBCB]
    LONGDESC

    # Print connected devices
    #
    # Examples
    #
    #   devices # => "Known Devices:\nMacBook Pro [505FA61D-D7F6-5150-8E3D-ASSFS899CBCB]"
    #
    # Returns String
    def devices
      puts `instruments -s devices | grep -v '(Simulator)'`
    end
  end
end
