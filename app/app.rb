ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/data_mapper_setup.rb'

require_relative 'models/link'


class BookmarkManager < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:'links/new_link')
  end

  post '/links/new/add' do
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.create(name: params[:name])
    link.tags << tag
    link.save
    redirect :links
  end

  get '/tags/:filter_by' do
    tag = Tag.first(name: params[:filter_by])
    @links = tag ? tag.links : []
    erb :tags
  end

  post '/tags' do
    @name = params[:name]
    redirect "/tags/#{@name}"
  end

  run! if app_file == $0
end
