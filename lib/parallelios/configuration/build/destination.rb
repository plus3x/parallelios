# frozen_string_literal: true

module Parallelios
  class Configuration
    class Build
      # Destination option of build configuration
      class Destination
        # OPTIONS contains all options implemented for destination option of building
        OPTIONS = %i(platform name os id).freeze

        attr_reader(*OPTIONS)

        # Initialize
        #
        # options - Hash of configuration options
        #
        # Examples
        #
        #   new(platform: 'iOS', id: '09143EAF-C4D6-40FD-A554-E707023B6040')
        #
        #   new(platform: 'iOS Simulator', name: 'iPhone 7')
        #
        # Returns Destination.
        def initialize(options)
          OPTIONS.each do |var|
            instance_variable_set :"@#{var}", options[var] || options[var.to_s]
          end
        end

        # Return string of building options
        #
        # Examples
        #
        #   to_s # => "platform=iOS,id=09143EAF-C4D6-40FD-A554-E707023B6040"
        #
        #   to_s # => "platform=iOS Simulator,name=iPhone 7"
        #
        # Returns String.
        def to_s
          OPTIONS
            .reject { |v| send(v).nil? }
            .map { |v| "#{v}=#{send(v)}" }
            .join(',')
        end
      end
    end
  end
end
