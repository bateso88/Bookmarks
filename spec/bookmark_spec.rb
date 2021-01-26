require "bookmark"

describe Bookmark do

  # subject(:bookmark) { Bookmark.new("Makers Academy", "https://makers.tech") }

  # it "returns all of its instances" do
  #   expect(Bookmark.all.class).to eq Array
  # end

  # it "has a name" do
  #   expect(bookmark.title).to eq "Makers Academy"
  # end

  # it "has a URL" do
  #   expect(bookmark.url).to eq "https://makers.tech"
  # end

  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com')

    end
  end

end
