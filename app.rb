# frozen_string_literal: true

require 'sinatra'
require 'sinatra/flash'
require 'uri'
require_relative 'lib/bookmark'
require_relative './lib/comment'
require_relative './lib/user'
require_relative 'database_connection_setup'

# Bookmark manager class
class BookmarkManager < Sinatra::Base
  enable :method_override, :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/bookmarks/add' do
    erb :'bookmarks/add'
  end

  get '/bookmarks' do
    @user = User.find(id: session[:user_id])
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/bookmarks' do
    flash[:notice] = "You must submit a valid URL." unless Bookmark.create(url: params[:url], title: params[:title])
    redirect('/bookmarks')
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/update' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/update'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect('/bookmarks')
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark_id = params[:id]
    erb :'comments/new'
  end

  post '/bookmarks/:id/comments' do
    Comment.create(bookmark_id: params[:id], text: params[:comment])
    redirect '/bookmarks'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/bookmarks'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect('/bookmarks')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy'do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/bookmarks')
  end 

  run! if app_file == $PROGRAM_NAME
end
