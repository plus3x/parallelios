# frozen_string_literal: true

module Parallelios
  # Public: Gem version
  #
  # Examples
  #
  #   gem_version #=> Gem::Version.new("0.1.0.alpha")
  #
  # Returns Gem::Version
  def self.gem_version
    Gem::Version.new VERSION::STRING
  end

  # Module contains version of gem
  module VERSION
    # Major version
    MAJOR = 0

    # Minor version
    MINOR = 1

    # Tiny version
    TINY = 0

    # Pre version
    PRE = 'alpha'

    # Complite string of version
    #
    # Examples
    #
    #   STRING #=> "0.1.0.alfa"
    #
    # Returns String
    STRING = [MAJOR, MINOR, TINY, PRE].compact.join('.')
  end
end
