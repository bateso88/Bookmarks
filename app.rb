# frozen_string_literal: true

require 'sinatra'
require_relative 'lib/bookmark'
require_relative 'database_connection_setup'

# Bookmark manager class
class BookmarkManager < Sinatra::Base
  enable :method_override

  get '/' do
    erb :index
  end

  get '/bookmarks/add' do
    erb :'bookmarks/add'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/bookmarks' do
    Bookmark.create(title: params[:title], url: params[:url])
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

  run! if app_file == $PROGRAM_NAME
end
