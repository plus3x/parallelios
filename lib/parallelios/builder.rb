# frozen_string_literal: true

module Parallelios
  # Builder for xcode project
  class Builder
    # Initialize
    #
    # config - Configuration of build
    #
    # Examples
    #
    #   new(config)
    #
    #   new(Configuration.new(options))
    #
    # Returns Builder.
    def initialize(config)
      @config = config
    end

    # Run builder
    #
    # Examples
    #
    #   run
    #
    # Returns String.
    def run
      `xcodebuild #{@config} test-without-building`
    end
  end
end
