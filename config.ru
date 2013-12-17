require 'rubygems'
require 'bundler'
require 'sinatra'
require 'mongoid'
require './lib/rack/json_body_parser'
require './app.rb'

Bundler.require :default, Sinatra::Application.environment.to_sym

Slim::Engine.set_default_options tabsize: 2

use Rack::Session::Cookie,
  key: "#{Sinatra::Application.settings.application_name}_secret",
  path: '/',
  expire_after: 2592000, # 30 days
  secret: 'Icannotremembersuchasecretthusitisnotneededanymore'

use Rack::PostBodyContentTypeParser
use Rack::Mongoid::Middleware::IdentityMap

map '/assets' do
  run Sinatra::Application.settings.sprockets
end

run Sinatra::Application
