require 'sinatra'
require 'mongoid'

require_relative './' + Sinatra::Application.environment.to_s

Sinatra::Application.configure do
  set :application_name, ENV[:sinatra_application] || "Sinatra Skeleton"
end

# Mongoid.load! File.expand_path '../../config/mongoid.yml', __FILE__

Dir[File.join Sinatra::Application.root, 'config/*.rb'].each {|f| require f}
Dir[File.join Sinatra::Application.root, 'lib/*.rb'].each {|f| require f}
Dir[File.join Sinatra::Application.root, 'helper/*.rb'].each {|f| require f}
Dir[File.join Sinatra::Application.root, 'models/*.rb'].each {|f| require f}
