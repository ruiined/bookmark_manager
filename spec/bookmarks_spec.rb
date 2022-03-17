# frozen_string_literal: true

require 'bookmarks'

describe Bookmarks do
  subject(:bookmarks) { described_class }
  subject(:bookmarks_all) { described_class.all(bookmark_class) }
  let(:title) { 'Google' }
  let(:url) { 'http://google.com' }
  let(:bookmark_class) { double :bookmark_class, new: bookmark }
  let(:bookmark) { double :bookmark, title: title, url: url }

  describe '.all' do
    it 'returns all bookmarks' do
      expect(bookmarks_all).to be_an_instance_of(Array)
    end
  end

  describe '.add_bookmark' do
    it 'adds a bookmark' do
      bookmarks.add_bookmark(bookmark)
      expect(bookmarks_all).to include bookmark
    end
  end
end
