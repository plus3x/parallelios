# frozen_string_literal: true

module Parallelios
  # Public: Gem version
  #
  # Examples
  #   gem_version #=> Gem::Version.new("0.1.0.alpha")
  #
  # Returns Gem::Version
  def self.gem_version
    Gem::Version.new VERSION::STRING
  end

  module VERSION
    MAJOR = 0
    MINOR = 1
    TINY  = 0
    PRE   = 'alpha'

    STRING = [MAJOR, MINOR, TINY, PRE].compact.join('.')
  end
end
