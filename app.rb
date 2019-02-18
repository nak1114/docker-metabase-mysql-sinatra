#!ruby -Ku
# -*- coding: utf-8 -*-

require 'rubygems'
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sinatra-websocket'

require 'json'
require 'uri'

require 'net/http'
require 'fileutils'

require 'openssl'

#require_relative './models/product'

require 'pp'

class MyApp < Sinatra::Base

  configure do
    set :server, :thin
    set :bind, '0.0.0.0'
    set :port, 3000

    register Sinatra::ActiveRecordExtension

    enable :method_override
  end
  configure :development do
    register Sinatra::Reloader
    
    also_reload '/myapp/**/*.rb'
  end

  get '/test' do
    pp settings.development?
    "ret ok"
  end

end

if $0 == __FILE__
  MyApp.run!
end

__END__
