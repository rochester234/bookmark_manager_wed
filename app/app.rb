ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/data_mapper_setup.rb'

require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'


class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

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
    @tag = Tag.create(name: params[:name])
    Link.find do |link|
      if link.title == params[:title]
        @existing_link = link
      end
    end
    if @existing_link != nil
      @existing_link.tags << @tag
      @existing_link.save
    else
        new_link = Link.create(title: params[:title], url: params[:url])
        new_link.tags << @tag
        new_link.save
    end

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

  get '/users/new' do
    erb :new_user
  end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password])
    session[:user_id] = user.id
    redirect to('/links')
  end

  run! if app_file == $0
end
