ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

require_relative 'models/link'


class BookmarkManager < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/links' do
    @links = Link.all
    @tags = Tag.all
    erb(:links)
  end

  get '/links/new' do
    erb(:'links/new_link')
  end

  post '/links/new/add' do
    Link.create(title: params[:title], url: params[:url])
    Tag.create(tag: params[:tag])
    redirect :links
  end

  run! if app_file == $0
end
