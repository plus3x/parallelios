# frozen_string_literal: true

require 'simplecov'

SimpleCov.start do
  coverage_dir 'tmp/coverage'
  minimum_coverage 90
end
