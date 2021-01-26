require 'pg'

class Bookmark

  attr_reader :title, :url

  def self.all
    connection = PG.connect(dbname: 'bookmark_manager')
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map {|bookmark| bookmark['url']}
  end

  def initialize(title, url)
    @title = title
    @url = url
  end


end
