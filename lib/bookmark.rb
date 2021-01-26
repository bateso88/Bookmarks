require 'pg'

class Bookmark

  attr_reader :title, :url

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "bookmark_manager_test")
    else
      connection = PG.connect(dbname: "bookmark_manager")
    end
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map {|bookmark| bookmark['url']}
  end

  def initialize(title, url)
    @title = title
    @url = url
  end

end