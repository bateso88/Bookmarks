require 'sinatra'
require_relative "lib/bookmark"

class BookmarkManager < Sinatra::Base

  get '/' do
    ENV
    erb :index
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  run! if app_file == $0
end
