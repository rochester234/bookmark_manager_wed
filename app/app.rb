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
    @tags = Tag.all
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
    @links = Link.all(:tags => {name: params[:filter_by]})
    erb :tags
  end

  run! if app_file == $0
end
