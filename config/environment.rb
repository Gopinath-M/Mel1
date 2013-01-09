# Load the rails application
require File.expand_path('../application', __FILE__)
require 'rake'
require 'rake/testtask'
#require 'rake/rdoctask'

#require 'tasks/rails'
require 'thinking_sphinx'
require 'thinking_sphinx/tasks'
# Initialize the rails application
Melaka::Application.initialize!
