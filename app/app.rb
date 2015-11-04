require 'sinatra'
require_relative './models/link'


class BookmarkManager < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

run! if app_file == $0

end
