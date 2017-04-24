# frozen_string_literal: true

require 'bundler/gem_tasks'

require 'rubocop/rake_task'
RuboCop::RakeTask.new

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

default_tasks = %i(spec rubocop)

if ENV['TRAVIS']
  require 'coveralls/rake/task'
  Coveralls::RakeTask.new

  default_tasks << 'coveralls:push'
end

task default: default_tasks

CLEAN.include %w(**/*.{log,pyc,rbc,tgz} doc)
