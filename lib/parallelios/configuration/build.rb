# frozen_string_literal: true

require_relative 'build/destination'

module Parallelios
  class Configuration
    # Build configuration
    class Build
      # OPTIONS contains all options implemented for building
      OPTIONS = %i(workspace scheme destination configuration only_testing).freeze

      attr_reader(*OPTIONS)

      # Initialize
      #
      # options - Hash of configuration options
      #
      # Examples
      #
      #   new(scheme: 'Project', configuration: 'Debug')
      #
      #   new(workspace: 'Projects/Project.workspace', destination: { platform: 'iOS Simulator', name: 'iPhone 7' })
      #
      # Returns Build.
      def initialize(options)
        OPTIONS.each do |var|
          next if var == :destination

          instance_variable_set :"@#{var}", options[var] || options[var.to_s]
        end

        @destination = destination_from(options)
      end

      # Return string of building options
      #
      # Examples
      #
      #   to_s # => "-scheme \"Project\" -configuration \"Debug\""
      #
      #   to_s # => "-workspace \"Projects/Project.workspace\" -destination \"platform=iOS Simulator,name=iPhone 7\""
      #
      # Returns String.
      def to_s
        OPTIONS
          .reject { |v| send(v).nil? }
          .map(&method(:option_string))
          .join(' ')
      end

      private

      def destination_from(options)
        destination_options = options[:destination] || options['destination']

        Destination.new(destination_options) if destination_options
      end

      def option_string(option_name)
        if option_name == :only_testing
          tests = send(option_name)

          if tests.one?
            "-only-testing:#{tests.first.gsub(' ', '\\ ')}"
          else
            "-only-testing:{#{tests.join(',').gsub(' ', '\ ')}}"
          end
        else
          "-#{option_name} \"#{send(option_name)}\""
        end
      end
    end
  end
end
