# require "rubygems"
# require "bundler"
require 'pry'

# Bundler.require :default, :test

include Rake::DSL

prompt = "irb"
cfg = YAML.load_file File.expand_path("../config/application.yml", __FILE__)

if defined? pry
  prompt = "pry"
end

def relative_dir path
  File.expand_path "../#{path}", __FILE__
end

task default: :help

task :help do
  puts <<HELP
Available rake tasks:
rake console          - Run a #{prompt} console with all environment loaded.
rake rerun            - Start a rerun server.
rake start_server     - Start the Sinatra server.
rake kill_server      - Kill the Sinatra server.
rake restart_server   - Restart the Sinatra server.
HELP
end

desc "Run a #{prompt} console with all environment loaded."
task :console do
  puts "Loading console..."
  sh "#{prompt} -r #{relative_dir "app.rb"}"
end

namespace :server do
  desc "Start a rerun server."
  task :rerun do
    puts "Starting rerun..."
    sh "rerun -b -- thin start"
  end

  desc "Start the sinatra server"
  task :start do
    puts "Starting server..."
    sh "thin start -S tmp/#{cfg["app_name"]}.sock"
  end

  desc "Kill the Sinatra server."
  task :kill do
    sh "kill -s INT \`cat #{relative_dir "tmp/pids/thin.pid"}\`"
  end

  desc "Restart the Sinatra server."
  task :restart do
    Rake::Task['server:kill'].invoke
    Rake::Task['server:start'].invoke
  end
end
