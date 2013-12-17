require 'sinatra'
require_relative './config/application'

get '/' do
  "Hello #{settings.application_name}."
end
