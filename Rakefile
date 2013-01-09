# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'
require 'rake/testtask'
#require 'rake/rdoctask'

#require 'tasks/rails'
require 'thinking_sphinx'
require 'thinking_sphinx/tasks'
include Rake::DSL
Melaka::Application.load_tasks
