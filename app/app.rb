require 'sinatra/base'
require './app/models/link'
# require File.join(File.dirname('views'))

ENV['RACK_ENV'] ||= 'development'

class BookmarkManager < Sinatra::Base
  set :views, proc {File.join(root, '..', 'views')}

  get '/' do
    erb :index
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/new' do
    erb :new
  end

  post '/adding_links' do
     Link.create(url: params[:add_url], title: params[:add_title])
    redirect('/links')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
