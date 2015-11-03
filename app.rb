require 'sinatra/base'
require './lib/link'
# require File.join(File.dirname('views'))

class BookmarkManager < Sinatra::Base

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
    @google =
    redirect('/links')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
