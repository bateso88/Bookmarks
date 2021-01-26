require 'sinatra'
require_relative "lib/bookmark"

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  post "/bookmarks" do
    p "inside bookmarks"
    url = params['url']
    @bookmarks = Bookmark.all
    erb :bookmarks
  end



  run! if app_file == $0
end
