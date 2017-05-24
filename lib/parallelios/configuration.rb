# frozen_string_literal: true

require 'yaml'
require_relative 'configuration/build'

module Parallelios
  # Configuration for building and paralleling
  class Configuration
    # Default path to configuration file
    DEFAULT_CONFIG_PATH = 'config/parallelios.yml'

    # Contains build configuration(xcodebuild)
    #
    # Examples
    #
    #   build # => #<Parallelios::Configuration::Build:0x007f9d1a3bfbc8>
    #
    # Returns Configuration::Build
    attr_reader :build

    # Initialize
    #
    # options - Hash of configuration options
    #
    # Examples
    #
    #   new(config: 'path/to/config.yml')
    #
    #   new(build: { workspace: 'Projects/Project.workspace' })
    #
    # Returns Configuration.
    def initialize(options)
      config = load_config_file(options[:config])
      config = options.merge(config)

      @build = Build.new(config[:build])
    end

    private

    def load_config_file(config_path)
      YAML.safe_load(config_file(config_path), [Symbol])
    end

    def config_file(config_path)
      File.open(config_path || DEFAULT_CONFIG_PATH)
    end
  end
end
