# frozen_string_literal: true

require 'rake/clean'
require 'bundler/gem_tasks'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'

RuboCop::RakeTask.new
RSpec::Core::RakeTask.new

task default: :rubocop
