# frozen_string_literal: true

require 'bundler'
Bundler.setup
Bundler::GemHelper.install_tasks

require 'rake'

desc 'Run Specs'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task default: :spec
