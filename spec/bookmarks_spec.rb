require 'bookmarks'

describe Bookmarks do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmarks.all
      expect(bookmarks).to be_an_instance_of(Array)
    end
  end
end