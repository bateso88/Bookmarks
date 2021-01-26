require "bookmark"

describe Bookmark do

  subject(:bookmark) { Bookmark.new("Makers Academy", "https://makers.tech") }

  it "returns all of its instances" do
    expect(Bookmark.all.class).to eq Array
  end

  # it "has a name" do
  #   expect(bookmark.title).to eq "Makers Academy"
  # end

  it "has a URL" do
    expect(bookmark.url).to eq "https://makers.tech"
  end

end
